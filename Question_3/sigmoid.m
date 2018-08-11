function output = sigmoid(x)
    % Sigmoid function
    
    output = 1 ./ (1 + exp(-x));
end
