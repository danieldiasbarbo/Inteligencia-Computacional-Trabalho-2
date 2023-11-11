using Metaheuristics
include("levy.jl")

function PSOOptimization(dimension)
    println("PSO DIMENSAO $dimension")
    println("===================================================================")
    f(x) = levy(x)
    bounds = boxconstraints(lb = -5ones(dimension), ub = 5ones(dimension))
    result = optimize(f, bounds, PSO())
    println(result)
end

dimensao = [16, 24, 32, 64]
for dim in dimensao
    PSOOptimization(dim)
end