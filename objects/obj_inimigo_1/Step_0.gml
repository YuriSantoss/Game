image_yscale = 1 + sin(current_time / 200) * 0.02;
image_xscale = image_yscale; // Mantém a proporção (opcional)

// Para olhar para o protagonista
if (instance_exists(obj_jogador)) {
    if (obj_jogador.x > x) {
        image_xscale = 1;  // Olha para a direita
    } else {
        image_xscale = -1; // Olha para a esquerda
    }
}


// Deixa o inimigo menor após um ataque do jogador
image_xscale *= (0.5 + (vida + dano) / (2 * vida));
image_yscale *= (0.5 + (vida + dano) / (2 * vida));
