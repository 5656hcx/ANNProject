function output = tSolutionA(x,w,b,v,A)
    % Trial solution
    
    output = A(1) + A(2) * x + (x.^2) .* myNetwork(x,w,b,v);
end
