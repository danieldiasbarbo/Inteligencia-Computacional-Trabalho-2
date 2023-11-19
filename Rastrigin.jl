using Base.MathConstants

function rastrigin(x)
    d = length(x)

    somatorio = 0

    for xi in x
        somatorio += xi^2 - 10*cos(2*pi*xi)
    end

    return 10*d + somatorio
end