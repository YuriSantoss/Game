var _confirma = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z")) 
or keyboard_check_pressed(ord("X")) or keyboard_check_pressed(ord("C")) or keyboard_check_pressed(ord("V")
);

// Pega o tamanho total da frase atual
var _tamanho_frase = string_length(textos[pagina_atual]);

// Se ainda não mostrou todas as letras, vai adicionando
if (caracteres_mostrados < _tamanho_frase) {
    caracteres_mostrados += velocidade_texto;
}

// Quando o jogador aperta o botão
if (_confirma) {
    // Se o texto ainda está digitando, mostra tudo de uma vez
    if (caracteres_mostrados < _tamanho_frase) {
        caracteres_mostrados = _tamanho_frase;
    } 
    // Se o texto já terminou de digitar, avança para a próxima página
    else {
        if (pagina_atual < array_length(textos) - 1) {
            pagina_atual++;
            caracteres_mostrados = 0; // Zera as letras para a nova frase
        } else {
            // Se as frases acabaram, destrói a caixa de texto
            instance_destroy();
        }
    }
}