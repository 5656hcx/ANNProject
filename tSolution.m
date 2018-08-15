function output = tSolution(X,w,b,v,A)
    % Trial solution
    
    type = size(A);
    if type(1) == 1 && type(2) == 1
        output = A + X .* myNetwork(X,w,b,v);
    else
        switch type(1)
            case 1
                output = A(1) + A(2) * X + (X.^2) .* myNetwork(X,w,b,v);
            case 2
                output = A(1) * (1 - X) + A(2) * X + X .* (1 - X) .* myNetwork(X,w,b,v);
        end
    end
end
