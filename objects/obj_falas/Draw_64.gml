// Pega o tamanho da janela do jogo
var _largura_tela = display_get_gui_width();
var _altura_tela = display_get_gui_height();
var _altura_caixa = 140;

// Desenha a caixa de fundo 
draw_set_color(c_black);
draw_set_alpha(0.8);

// Desenha na parte de baixo da tela (altura_tela - 100 pixels)

draw_rectangle(0, _altura_tela - _altura_caixa, _largura_tela, _altura_tela, false);
draw_set_alpha(1.0);

// Prepara a fonte e a cor do texto
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Recorta a frase atual até o número de letras que já devem aparecer
var _texto_parcial = string_copy(textos[pagina_atual], 1, floor(caracteres_mostrados));

// Configuração do tamanho das letras
var _escala = 1.8; // Aumenta o tamanho das letras (1.5, 1.8, 2.0, etc.)
var _espaco_linhas = 20;
var _largura_maxima = (_largura_tela - 60) / _escala;

// Escreve o texto na tela (é para aparecer pra baixo automaticamente)
// draw_text_ext(x, y, texto, separação de linhas, largura máxima)

draw_text_ext_transformed(20, _altura_tela - 120, _texto_parcial, _espaco_linhas, _largura_maxima, _escala, _escala, 0);