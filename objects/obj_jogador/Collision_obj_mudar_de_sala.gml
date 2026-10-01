// Descobre em qual objeto "tp" o jogador encostou
var _tp = instance_place(x, y, obj_mudar_de_sala);

// Se encostou em um TP de verdade (diferente de vazio/noone)
if (_tp != noone) {
    
    // Se a transição já não estiver acontecendo
    if (!global.transicao_ativa) {
        global.transicao_ativa = true;
        global.transicao_alvo = _tp.sala_destino; // Sala configurada na porta
        
        // Salva as coordenadas exatas de destino configuradas nesta porta específica
        global.novo_x = _tp.destino_x; 
        global.novo_y = _tp.destino_y;
    }
}