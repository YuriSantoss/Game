// Para olhar para o protagonista
if (instance_exists(obj_jogador)) {
    if (obj_jogador.x > x) {
        image_xscale = 1;  // Olha para a direita
    } else {
        image_xscale = -1; // Olha para a esquerda
    }
}