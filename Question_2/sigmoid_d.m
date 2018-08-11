function output = sigmoid_d(input)
    
    output = sigmoid(input) .* (1 - sigmoid(input));
end
