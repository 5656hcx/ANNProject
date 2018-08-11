function output = tSolution_d(x,w,b,v)
    
    output = myNetwork(x,w,b,v) + x .* (v * (w .* sigmoid_d(w * x + b)));
end
