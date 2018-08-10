function output = tSolutionB(x,w,b,v,A)
    % Trial solution
    
    output = A(1) * (1 - x) + A(2) * x + x .* (1 - x) .* myNetwork(x,w,b,v);
end
