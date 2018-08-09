% network parameters %

A = [0,1];          % initial conditions
N = 10;             % #[input values]
H = 10;             % #[hidden nodes]
x = 0:2/(N-1):2;    % [input vector]

init_param = [randn(H,1);zeros(H,1);randn(H,1)];

% trainning process %

tic;
options = optimset('Display','off','GradObj','off','HessUpdate','bfgs','MaxIter',10);
[opt_param,cost,exit_flag] = fminunc(@(p)(costFunction(x,p,A)),init_param,options);

% output illustration %

w = opt_param(1:N,:);
b = opt_param(N+1:2*N,:);
v = opt_param(2*N+1:3*N,:)';

pred_x = 0:2/19:2;
plot(pred_x,tSolution(pred_x,w,b,v,A),'r-o');
hold on;
plot(pred_x,analytical(pred_x),'b-x');