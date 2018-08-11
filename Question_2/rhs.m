function output = rhs(input)

    output = exp(-input./5) .* cos(input);
end
