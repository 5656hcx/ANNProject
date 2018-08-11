function output = myNetwork(x,w,b,v)
    % A simple neural network
    
    output = v * sigmoid(w * x + b);
end
