function trial()

    % network parameters %

    A = [0,1];          % initial conditions
    N = 10;             % #[input values]
    H = 10;             % #[hidden nodes]
    x = 0:2/(N-1):2;    % [input vector]
    
    init_param = [randn(H,1);zeros(H,1);randn(H,1)];
    
    % trainning process %
    % 100 iterations would take 300 to 600 seconds %
    
    tic;
    options = optimset('Display','off','HessUpdate','bfgs','MaxIter',100);
    output = fminunc(@(p)(costFunction(x,p,A,H)),init_param,options);
    
    w = output(1:N,:);
    b = output(N+1:2*N,:);
    v = output(2*N+1:3*N,:)';
    
    % output illustration %
    
    pred_x = 0:2/19:2;
    plot(pred_x,tSolution(pred_x,w,b,v,A),'r-o');
    hold on;
    plot(pred_x,analytical(pred_x),'b-x');
end
