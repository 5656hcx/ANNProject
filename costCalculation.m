function cost = costCalculation(p,F,N,A,X,H)
    % Error calculation

    w = p(1:H,:);
    b = p(H+1:2*H,:);
    v = p(2*H+1:3*H,:)';
    
    syms x y dx(n);
    dx = @(n)diff(tSolution(x,w,b,v,A),n);
    rhs = double(subs(eval(F),{x,y},{X,tSolution(X,w,b,v,A)}));
    lhs = double(subs(diff(tSolution(x,w,b,v,A),N),X));
    cost = abs(lhs - rhs);
end
