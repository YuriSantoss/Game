//Fonte
draw_set_font(fonte);

//Centralização
draw_set_halign(fa_left);
draw_set_valign(fa_middle);


var _margem_esquerda = 120; // Margem para afastar da borda esquerda
var _altura_inicial = room_height / 2;
var _espacamento = 64; // Distância entre as letras

for (var i = 0; i < array_length(opcoes); i++) {
    var _cor = c_white;
    var _deslocamento_x = 0; // Desloca levemente a opção selecionada para o lado
    
    // Cor amarela
    if (i == index_selecionado) {
        _cor = c_yellow; 
        _deslocamento_x = 16; // puxa a opção selecionada um pouco para a direita
    }
    
    draw_set_color(_cor);
    
    // Desenha no meio da tela
    draw_text_transformed(_margem_esquerda + _deslocamento_x, _altura_inicial + (i * _espacamento), opcoes[i], 2, 2, 0); //Tamanho das letras (3,3,0)
}

// Reset
draw_set_color(c_white);

//Titulo

draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Posições para o logotipo e o título no topo esquerdo
var _logo_x = _margem_esquerda; 

var _logo_y = 120;

// Desenha a imagem 
draw_sprite_ext(teste_menu, 0, _logo_x + 70, _logo_y + 50, 0.3, 0.3, 0, c_white, 1);

// Desenha um título grande no topo da tela
draw_set_color(c_aqua); // Cor do título

// draw_text_transformed desenha o texto e permite mudar a escala.
// O '2, 2' significa que ele ficará com o dobro do tamanho da fonte padrão.
// O '0' no final é o ângulo de rotação.
draw_text_transformed(_logo_x, _logo_y + 110, "Forgotten Hues", 3, 3, 0);  // Aqui tmb Tamanho das letras (1,1,0).