function output = tSolution(x,w,b,v,A)
    % Trial solution
    
    type = size(A);
    if type(1) == 1
        output = A(1) + A(2) * x + (x.^2) .* myNetwork(x,w,b,v);
    else 
        output = A(1) * (1 - x) + A(2) * x + x .* (1 - x) .* myNetwork(x,w,b,v);
    end
end
