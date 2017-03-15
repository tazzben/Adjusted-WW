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

numoptions = 4

parser = argparse.ArgumentParser(description='Simulate WW')
parser.add_argument('--options', type=int, default=4, help='Number of options for each question',dest="opts")

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



dgamma = pd.DataFrame(columns=('mu', 'class', 'q01','q025','q05','q1','q9','q95','q975','q99'))
dmu = pd.DataFrame(columns=('mu', 'class', 'q01','q025','q05','q1','q9','q95','q975','q99'))
dalpha = pd.DataFrame(columns=('mu', 'class', 'q01','q025','q05','q1','q9','q95','q975','q99'))
dflow = pd.DataFrame(columns=('mu', 'class', 'q01','q025','q05','q1','q9','q95','q975','q99'))

for cs in [15,20,25,30,35,40,45,50,60,70,80,90,100,150,200,250,300]:
    for cmu in [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8]:
        global mu
        mu = cmu
        print 'Simulation Class: ' + str(cs) + ' mu: ' + str(mu) + ' with ' + str(numoptions) + ' options'
        r = Simulation(cs)
        rgamma = {'mu':mu, 'class':cs, 'q01':r['gamma'].quantile(q=.01), 'q025':r['gamma'].quantile(q=.025), 'q05':r['gamma'].quantile(q=.05),'q1':r['gamma'].quantile(q=.1),'q9':r['gamma'].quantile(q=.90),'q95':r['gamma'].quantile(q=.95),'q975':r['gamma'].quantile(q=.975),'q99':r['gamma'].quantile(q=.99)}
        rmu = {'mu':mu, 'class':cs, 'q01':r['mu'].quantile(q=.01), 'q025':r['mu'].quantile(q=.025), 'q05':r['mu'].quantile(q=.05), 'q1':r['mu'].quantile(q=.1), 'q9':r['mu'].quantile(q=.90), 'q95':r['mu'].quantile(q=.95),'q975':r['mu'].quantile(q=.975), 'q99':r['mu'].quantile(q=.99)}
        ralpha = {'mu':mu,'class':cs,'q01':r['alpha'].quantile(q=.01),'q025':r['alpha'].quantile(q=.025),'q05':r['alpha'].quantile(q=.05),'q1':r['alpha'].quantile(q=.1),'q9':r['alpha'].quantile(q=.90),'q95':r['alpha'].quantile(q=.95),'q975':r['alpha'].quantile(q=.975),'q99':r['alpha'].quantile(q=.99)}
        rflow = {'mu':mu,'class':cs,'q01':r['flow'].quantile(q=.01),'q025':r['flow'].quantile(q=.025),'q05':r['flow'].quantile(q=.05),'q1':r['flow'].quantile(q=.1),'q9':r['flow'].quantile(q=.90),'q95':r['flow'].quantile(q=.95),'q975':r['flow'].quantile(q=.975),'q99':r['flow'].quantile(q=.99)}
        dgamma = dgamma.append(rgamma,ignore_index=True)
        dmu = dmu.append(rmu,ignore_index=True)
        dalpha = dalpha.append(ralpha,ignore_index=True)
        dflow = dflow.append(rflow,ignore_index=True)


dgamma.to_csv('GammaResults.csv')
dmu.to_csv('MuResults.csv')
dalpha.to_csv('AlphaResults.csv')
dflow.to_csv('FlowResults.csv')
