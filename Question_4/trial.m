    % trainning process %
    % 100 iterations would take about 300 to 600 seconds %
    
    x = 0:3/9:3;
    H = 10;
    P = [randn(H,1);zeros(H,1);randn(H,1)];
    P = [P;P];
    
    tic;
    options = optimset('Display','final','HessUpdate','bfgs','MaxIter',100);
    cost = fminunc(@(p)(costFunction(x,p,H)),P,options);
    %disp(cost);
    
    %w = output(1:H,:);
    %b = output(H+1:2*H,:);
    %v = output(2*H+1:3*H,:)';
    
    % output illustration %
    
    %pred_x = 0:4/19:4;
    %plot(pred_x,tSolution(pred_x,w,b,v,A),'r-o');
    %hold on;
    %plot(pred_x,analytical(pred_x),'b-x');
