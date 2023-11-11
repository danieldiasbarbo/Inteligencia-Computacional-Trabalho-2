include("levy.jl")
using Evolutionary

function AlgGenOptimization(dimension)
    selection_methods = [Evolutionary.rouletteinv]
    mutation_methods = [(Evolutionary.gaussian(), "gaussiano"), (Evolutionary.uniform(), "uniforme")]
    crossover_methods = [Evolutionary.DC, Evolutionary.AX]

    println("ALGORITMO GENETICO DIMENSAO $dimension")
    println("===================================================================")
    for sel in selection_methods
        for mut in mutation_methods
            for cros in crossover_methods
                println("selecao: $sel")
                println("mutacao: $(mut[2])")
                println("crossover: $cros")
                result = Evolutionary.optimize(x -> levy(x), zeros(dimension),
                                                GA(populationSize = 100,
                                                selection = sel,
                                                crossover = cros,
                                                mutation = mut[1]))
                println(result)
                println("===================================================================")
                println("selecao: Torneio")
                println("mutacao: $(mut[2])")
                println("crossover: $cros")
                result = Evolutionary.optimize(x -> levy(x), zeros(dimension),
                                                GA(populationSize = 100,
                                                crossover = cros,
                                                mutation = mut[1]))
                println(result)
                println("===================================================================")
            end
        end
    end
end

dimensao = [16, 24, 32, 64]
for dim in dimensao
    AlgGenOptimization(dim)
end