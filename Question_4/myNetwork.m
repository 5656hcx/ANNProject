function output = myNetwork(x,w,b,v)
    
    output = v * sigmoid(w * x + b);
end
