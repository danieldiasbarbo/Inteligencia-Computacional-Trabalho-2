include("Rastrigin.jl")
using Evolutionary

function AlgGenOptimization(dimension)
    selection_methods = [(Evolutionary.rouletteinv, "roleta")]
    mutation_methods = [(Evolutionary.gaussian(), "gaussiano"), (Evolutionary.uniform(), "uniforme")]
    crossover_methods = [(Evolutionary.DC, "DC texto"), (Evolutionary.AX, "AX texto")]

    println("ALGORITMO GENETICO DIMENSAO $dimension")
    println("===================================================================")
    for sel in selection_methods
        for mut in mutation_methods
            for cros in crossover_methods
                println("selecao: $(sel[2])")
                println("mutacao: $(mut[2])")
                println("crossover: $(cros[2])")
                result = Evolutionary.optimize(x -> rastrigin(x), ones(dimension),
                                                GA(populationSize = 100,
                                                selection = sel[1],
                                                crossover = cros[1],
                                                mutation = mut[1]))
                println(result)
                println("===================================================================")
                println("selecao: torneio")
                println("mutacao: $(mut[2])")
                println("crossover: $(cros[2])")
                result = Evolutionary.optimize(x -> rastrigin(x), ones(dimension),
                                                GA(populationSize = 100,
                                                crossover = cros[1],
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