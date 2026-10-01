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

// Colisão vertical (mantida igual)
if place_meeting(x, y + vsp, obj_parede)
{
	while !place_meeting(x, y + sign(vsp), obj_parede)
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp; 

// . Atualizar Temporizadores
coyote_time -= 1;
jump_buffer -= 1;

// . Chão e Gravidade -----------------------------------------------------
if place_meeting(x, y + 1, obj_parede) {
    coyote_time = coyote_max; // Recarrega o tempo do Coyote
    pulos = 2; // Recarrega os pulos
} else {
    vsp += grav;
    
    // Limite de velocidade de queda
    if (vsp > limite_queda) {
        vsp = limite_queda;
    }
    
    // Se o Coyote Time acabar e ainda estivermos com 2 pulos, 
    // significa que caímos da plataforma. Retiramos o primeiro pulo.
    if (coyote_time <= 0 && pulos == 2) {
        pulos = 1; 
    }
}

// . Registrar a intenção de pulo (Jump Buffer) ---------------------------
if keyboard_check_pressed(ord("Z")) {
    jump_buffer = jump_buffer_max; // Salva que o botão foi apertado agora
}

//  Execução do Pulo -----------------------------------------------------
// Se temos um pulo salvo no buffer E temos pulos disponíveis:
if (jump_buffer > 0) && (pulos > 0) {
    
    // Consumimos o buffer e o coyote time para não pular repetido acidentalmente
    jump_buffer = 0;
    coyote_time = 0;

    if (pulos == 2) {
        // Primeiro pulo (a partir do chão ou durante o Coyote Time)
        vsp = pulo; 
    } else {
        // Pulo duplo: multiplica por 0.8 para ser mais fraco que o primeiro (ex: -7 vira -5.6)
        vsp = pulo * 0.8;
        
        // Removemos o seu "vsp -= 1" pois forçar o vsp direto já zera o momentum de queda
    }
    
    pulos -= 1;
}

// 5. Pulo Variável (Soltar o botão no ar) ---------------------------------
if keyboard_check_released(ord("Z")) && vsp < 0 {
    vsp *= 0.5; // Reduz a velocidade de subida pela metade para um pulo curtinho
}


//VIDA ----------------------------------------------------------------------------------

// 1. Controle do tempo de invencibilidade
if (invencivel) {
    tempo_invencivel -= 1; // Diminui o tempo
    
    // Faz o sprite "piscar" (fica invisível e visível rápido)
    if (tempo_invencivel % 10 < 5) {
        image_alpha = 0; // Fica transparente
    } else {
        image_alpha = 1; // Fica visível
    }
    
    // Quando o tempo acaba, volta ao normal
    if (tempo_invencivel <= 0) {
        invencivel = false;
        image_alpha = 1; // Garante que não vai ficar invisível para sempre
    }
}

// tomar Dano
if (!invencivel) {
    // Checa se encostou em um inimigo (Crie um objeto chamado obj_inimigo para testar)
    var _inimigo = instance_place(x, y, obj_inimigo);
    
    if (_inimigo != noone) {
        hp -= 1;              // Perde 1 de vida
        invencivel = true;    // Fica invencível
        tempo_invencivel = 60; // Fica invencível por 60 frames (1 segundo)
        
        // Empurrãozinho (Knockback) para trás
        vsp = -4; // Pula um pouquinho
        hsp = sign(x - _inimigo.x) * 4; // É empurrado para o lado contrário do inimigo
        
        // Checa se morreu
        if (hp <= 0) {
            // Reinicia a fase (ou você pode mandar para a tela de Game Over / Menu)
            room_restart(); 
        }
    }
}

//Ataque --------------------------------------------------------------------

// 1. Atualizar o lado que o jogador está olhando
var right = keyboard_check(vk_right);
var left  = keyboard_check(vk_left);
var move  = right - left;

if (move != 0) {
    image_xscale = move; // 1 para direita, -1 para esquerda
}

// 2. Código do ataque (TECLA X) --------------------------------------------------------------------
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
	    sprite_index = Protagonista_Attack; // Sprite do ataque com X
	    image_index = 0; // Começa a animação do zero

	    // Faz a fila andar 
	    avancar_e_repor();
		global.fila_salva = cores;
		
		
	}
}

//Ataque e Cores (TECLAS C e V) --------------------------------------------------------------------

