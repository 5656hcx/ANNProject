function output = rhs(input)

    output = exp(-input./5) .* cos(input) - 1/5 .* analytic(input);
end
