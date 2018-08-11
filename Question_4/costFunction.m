function cost = costFunction(x,p,H)
    
    A = [0,1];
    w1 = p(1:H,:);
    b1 = p(H+1:2*H,:);
    v1 = p(2*H+1:3*H,:)';
    w2 = p(3*H+1:4*H,:);
    b2 = p(4*H+1:5*H,:);
    v2 = p(5*H+1:6*H,:)';
    
    rhs1 = cos(x) - (1 + x.^2 + sin(x).^2);
    rhs2 = 2 * x - (1 + x.^2) .* sin(x);
    
    cost1 = myNetwork(x,w1,b1,v1) + x .* myNetwork_d(x,w1,b1,v1) - tSolution(x,w1,b1,v1,A(1)).^2 - tSolution(x,w2,b2,v2,A(2)) - rhs1;
    cost2 = myNetwork(x,w2,b2,v2) + x .* myNetwork_d(x,w2,b2,v2) - tSolution(x,w1,b1,v1,A(1)) .* tSolution(x,w2,b2,v2,A(2)) - rhs2;
    cost = sum(cost1 + cost2);
end

