function cost = costFunction(x,p,A,H)
    
    w = p(1:H,:);
    b = p(H+1:2*H,:);
    v = p(2*H+1:3*H,:)';
    
    syms x_;
    dx_1 = double(subs(diff(tSolution(x_,w,b,v,A),1),x));
    dx_2 = double(subs(diff(tSolution(x_,w,b,v,A),2),x));
    cost = sum((dx_2 + 1/5 * dx_1 + tSolution(x,w,b,v,A) - xFunction(x)).^2);
    
    global eval;
    eval = eval + 1;
    disp(['eval: ',num2str(eval),' | ','error: ', num2str(cost)]);
    toc;
end
