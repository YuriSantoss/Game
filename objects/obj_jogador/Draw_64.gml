// Descobre o tamanho total da tela da interface
var _largura_tela = display_get_gui_width();

// Começa a desenhar perto da borda direita (150 pixels antes do limite da tela)
var _pos_x = _largura_tela - 200; 

var _pos_y = 50; // Mantém a altura igual
var _espaco_entre_slots = 32; // Distância entre um quadrado e outro

// Desenha os 3 slots visíveis
draw_sprite(spr_tags, cores[0], _pos_x, _pos_y);
draw_sprite(spr_tags, cores[1], _pos_x + _espaco_entre_slots, _pos_y);
draw_sprite(spr_tags, cores[2], _pos_x + (_espaco_entre_slots * 2), _pos_y);