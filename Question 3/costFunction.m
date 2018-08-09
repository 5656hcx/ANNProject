function [cost,grads] = costFunction(x,p,A)
    
    N = length(x);
    len = length(p)/3;
    w = p(1:len,:);
    b = p(len+1:2*len,:);
    v = p(2*len+1:3*len,:)';
    
    
    grad_w = zeros(size(w));
    grad_b = zeros(size(b));
    grad_v = zeros(size(v));
    
    d_1 = diff(tSolution(sym('x'),w,b,v,A),1);
    d_2 = diff(tSolution(sym('x'),w,b,v,A),2);
    
    cost = 0;
    for j=1:N
        tmp_1d = double(subs(d_1,x(j)));
        tmp_2d = double(subs(d_2,x(j)));
        tmp_cost = tmp_2d + 1/5 * tmp_1d + tSolution(x(j),w,b,v,A) + xFunction(x(j));
        cost = cost + tmp_cost^2;
    end
    grads = [grad_w;grad_b;grad_v'];
    toc;
end