/* Desbloqueio de cores
if (Amarelin == true || Verdin == true || Roxin == true || Laranjin == true){ //Aumenta o tamanho da roda com mais cores **** ACHO MELHOR DEIXAR SÓ em 3 MESMO***
    cor_maxima++; // N desomente ta eerado isso aqui
}
*/

var _tecla_c = keyboard_check_pressed(ord("C"));
var _tecla_v = keyboard_check_pressed(ord("V")); //Limpar (V)

// Função para o Ataque C e V (não mudam o sprite do jogador, apenas criam o tiro/descarte)

if (pegou_arma == true) {
	
	if (_tecla_c || _tecla_v) {
    
	    if (_tecla_c) {
	        var cor_usada = cores[0]; // Pega a cor que está na frente
		
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
            // Apenas descarte, sem mexer no sprite do jogador
        }
	
	    // se for 'v' (descarte), pula o switch de carregar sprite de ataque

	    // Executa o shift unificado
	    avancar_e_repor();
		global.fila_salva = cores;
	}

}

// Animação Ataque (X) e Troca de Sprites -------------------------------------------------------

// Se estiver atacando com o X
if (atacando == true) {
    
    // Garante que o sprite rodando é o de ataque e velocidade normal
    sprite_index = Protagonista_Attack;
    image_speed = 1;
    
    // Confere se a animação do sprite atual chegou no último frame
    if (image_index >= image_number - 1) {
        atacando = false; // Terminou o ataque volta ao normal
    }
    
} 
// Se NÃO estiver atacando, faz o controle normal de movimento, pulo e arma
else {
    
    // Verifica se está no ar
    if (!place_meeting(x, y + 1, obj_parede)) {
        
        // 1. Dizemos qual é a sprite única do pulo
        sprite_index = Protagonista_Jump; 
        
        // 2. Trava a animação para ele não ficar alternando entre subir e cair sem parar
        image_speed = 0; 
        
        // 3. Escolhe o quadro manual baseado na velocidade vertical (vsp)
        if (vsp < 0) {
            // Subindo (vsp negativo) -> Toca o primeiro frame
            image_index = 0;
        } else {
            // Caindo (vsp positivo) -> Toca o segundo frame
            image_index = 1;
        }
        
    } 
    // Se estiver no chão
    else {
        
        // 4. DEVOLVE a velocidade da animação quando pisar no chão
        image_speed = 1; 
        
        // Se o jogador NÃO pegou a arma
        if (pegou_arma == false) {
            
            // Verifica se está andando ou parado
            if (movx != 0) {
                sprite_index = Protagonista_walk; // sprite correndo normal
            } else {
                sprite_index = Protagonista_Idle; // sprite parado normal
            }
            
        } 
        // Se o jogador JÁ pegou a arma
        else {
            
            // Verifica se está andando ou parado com a arma
            if (movx != 0) {
                sprite_index = Protagonista_walk; // Sprite correndo com a arma
            } else {
                sprite_index = Protagonista_Idle_Arma; // Sprite parado com a arma
            }
            
        }
    }
}

// FALAS ----------------------------------------------------------------

if (keyboard_check_pressed(vk_up) && place_meeting(x, y, obj_npc)) {
    
    // flag para n bugar e aparecer varios
    if (!instance_exists(obj_falas)) {
        var _caixa = instance_create_layer(0, 0, "Instances", obj_falas);
        
        // Substitui o texto padrão pelo texto do NPC
        _caixa.textos = [
            "Você encontrou a espada perdida!",
            "Cuidado com os monstros adiante."
        ];
    }
}

//TELA PRETA --------------------------------------------------

// Se a transição foi acionada
if (global.transicao_ativa) {
    // Escurece a tela gradualmente
    global.transicao_alfa += 0.05; 

    // Quando a tela estiver totalmente preta (alfa 1)
    if (global.transicao_alfa >= 1) {
        global.transicao_alfa = 1;

        // 1. Muda de sala no escuro primeiro!
        room_goto(global.transicao_alvo);

        // 2. Força o jogador (que acabou de nascer na sala nova) a ir para o destino exato imediatamente
        x = global.novo_x;
        y = global.novo_y;

        // Começa a clarear a tela de volta
        global.transicao_ativa = false;
    }
} else {
    // Se não está mudando de sala, clareia a tela suavemente até sumir o preto
    if (global.transicao_alfa > 0) {    
        global.transicao_alfa -= 0.05;
    }
}