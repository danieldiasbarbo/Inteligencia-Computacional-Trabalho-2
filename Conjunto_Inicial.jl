function gerar_conjunto_inicial_rastring(qtd_numeros, minimo, maximo)
    # Inicializa um vetor vazio para armazenar os números aleatórios
    vetor_aleatorio = Float64[]

    # Gera os números aleatórios e os adiciona ao vetor
    for i in 1:qtd_numeros
        numero_aleatorio = minimo + (maximo - minimo) * rand()
        push!(vetor_aleatorio, numero_aleatorio)
    end

    return vetor_aleatorio
end