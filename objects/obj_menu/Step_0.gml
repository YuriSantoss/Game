// teclado
var _cima = keyboard_check_pressed(vk_up);
var _baixo = keyboard_check_pressed(vk_down);
var _confirma = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);

// Movendo a seleção
index_selecionado += _baixo - _cima;

//Seleção infinita
var _tamanho = array_length(opcoes);
if (index_selecionado < 0) index_selecionado = _tamanho - 1;
if (index_selecionado >= _tamanho) index_selecionado = 0;

// O que cada coisa faz
if (_confirma) {
    switch(index_selecionado) {
        case 0: // Iniciar Jogo
            
            room_goto(Tutorial1);
            audio_stop_sound(snd_Musiquinha);
            break;
			
		case 1: // Continuar Jogo
            if (file_exists("save.sav")) { //Abrir o Save
                // Abre o save
                ini_open("save.sav");
                
                // pega a variavel que salvou a sala, se n achar pega o normal
                var _nome_sala = ini_read_string("Dados", "room", "Tutorial1");
				
				global.novo_x  = ini_read_real("Dados", "pos_x", 100); //Local dele
                global.novo_y  = ini_read_real("Dados", "pos_y", 100);
				
                global.pegou_arma = ini_read_real("Dados", "arma", 0); //Se tem a arma
				global.amarelo_salvo = ini_read_real("Dados", "amarelin", 0); // Se tem a cor
				global.cor_maxima_salva = ini_read_real("Dados", "cor_maxima", 3); //(O 3 é o tamanho inicial)
				
                ini_close();
                
                // Converte o texto ("rm_fase1") no index real da sala do GameMaker
                var _sala_alvo = asset_get_index(_nome_sala);
                
				
				if (!instance_exists(obj_jogador)) {
                    instance_create_depth(global.novo_x, global.novo_y, 0, obj_jogador);
                }
				
                //Se a sala existir, vai para ela; caso contrário, vai pro Tutorial por segurança
                if (room_exists(_sala_alvo)) {
                    room_goto(_sala_alvo);
                } else {
                    room_goto(Tutorial);
                }
				audio_stop_sound(snd_Musiquinha);
            } else {
                // Sem save existente
                show_message("Nenhum jogo salvo encontrado!");
            }
            break;
        case 2: // Opções
            //  N existeee
            break;
        case 3: // Sair
            game_end(); // Fecha o jogo bleh
            break;
    }
}