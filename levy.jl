using Base.MathConstants

function levy(x)
    d = length(x)
    primeiro_termo = sin(pi * w(x, 1))^2

    somatorio = 0
     for i in 1:d-1
        t1 = (w(x, i) - 1)^2
        t2 = 1 + 10 * (sin(pi * w(x, i) + 1)^2)
        t3 = (w(x,d) - 1)^2
        t4 = 1 + sin(2* pi * w(x, d) + 1)^2

        somatorio += t1*t2 + t3*t4
     end

    return primeiro_termo + somatorio
end

function w(x,i)
    return 1 + (x[i] - 1)/4
end