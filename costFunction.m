function [cost,network] = costFunction(x,w,b,v,H,N)
    % x = vector of the input
    % w = weight of hidden nodes
    % b = bias of hidden nodes
    % v = weight of output nodes
    % N = number of the input
    % H = number of hidden nodes(1-layer)
    
    network = zeros(1,N);
    network_d = zeros(1,N);
    for i = 1:H
        temp = zeros(1,N);
        for j = 1:N
            temp(j) = w(i) * x(j) + b(i);
        end
        network = network + v(i) * sigmoid(temp);
        network_d = network_d + v(i) * w(i) * sigmoid_d(temp);
    end
    cost = sum((network + x .* network_d - rhs(x)).^2);
end

