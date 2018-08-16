function cost = costFunction(p,F,N,A,X,H)
    
    % RETRIEVE PARAMETERS
    
    w = p(1:H,:);
    b = p(H+1:2*H,:);
    v = p(2*H+1:3*H,:)';
    
    % COST CALCULATION
    
    syms x y dx(n);     % RESTATE SYMBOLICS
    dx = @(n)diff(tSolution(x,w,b,v,A),n);
    rhs = double(subs(eval(F),{x,y},{X,tSolution(X,w,b,v,A)}));
    lhs = double(subs(diff(tSolution(x,w,b,v,A),N),X));
    cost = sum((lhs - rhs).^2);
    % dx = apply derivatives to every dx(n) symbolics
    % rhs = dy/dx  [1st order] | d2y/dx2  [2nd order]
    % lhs = f(x,y) [1st order] | f(x,y,dy/dx)  [2nd order]
    % cost = PLEASE REFER TO EQUATION 12
    
    % DISPLAY DEBUG INFORMATION
    
    global loop;
    loop = loop + 1;
    if mod(loop,3*H) == 0
        disp(['loop: ',num2str(loop/(3*H)),' | ','error: ', num2str(cost)]);
        toc;
    end
end
