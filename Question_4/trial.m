    
    % parameters %
    
    x = 0:3/9:3;
    H = 10;
    P1 = [randn(H,1);zeros(H,1);randn(H,1)];
    P2 = [randn(H,1);zeros(H,1);randn(H,1)];
    init_P = [P1;P2];

    % trainning process %
    % 100 iterations would take about 300 to 600 seconds %
    
    tic;
    options = optimset('Display','final','HessUpdate','bfgs','MaxFunEval',6e+5,'MaxIter',4e+4);
    [output,cost] = fminunc(@(p)(costFunction(x,p,H)),init_P,options);
    disp(cost);
    
    w1 = output(1:H,:);
    b1 = output(H+1:2*H,:);
    v1 = output(2*H+1:3*H,:)';
    w2 = output(3*H+1:4*H,:);
    b2 = output(4*H+1:5*H,:);
    v2 = output(5*H+1:6*H,:)';
    
    % output illustration %
    
    plot(x,tSolution(x,w1,b1,v1,0)-sin(x),'g-+'); hold on;
    plot(x,tSolution(x,w2,b2,v2,1)-(1+x.^2),'g--'); hold off;