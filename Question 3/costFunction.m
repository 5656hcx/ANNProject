function cost = costFunction(x,p,A)
    
    N = length(x);
    H = length(p)/3;
    w = p(1:H,:);
    b = p(H+1:2*H,:);
    v = p(2*H+1:3*H,:)';
    
    d_1 = diff(tSolution(sym('x'),w,b,v,A),1);
    d_2 = diff(tSolution(sym('x'),w,b,v,A),2);
    
    cost = 0;
    for j=1:N
        tmp_1d = double(subs(d_1,x(j)));
        tmp_2d = double(subs(d_2,x(j)));
        tmp_cost = tmp_2d + 1/5 * tmp_1d + tSolution(x(j),w,b,v,A) - xFunction(x(j));
        cost = cost + tmp_cost^2;
    end
    
    toc;
    disp(cost);
end
