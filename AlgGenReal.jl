# Aluno 01: Daniel Dias Barbosa - 12111BCC051
# Aluno 02: Huryel Souto Costa - 12011BCC022


include("Rastrigin.jl")
include("Conjunto_Inicial.jl")
using Evolutionary

function AlgGenOptimization(dimension, intervalo)
    selection_methods = [(Evolutionary.rouletteinv, "roleta")]
    mutation_methods = [(Evolutionary.gaussian(), "gaussiano"), (Evolutionary.uniform(), "uniforme")]
    crossover_methods = [(Evolutionary.DC, "inverso"), (Evolutionary.AX, "aritmético"), (Evolutionary.UX, "uniforme")]

    conjunto_inicial = gerar_conjunto_inicial_rastring(dimension, intervalo[1], intervalo[2])

    minimum_result = Inf
    infos = []

    # println("ALGORITMO GENETICO DIMENSAO $dimension")
    # println("===================================================================")
    for sel in selection_methods
        for mut in mutation_methods
            for cros in crossover_methods
                # println("selecao: $(sel[2])")
                # println("mutacao: $(mut[2])")
                # println("crossover: $(cros[2])")
                result = Evolutionary.optimize(x -> rastrigin(x), conjunto_inicial,
                                                GA(populationSize = 100,
                                                selection = sel[1],
                                                crossover = cros[1],
                                                mutation = mut[1]))
                # println(result)

                if result.minimum < minimum_result
                    infos = [result.minimum, sel, mut, cros, conjunto_inicial, result.minimizer]
                    minimum_result = result.minimum
                end
                # println("===================================================================")
                # println("selecao: torneio")
                # println("mutacao: $(mut[2])")
                # println("crossover: $(cros[2])")
                result = Evolutionary.optimize(x -> rastrigin(x), conjunto_inicial,
                                                GA(populationSize = 100,
                                                crossover = cros[1],
                                                mutation = mut[1]))
                # println(result)

                if result.minimum < minimum_result
                    infos = [result.minimum, sel, mut, cros, conjunto_inicial, result.minimizer]
                    minimum_result = result.minimum
                end
                # println("===================================================================")
            end
        end
    end
    return infos
end

dimensao = [16, 24, 32, 64]
intervalo = [-5.12, 5.12]
# print(gerar_conjunto_inicial_rastring(dimensao[1], -5.12, 5.12))
for dim in dimensao
    infos = AlgGenOptimization(dim, intervalo)
    println("MELHORES PARÂMETROS NA DIMENSÃO $(dim)")
    println("valor: $(infos[1])")
    println("selecao: $(infos[2][2])")
    println("mutacao: $(infos[3][2])")
    println("crossover: $(infos[4][2])")
    println("solução inicial: $(infos[5])")
    println("solução final: $(infos[6])")
    println("===================================================================")
    println()
end