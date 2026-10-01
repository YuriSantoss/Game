// Faz a luz se misturar com o fundo
gpu_set_blendmode(bm_add);

// Desenha a luz
// Os parâmetros são: x, y, raio, cor do centro, cor da borda, preenchido (false = não, true = sim)
draw_circle_color(x, y, tamanho_brilho, cor_brilho, c_black, false);

//Desenha o centro do vagalume
draw_circle_color(x, y, 2, c_white, c_black, false);

//Volta para o modo normal para não deixar o jogo inteiro brilhando
gpu_set_blendmode(bm_normal);