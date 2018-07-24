#!/usr/bin/env python
from __future__ import division, print_function, absolute_import
import os
import sys
import csv
import numpy
import pandas as pd
import argparse
from multiprocessing import Pool
from itertools import product



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

def GuessPre(x,numoptions):
    if x['pretest']==1:
        return 1
    if x['guesspre'] <= 1.0/numoptions:
        return 1
    else:
        return 0

def GuessPost(x,numoptions):
    if x['posttest']==1:
        return 1
    if x['guesspost'] <= 1.0/numoptions:
        return 1
    else:
        return 0

Known = lambda x, mu: 1 if x['draw'] <= mu else 0
NL = lambda x: 1 if x['posttest']==0 and x['pretest']==1 else 0
PL = lambda x: 1 if x['posttest']==1 and x['pretest']==0 else 0
ZL = lambda x: 1 if x['posttest']==0 and x['pretest']==0 else 0
RL = lambda x: 1 if x['posttest']==1 and x['pretest']==1 else 0

def GenerateClass(students,mu,numoptions):
    df = pd.DataFrame({'draw':numpy.random.uniform(0,1,students).tolist(),'guesspre':numpy.random.uniform(0,1,students).tolist(),'guesspost':numpy.random.uniform(0,1,students).tolist(),'pretest':0,'posttest':0,'pl':0,'nl':0,'zl':0,'rl':0})
    df['pretest'] = df.apply(Known, axis=1, args=(mu,))
    df['posttest'] = df['pretest']
    df['pretest'] = df.apply(GuessPre, axis=1, args=(numoptions,))
    df['posttest'] = df.apply(GuessPost, axis=1, args=(numoptions,))
    df['pl'] = df.apply(PL, axis=1)
    df['nl'] = df.apply(NL, axis=1)
    df['zl'] = df.apply(ZL, axis=1)
    df['rl'] = df.apply(RL, axis=1)
    return (df['pl'].mean(),df['nl'].mean(),df['zl'].mean(),df['rl'].mean())

def Simulation(csize,mu,numoptions,R):
    world = pd.DataFrame(columns=('pl', 'nl', 'zl','rl','gamma','alpha','mu','flow','gain'))
    for i in range(R):
        pl, nl, zl, rl = GenerateClass(csize,mu,numoptions)
        emu = ((nl+rl)-1)/(numoptions-1)+nl+rl
        egamma = (numoptions*(nl+pl*numoptions+rl-1))/((numoptions-1)**2)
        ealpha = (numoptions*(nl*numoptions+pl+rl-1))/((numoptions-1)**2)
        eflow = (numoptions*(pl-nl))/(numoptions-1)
        if emu == 1:
            egain = numpy.inf
        else:
            egain = egamma/(1-emu)
        world.loc[i] = [pl,nl,zl,rl,egamma,ealpha,emu,eflow,egain]
    return world



def ManageProcess(row):
    cs = row['cs']
    mu = row['mu']
    R = row['R']
    numoptions = row['numoptions']
    print('Simulation Class: ' + str(cs) + ' mu: ' + str(mu) + ' with ' + str(numoptions) + ' options')
    r = Simulation(cs,mu,numoptions,R)
    
    ng =  r[r['gain'] <= r['gain'].quantile(q=.90)]
    ng = ng.sort_values(['gain','mu'], ascending=[False,True])
    ning = ng.iloc[0]['gain']
    
    ng =  r[r['gain'] <= r['gain'].quantile(q=.95)]
    ng = ng.sort_values(['gain','mu'], ascending=[False,True])
    ninfg = ng.iloc[0]['gain']
    
    rgain = {'mu':mu, 'class':cs, 'q90':ning, 'q95':ninfg, 'ci25':r['mu'].quantile(q=.025), 'ci975':r['mu'].quantile(q=.975)}
    
    
    ng =  r[r['gamma'] <= r['gamma'].quantile(q=.90)]
    ng = ng.sort_values(['gamma','mu'], ascending=[False,True])
    ning = ng.iloc[0]['gamma']
    ng =  r[r['gamma'] <= r['gamma'].quantile(q=.95)]
    ng = ng.sort_values(['gamma','mu'], ascending=[False,True])
    ninfg = ng.iloc[0]['gamma']
    
    
    rgamma = {'mu':mu, 'class':cs, 'q90':ning, 'q95':ninfg, 'ci25':r['mu'].quantile(q=.025), 'ci975':r['mu'].quantile(q=.975)}
    
    
    ng =  r[r['alpha'] <= r['alpha'].quantile(q=.90)]
    ng = ng.sort_values(['alpha','mu'], ascending=[False,True])
    ning = ng.iloc[0]['alpha']
    
    ng =  r[r['alpha'] <= r['alpha'].quantile(q=.95)]
    ng = ng.sort_values(['alpha','mu'], ascending=[False,True])
    ninfg = ng.iloc[0]['alpha']
    
    
    ralpha = {'mu':mu, 'class':cs, 'q90':ning, 'q95':ninfg, 'ci25':r['mu'].quantile(q=.025), 'ci975':r['mu'].quantile(q=.975)}
    
    ng =  r[r['flow'] <= r['flow'].quantile(q=.90)]
    ng = ng.sort_values(['flow','mu'], ascending=[False,True])
    ning = ng.iloc[0]['flow']
    
    
    ng =  r[r['flow'] <= r['flow'].quantile(q=.95)]
    ng = ng.sort_values(['flow','mu'], ascending=[False,True])
    ninfg = ng.iloc[0]['flow']
    
    rflow = {'mu':mu, 'class':cs, 'q90':ning, 'q95':ninfg, 'ci25':r['mu'].quantile(q=.025), 'ci975':r['mu'].quantile(q=.975)}
    return {'gain':rgain, 'gamma':rgamma, 'alpha':ralpha, 'flow':rflow}



classSize = [15,20,25,30,35,40,45,50,60,70,80,90,100,150,200,250,300]
muList = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8]
R = 10000
combs=pd.DataFrame(list(product(classSize,muList)), columns=['cs', 'mu'])
combs['R']=R
combs['numoptions']=numoptions
interList = []
for _, row in combs.iterrows():
    interList.append({'cs':row['cs'].astype(int),'mu':row['mu'].astype(float),'R':row['R'].astype(int),'numoptions':row['numoptions'].astype(int)})

p = Pool()
r = p.map(ManageProcess, interList)
p.close()
p.join()

dgamma = pd.DataFrame(columns=('mu', 'class', 'q90','q95','ci25','ci975'))
dalpha = pd.DataFrame(columns=('mu', 'class', 'q90','q95','ci25','ci975'))
dflow = pd.DataFrame(columns=('mu', 'class', 'q90','q95','ci25','ci975'))
dgain = pd.DataFrame(columns=('mu', 'class', 'q90','q95','ci25','ci975'))

for row in r:
    dgamma = dgamma.append(row['gamma'],ignore_index=True)
    dalpha = dalpha.append(row['alpha'],ignore_index=True)
    dflow = dflow.append(row['flow'],ignore_index=True)
    dgain = dgain.append(row['gain'],ignore_index=True)

dgamma.to_csv('GammaResults.csv')
dalpha.to_csv('AlphaResults.csv')
dflow.to_csv('FlowResults.csv')
dgain.to_csv('GainResults.csv')