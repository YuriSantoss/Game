//======================================MOVIMENTAÇÃO====================================================================

//Em X
movx = -keyboard_check(vk_left) + keyboard_check(vk_right)
hsp = movx * vx


if place_meeting(x + hsp, y, obj_parede)
{
	while !place_meeting(x + sign(hsp), y, obj_parede)
	{
		x += sign(hsp)
	}
	
	hsp = 0
}

x += hsp

//Em Y
if place_meeting(x, y + vsp, obj_parede)
{
	while !place_meeting(x, y + sign(vsp), obj_parede)
	{
		y += sign(vsp)
	}
	
	vsp = 0
}

y += vsp

//Pulo --------------------------------------------------------------------
if  place_meeting(x, y + 1, obj_parede)
{
	pulos = 2
}
else 
{
	vsp += grav
	
	var limite_queda = 8; 
	
    if (vsp > limite_queda) 
    {
        vsp = limite_queda;
    }
	
}
if keyboard_check_pressed(ord("Z")) && pulos > 0
{
	vsp = pulo
	pulos -= 1
}

//Ataque --------------------------------------------------------------------

// 1. Atualizar o lado que o jogador está olhando
var right = keyboard_check(vk_right);
var left  = keyboard_check(vk_left);
var move  = right - left;

if (move != 0) {
    image_xscale = move; // 1 para direita, -1 para esquerda
}

// 2. Código do ataque --------------------------------------------------------------------
if (pegou_arma == true) {
	
	if (keyboard_check_pressed(ord("X"))) {
	    // Pega a cor da frente da fila
	    var cor_usada = cores[0]; 

	    var inst = instance_create_layer(x + (20 * image_xscale), y - 40, layer, obj_ataque);
	    inst.image_xscale = image_xscale;
    
	    //Passa a cor para o ataque!
	    inst.cor_alvo = cor_usada;
    
	    // ataque para mudar de cor também
	    inst.sprite_index = spr_tags; 
	    inst.image_index = cor_usada;
	    inst.image_speed = 0;
	
		inst.alarm[0] = 15;
	
		atacando = true;
	    sprite_index = Protagonista_Attack; // Sprite do ataque
	    image_index = 0; // Começa a nimação do zero

	    // Faz a fila andar 
	    avancar_e_repor();
	}
}
//Ataque e Cores --------------------------------------------------------------------

/* Desbloqueio de cores
if (Amarelin == true || Verdin == true || Roxin == true || Laranjin == true){ //Aumenta o tamanho da roda com mais cores **** ACHO MELHOR DEIXAR SÓ em 3 MESMO***
    cor_maxima++; // N desomente ta eerado isso aqui
}
*/

var _tecla_c = keyboard_check_pressed(ord("C"));
var _tecla_v = keyboard_check_pressed(ord("V")); //Limpar (V)

// Função para o Ataque (ID é pra ser o sprite)

if (pegou_arma == true) {
	
	if (_tecla_c || _tecla_v) {
    
	    if (_tecla_c) {
	        var cor_usada = cores[0]; // Pega a cor que está na frente
		
	         atacando = true;
	      //  sprite_index = spr_jogador_atirando; // Srite atirando (não fiz ainda) (descomentar quando eu fizer
	      //  image_index = 0;
		
	        var _meu_ataque = instance_create_layer(x, y - 18, "Instances", obj_ataque);

	        // Switch das cores (aqui traduz o ID para o sprite da cor certa)
	        switch (cor_usada) {
	            case 0: // Vermelho
	                _meu_ataque.cor_alvo = Tags.Vermelho; // Prepara para carregar sprite vermelho
	                break;
	            case 1: // Azul
	                _meu_ataque.cor_alvo = Tags.Azul; // Prepara para carregar sprite azul
	                break;
	            case 2: // Amarelo
	                _meu_ataque.cor_alvo = Tags.Amarelo; // Prepara para carregar sprite amarelo
	                break;
	            // Roxo(3), Verde(4), Laranja(5)...
	       } 

	        // Configurar o visual do ataque
	        _meu_ataque.sprite_index = spr_tags; // Usa o sprite das cores
	        _meu_ataque.image_index = _meu_ataque.cor_alvo; // Fica no frame da cor sorteada
	        _meu_ataque.image_speed = 0; // Trava na animação para não ficar piscando todas as cores

	        // Movimento do ataque
	        _meu_ataque.speed = 6; // Velocidade do tiro (ajuste como quiser)
        
	        // Dependendo de onde o jogador está olhando
	        if (image_xscale > 0) {
	            _meu_ataque.direction = 0; // direita
	        } else {
	            _meu_ataque.direction = 180; //esquerda
	        }
	    } 
		else if (_tecla_v) {
        
	        atacando = true;
	        // sprite_index = spr_jogador_descartando; // Sprite descartando (não fiz ainda)
	        // image_index = 0;
        
	    }
	
	    // se for 'v' (descarte), pula o switch de carregar sprite de ataque

	    // Executa o shift unificado
	    avancar_e_repor();
	}

}

// Animação Ataque e Troca de Spites -------------------------------------------------------

//Atacando
if (atacando == true) {
    
    // Confere se a animação do sprite atual chegou no último frame
    if (image_index >= image_number - 1) {
        atacando = false; // Terminou o ataque volta ao normal
    }
    
} 
// Não atacan
else {
    
    // Não pegou o item
    if (pegou_arma == false) {
        
        // Verifica se está no ar
        if (!place_meeting(x, y + 1, obj_parede)) {
            sprite_index = Protagonista_Jump; // Srite de Pulo
        } 
        // Verifica se está andando
        else if (movx != 0) {
            sprite_index = Protagonista_walk; //sprite correndo normal
        } 
        //Idle dele
        else {
            sprite_index = Protagonista_Idle; // sprite parado normal
        }
        
    } 
    // Se o jogador pegou a arma
    else {
        
        // Verifica se está no ar
        if (!place_meeting(x, y + 1, obj_parede)) {
            sprite_index = Protagonista_Jump; // Sprite com a arma de pulo
        } 
        // Verifica se está andando
        else if (movx != 0) {
            sprite_index = Protagonista_walk; // Sprite  com a arma correndo
        } 
        // Idleo
        else {
            sprite_index = Protagonista_Idle_Arma; // Sprite  com a arma parado
        }
        
    }
    
}