#!/usr/bin/env python
import os
import sys
import argparse
from SmithWagnerCV import SaveSimulationTable
from multiprocessing import freeze_support


def main():
    os.chdir(os.path.dirname(os.path.abspath(sys.argv[0])))
    os.getcwd()
    numoptions = 4.0
    # Set class sizes and list of mu values 
    classSize = [15, 20, 25, 30, 35, 40, 45, 50, 60, 70, 80, 90, 100, 150, 200, 250, 300]
    muList = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8]


    parser = argparse.ArgumentParser(description='Simulate WW')
    parser.add_argument('--options', type=float, default=4.0, help='Number of options for each question',dest="opts")
    parser.add_argument('--classSizes', nargs='*', dest='classSizes', type=int, help='List of class sizes separated by spaces')
    parser.add_argument('--muS', nargs='*', dest='muS', type=float, help='List of mu values separated by spaces')

    parseresults = parser.parse_args()

    if parseresults.opts>0:
        numoptions = parseresults.opts
    
    if parseresults.classSizes:
        classSize = list(parseresults.classSizes)

    if parseresults.muS:
        muList = list(parseresults.muS)

    SaveSimulationTable(classSize, muList, numoptions)

if __name__ == '__main__':
    freeze_support()
    main()
