// Desenha a barra de vida do inimigo

// Desenha o fundo
// draw_sprite(sprite para o fundo, 0, x, y - 40);

// Para a distancia de cada Quadrado de vida
var largura_quadrado = 16;
var espacamento = 4;
var passo = largura_quadrado + espacamento;

var qtd_ativa = ultimo - primeiro;
if (qtd_ativa > 0) {
    var largura_bloco = (qtd_ativa * passo) - espacamento;
    
    // Loop da barra de vida
    for (var i = primeiro; i < ultimo; i += 1) {
        var idx = i - primeiro;
        
        // Multiplicamos o offset pelo image_xscale para a barra virar junto com o inimigo
        var offset_x = (idx * passo) - (largura_bloco / 2);
        var desenha_x = x + (offset_x * -image_xscale); // Arruma a vida (ficava do lado oposto ao prota)
        
        var desenha_y = (y - 45) - 8; // Altura da vida
        
        draw_sprite(spr_tags, total[i], desenha_x, desenha_y);
    }
}

// Não sei o que faz mas parece importante
draw_self();