function [cost,network] = costFunction(x,w,b,v,A)
    % x = vector of the input
    % w = weight of hidden nodes
    % b = bias of hidden nodes
    % v = weight of output nodes
    
    network = v * sigmoid(w * x + b);
    network_d = v * (w .* sigmoid_d(w * x + b));
    cost = sum((network + x .* network_d + 1/5 * (A + x .* network) - rhs(x)).^2);
    
end
