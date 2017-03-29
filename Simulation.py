#!/usr/bin/env python
from __future__ import division
import optparse
import os
import platform
import sys
import codecs
import csv
import numpy
import operator
import numpy as np
import math
import logging
import pandas as pd
from patsy import dmatrices
from scipy import stats
import argparse



os.chdir(os.path.dirname(os.path.abspath(sys.argv[0])))
os.getcwd()
trash = numpy.random.uniform(0,1,10000)
trash = None

numoptions = 4.0

parser = argparse.ArgumentParser(description='Simulate WW')
parser.add_argument('--options', type=float, default=4.0, help='Number of options for each question',dest="opts")

parseresults = parser.parse_args()

if parseresults.opts>0:
    numoptions = parseresults.opts


def Known(x):
    global numoptions
    global mu
    if x['draw'] <= mu:
        return 1
    else:
        return 0

def GuessPre(x):
    global numoptions
    if x['pretest']==1:
        return 1
    if x['guesspre'] <= 1.0/numoptions:
        return 1
    else:
        return 0

def GuessPost(x):
    global numoptions
    if x['posttest']==1:
        return 1
    if x['guesspost'] <= 1.0/numoptions:
        return 1
    else:
        return 0

def NL(x):
    if x['posttest']==0 and x['pretest']==1:
        return 1
    else:
        return 0

def PL(x):
    if x['posttest']==1 and x['pretest']==0:
        return 1
    else:
        return 0

def ZL(x):
    if x['posttest']==0 and x['pretest']==0:
        return 1
    else:
        return 0

def RL(x):
    if x['posttest']==1 and x['pretest']==1:
        return 1
    else:
        return 0

def GenerateClass(students):
    df = pd.DataFrame({'draw':numpy.random.uniform(0,1,students).tolist(),'guesspre':numpy.random.uniform(0,1,students).tolist(),'guesspost':numpy.random.uniform(0,1,students).tolist(),'pretest':0,'posttest':0,'pl':0,'nl':0,'zl':0,'rl':0})
    df['pretest'] = df.apply(Known, axis=1)
    df['posttest'] = df['pretest']
    df['pretest'] = df.apply(GuessPre, axis=1)
    df['posttest'] = df.apply(GuessPost, axis=1)
    df['pl'] = df.apply(PL, axis=1)
    df['nl'] = df.apply(NL, axis=1)
    df['zl'] = df.apply(ZL, axis=1)
    df['rl'] = df.apply(RL, axis=1)
    return (df['pl'].mean(),df['nl'].mean(),df['zl'].mean(),df['rl'].mean())

def Simulation(csize):
    global mu
    global numoptions
    world = pd.DataFrame(columns=('pl', 'nl', 'zl','rl','gamma','alpha','mu','flow'))
    for i in range(10000):
        pl, nl, zl, rl = GenerateClass(csize)
        emu = ((nl+rl)-1)/(numoptions-1)+nl+rl
        egamma = (numoptions*(nl+pl*numoptions+rl-1))/((numoptions-1)**2)
        ealpha = (numoptions*(nl*numoptions+pl+rl-1))/((numoptions-1)**2)
        eflow = (numoptions*(pl-nl))/(numoptions-1)
        world.loc[i] = [pl,nl,zl,rl,egamma,ealpha,emu,eflow]
    return world



dgamma = pd.DataFrame(columns=('mu', 'class', 'q90','q95','ci25','ci975'))
dalpha = pd.DataFrame(columns=('mu', 'class', 'q90','q95','ci25','ci975'))
dflow = pd.DataFrame(columns=('mu', 'class', 'q90','q95','ci25','ci975'))


for cs in [15,20,25,30,35,40,45,50,60,70,80,90,100,150,200,250,300]:
    for cmu in [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8]:
        global mu
        mu = cmu
        print 'Simulation Class: ' + str(cs) + ' mu: ' + str(mu) + ' with ' + str(numoptions) + ' options'
        r = Simulation(cs)

        ng =  r[r['gamma'] <= r['gamma'].quantile(q=.90)]
        ng = ng.sort_values(['gamma','mu'], ascending=[False,True])
        ning = ng.iloc[0]['gamma']


        ng =  r[r['gamma'] <= r['gamma'].quantile(q=.95)]
        ng = ng.sort_values(['gamma','mu'], ascending=[False,True])
        ninfg = ng.iloc[0]['gamma']


        rgamma = {'mu':mu, 'class':cs, 'q90':ning, 'q95':ninfg, 'ci25':r['mu'].quantile(q=.025), 'ci975':r['mu'].quantile(q=.975)}
        dgamma = dgamma.append(rgamma,ignore_index=True)


        ng =  r[r['alpha'] <= r['alpha'].quantile(q=.90)]
        ng = ng.sort_values(['alpha','mu'], ascending=[False,True])
        ning = ng.iloc[0]['alpha']

        ng =  r[r['alpha'] <= r['alpha'].quantile(q=.95)]
        ng = ng.sort_values(['alpha','mu'], ascending=[False,True])
        ninfg = ng.iloc[0]['alpha']


        ralpha = {'mu':mu, 'class':cs, 'q90':ning, 'q95':ninfg, 'ci25':r['mu'].quantile(q=.025), 'ci975':r['mu'].quantile(q=.975)}
        dalpha = dalpha.append(ralpha,ignore_index=True)

        ng =  r[r['flow'] <= r['flow'].quantile(q=.90)]
        ng = ng.sort_values(['flow','mu'], ascending=[False,True])
        ning = ng.iloc[0]['flow']


        ng =  r[r['flow'] <= r['flow'].quantile(q=.95)]
        ng = ng.sort_values(['flow','mu'], ascending=[False,True])
        ninfg = ng.iloc[0]['flow']

        rflow = {'mu':mu, 'class':cs, 'q90':ning, 'q95':ninfg, 'ci25':r['mu'].quantile(q=.025), 'ci975':r['mu'].quantile(q=.975)}
        dflow = dflow.append(rflow,ignore_index=True)


dgamma.to_csv('GammaResults.csv')
dalpha.to_csv('AlphaResults.csv')
dflow.to_csv('FlowResults.csv')
