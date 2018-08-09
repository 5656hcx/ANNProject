function output = xFunction(x)
    % F(x) part of the specific ODE
    
    output = -1/5 * exp(-x/5) .* cos(x);
end
