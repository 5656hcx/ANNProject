function trial()
    
    % network parameters %
    
    A = 0;              % psy(0) = 0
    N = 10;             % #[input values]
    H = 10;             % #[hidden nodes]
    x = 0:2/(N-1):2;    % [input values]
    
    learning_rate = 0.01;
    num_iteration = 1e+2;
    err_precision = 1e-3;
    
    w = randn(H,1);
    b = zeros(H,1);
    v = randn(1,H);
    
    grad_w = zeros(H,1);
    grad_b = zeros(H,1);
    grad_v = zeros(1,H);
    
    % trainning process %
    
    tic;
    syms w_ b_ v_;
    for loop=1:num_iteration
        
        tmp_w = [w;w_]; tmp_w = tmp_w(1:H);
        tmp_b = [b;b_]; tmp_b = tmp_b(1:H);
        tmp_v = [v,v_]; tmp_v = tmp_v(1:H);
        
        for i=1:H
            
            tmp_w(i) = w_; tmp_b(i) = b_; tmp_v(i) = v_;
			
            grad_w(i) = subs(diff(costFunction(x,tmp_w,b,v,A),w_),w_,w(i));
            grad_b(i) = subs(diff(costFunction(x,w,tmp_b,v,A),b_),b_,b(i));
            grad_v(i) = subs(diff(costFunction(x,w,b,tmp_v,A),v_),v_,v(i));
			
            tmp_w(i) = w(i); tmp_b(i) = b(i); tmp_v(i) = v(i);
        end
        
        w = w - learning_rate * grad_w; 
        b = b - learning_rate * grad_b; 
        v = v - learning_rate * grad_v; 
        
        cost = costFunction(x,w,b,v,A);
        disp(['loop: ',num2str(loop),' | ','error: ', num2str(cost)]);
        toc;
        
        if cost < err_precision
            break;
        end
    end
    
    % output illustration %
    
    predict_x = 0:2/19:2;
    [cost,result] = costFunction(predict_x,w,b,v,A);
    
    plot(predict_x,result .* (predict_x),'r-o');
    hold on;
    plot(predict_x,analytic(predict_x), 'b-x');
    disp(cost);
end