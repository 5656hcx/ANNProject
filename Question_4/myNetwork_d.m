function output = myNetwork_d(x,w,b,v)
    
    output = v * (w .* sigmoid_d(w * x + b));
end
