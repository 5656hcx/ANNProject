# ANNProject
### A Simple Neural Network implemented in MATLAB to solve Differential Equations
- - - -
##### Usages:
1. >> [w,b,v] = trial(n);
2. >> answer = tSolution(X,w,b,v,A);

##### Known issues (2018.08.15):
1. Q4 can not provide stable and precise solution
2. For each new input the NN has to be re-trained completely
3. For new type of ODEs the format of trial solution has to be specified
4. The performance of trial solver drops quickly when the order of ODEs increases
5. The performance of trial solver drops quickly when the number of hidden nodes increases