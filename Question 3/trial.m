function trial(x,A,H)
    
    global eval;
    eval = 0;
    
    % trainning process %
    % 100 iterations would take about 300 to 600 seconds %
    
    tic;
    init_param = [randn(H,1);zeros(H,1);randn(H,1)];
    options = optimset('Display','final','HessUpdate','bfgs','MaxIter',100);
    [output,cost] = fminunc(@(p)(costFunction(x,p,A,H)),init_param,options);
    disp(cost);
    
    w = output(1:H,:);
    b = output(H+1:2*H,:);
    v = output(2*H+1:3*H,:)';
    
    % output illustration %
    
    pred_x = 0:4/19:4;
    type = size(A);
    if type(1) == 1
        plot(pred_x,tSolutionA(pred_x,w,b,v,A),'r-o');
    else
        plot(pred_x,tSolutionB(pred_x,w,b,v,A),'r-o');
    end
    hold on;
    plot(pred_x,analytical(pred_x),'b-x');
end
