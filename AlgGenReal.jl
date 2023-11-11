include("levy.jl")
using Evolutionary

function AlgGenOptimization(dimension)
    selection_methods = [Evolutionary.rouletteinv]
    mutation_methods = [Evolutionary.gaussian(), Evolutionary.uniform()]
    crossover_methods = [Evolutionary.DC, Evolutionary.AX]

    println("ALGORITMO GENETICO DIMENSAO $dimension")
    println("===================================================================")
    for sel in selection_methods
        for mut in mutation_methods
            for cros in crossover_methods
                println("selecao: $sel")
                println("mutacao: $mut")
                println("crossover: $cros")
                result = Evolutionary.optimize(x -> levy(x), ones(dimension),
                                                GA(populationSize = 100,
                                                selection = sel,
                                                crossover = cros,
                                                mutation = mut))
                println(result)
                println("===================================================================")
            end
        end
    end
end

print(AlgGenOptimization(16))