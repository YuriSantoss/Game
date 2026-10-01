// O jogador olha para a variável global assim que a sala começa
if (variable_global_exists("pegou_arma")) {
    pegou_arma = global.pegou_arma;
}

// Se ele já tiver a arma, garante que a velocidade e o estado continuam certos
if (pegou_arma == true) {
    vx = 3;
}

// Se a cor amarela foi salva como verdadeira na memória global
if (variable_global_exists("amarelo_salvo")) {
    if (global.amarelo_salvo == true) {
        Amarelin = true;
    }
}

// Se o tamanho máximo da roda foi salvo, atualiza ele também
if (variable_global_exists("cor_maxima_salva")) {
    cor_maxima = global.cor_maxima_salva;
}

// Carrega a fila de cores salva globalmente com segurança
if (variable_global_exists("fila_salva")) {
    cores = array_create(array_length(global.fila_salva));
    array_copy(cores, 0, global.fila_salva, 0, array_length(global.fila_salva));
}

//Para o TP

// Força o jogador a assumir a posição exata de destino configurada na porta
if (variable_global_exists("novo_x") && global.novo_x != 0 && global.novo_y != 0) {
    x = global.novo_x;
    y = global.novo_y;
    
    // Limpa as variáveis para o jogador não ficar preso a elas
    global.novo_x = 0;
    global.novo_y = 0;
}