// Descobre o tamanho total da tela da interface
var _largura_tela = display_get_gui_width();
var _escala = 4;

// Começa a desenhar perto da borda direita (150 pixels antes do limite da tela)
var _pos_x = _largura_tela - 200; 

var _pos_y = 50; // Mantém a altura igual
var _espaco_entre_slots = 32; // Distância entre um quadrado e outro

// Desenha os 3 slots visíveis
//draw_sprite(spr_tags, cores[0], _pos_x, _pos_y);
//draw_sprite(spr_tags, cores[1], _pos_x + _espaco_entre_slots, _pos_y);
//draw_sprite(spr_tags, cores[2], _pos_x + (_espaco_entre_slots * 2), _pos_y);

draw_sprite_ext(spr_tags, cores[0], _pos_x, _pos_y, _escala, _escala, 0, c_white, 1);
draw_sprite_ext(spr_tags, cores[1], _pos_x + _espaco_entre_slots, _pos_y, _escala, _escala, 0, c_white, 1);
draw_sprite_ext(spr_tags, cores[2], _pos_x + (_espaco_entre_slots * 2), _pos_y, _escala, _escala, 0, c_white, 1);


//VIDA -------------------------------------------

// Desenha a quantidade de vida atual
var _tamanho_quadrado = 20;
var _distancia = 30;

// Muda a cor para vermelho
draw_set_color(c_red);

// Desenha um quadrado para cada ponto de HP que o jogador tem
for (var _i = 0; _i < hp; _i++) {
    // draw_rectangle(x1, y1, x2, y2, outline)
    draw_rectangle(20 + (_i * _distancia), 20, 20 + _tamanho_quadrado + (_i * _distancia), 20 + _tamanho_quadrado, false);
}

// Volta a cor para branco para não bugar outras coisas do jogo
draw_set_color(c_white);


// TELA PRETA ---------------------------------------------------------------------

// Desenha o retângulo preto por cima de tudo com base no alfa atual
if (global.transicao_alfa > 0) {
    draw_set_alpha(global.transicao_alfa);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1); // Reseta o alfa
}