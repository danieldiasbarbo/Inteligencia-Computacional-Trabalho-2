using Metaheuristics
include("Rastrigin.jl")

function PSOOptimization(dimension)
    println("PSO DIMENSAO $dimension")
    println("===================================================================")
    f(x) = rastrigin(x)
    bounds = boxconstraints(lb = -5.12zeros(dimension), ub = 5.12zeros(dimension))
    result = optimize(f, bounds, PSO())
    println(result)
end

dimensao = [16, 24, 32, 64]
for dim in dimensao
    PSOOptimization(dim)
end