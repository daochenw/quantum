# quantum
This is a MATLAB program written to complete research project at CQCL (summer 2015). The original purpose of this program is to study Kleinmann et al's paper "Memory cost of quantum contexuality" (arXiv:1007.3650v2), and in particular to extend Theorem 3 by determining the precise memory cost of simulating both contextuality and compatibility conditions within the extended Peres-Mermin square via a (classical) cellular automaton (CA). Here, memory is defined as the number of CA states. It currently searches through all possible CA using a depth-first recursive backtracking algorithm aided by various combinatorial arguments that place further constraints. 

Results: currently it cannot serve its original purpose of extending Theorem 3 but it is able to prove both Theorems 2 and 3. I recently realised the algorithm may be significantly improved by incorporating constraint propagation and will work on this aspect when there is sufficient spare time. 

To start playing with it, type "loadconstraints" followed by "example" in the MATLAB command window. The main program is "automp".
