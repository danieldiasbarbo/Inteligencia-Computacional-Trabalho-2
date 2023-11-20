# Aluno 01: Daniel Dias Barbosa - 12111BCC051
# Aluno 02: Huryel Souto Costa - 12011BCC022

using Metaheuristics
include("Rastrigin.jl")
include("Conjunto_Inicial.jl")

function PSOOptimization(dimension)
    println("PSO DIMENSAO $dimension")
    println("===================================================================")
    f(x) = rastrigin(x)
    l_b = gerar_conjunto_inicial_rastring(dimension, -5.12, 0)
    u_b = gerar_conjunto_inicial_rastring(dimension, 0, 5.12)
    bounds = boxconstraints(lb = l_b, ub = u_b)
    result = optimize(f, bounds, PSO())
    println(result)
end

dimensao = [16, 24, 32, 64]
for dim in dimensao
    PSOOptimization(dim)
end