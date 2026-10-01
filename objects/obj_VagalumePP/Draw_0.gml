// Desenha um ponto diretamente na tela
// x1, y1, x2, y2, outline
draw_set_color(c_lime);
draw_set_alpha(brilho_atual); // Define a transparência global para o desenho
draw_rectangle(x, y, x + 1, y + 1, false); // Ponto de 2x2 pixels

// Centro branco
draw_set_color(c_white);
draw_set_alpha(brilho_atual);
draw_rectangle(x + 0.5, y + 0.5, x + 1, y + 1, false); // Ponto de 1x1

//reseta o alpha e color depois de desenhar
draw_set_alpha(1); 
draw_set_color(c_white);