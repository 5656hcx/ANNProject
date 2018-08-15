function trial(H)
    
    global funEval;
    funEval = 0;
    
    syms x y dx(n);
    % x = independent variable
    % y = unknown function depends on x
    % dx(n) = nth order derivative of y
    % Therefore the Question 3(BVP) can be coded as
    % -1/5 * exp(-x/5) .* cos(x) - 1/5 * dx(1) - y
    % with A = [0;sin(1)*exp(-1/5)]
    
    % parameters and inputs %
    
    N = input('Exponent: ');            % Nth order ODE
    F = input('ODE(x,y,dx...): ');      % ODE itself
    A = input('IC/BC(A): ');            % Initial/Boundary condition
    X = input('X: ');                   % Input value or vector
    
    param = [randn(H,1);zeros(H,1);randn(H,1)];     % initial parameters
    
    % trainning process %
    
    tic;
    options = optimset('Display','final','HessUpdate','bfgs');
    [param,cost] = fminunc(@(p)(costFunction(p,F,N,A,X,H)),param,options);
    disp(cost);
    
    w = param(1:H,:);                   % retrieve training result
    b = param(H+1:2*H,:);
    v = param(2*H+1:3*H,:)';
    
    % output illustration %
    
    pred_x = 0:4/19:4;                  % testing sample
    plot(pred_x,tSolution(pred_x,w,b,v,A),'r-x'); hold on;
    error = arrayfun(@(sample)(costFunction(param,F,N,A,sample,H)),pred_x);
    plot(pred_x,error,'b-d'); hold off;
end
