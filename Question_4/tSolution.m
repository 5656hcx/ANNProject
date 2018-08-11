function output = tSolution(x,w,b,v,A)
    
    output = A + x .* myNetwork(x,w,b,v);
end
