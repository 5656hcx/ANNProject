function output = tSolution(X,w,b,v,A)
    % Trial solution
    
    output = 0;
    [d,l] = size(A);
    if d == 1
        for i=1:l
            output = output + A(i) * X.^(i-1);
        end
        output = output + (X.^l) .* myNetwork(X,w,b,v);
    else
        output = A(1) * (1 - X) + A(2) * X + X .* (1 - X) .* myNetwork(X,w,b,v);
    end
end
