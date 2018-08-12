function trial()

    % parameters %
    
    iter = 100;
    tol = 1e-6;
    x = 0:3/9:3;
    H = 3;
    P1 = [randn(H,1);zeros(H,1);randn(H,1)];
    P2 = [randn(H,1);zeros(H,1);randn(H,1)];
    param = [P1;P2];
    
    % trainning process %
    
    tic;
    options = optimset('Display','off','HessUpdate','bfgs');
    for i = 1:iter
        [param,cost1] = fminunc(@(p)(costFunction(x,p,H)),param,options);
        disp(cost1);
        [param,cost2] = fminunc(@(p)(costFunction(x,p,H)),param,options);
        if abs(cost2 - cost1) < tol
            break;
        end
        disp(cost2);
    end
    
    w1 = param(1:H,:);
    b1 = param(H+1:2*H,:);
    v1 = param(2*H+1:3*H,:)';
    w2 = param(3*H+1:4*H,:);
    b2 = param(4*H+1:5*H,:);
    v2 = param(5*H+1:6*H,:)';
    
    % output illustration %
    
    hold on;
    plot(x,tSolution(x,w1,b1,v1,0),'r-o');
    plot(x,sin(x),'r-x');
    plot(x,tSolution(x,w2,b2,v2,1),'b-o');
    plot(x,1+x.^2,'b-x');
    hold off;
end