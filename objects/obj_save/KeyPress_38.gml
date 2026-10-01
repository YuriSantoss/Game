if (file_exists("save.sav")) { //Se existe ele troca para o novo save
    file_delete("save.sav");
}

ini_open("save.sav");

// Isso salva o nome da sala
var _nome_sala = room_get_name(room);
ini_write_string("Dados", "room", _nome_sala);

// (Salve o lugar que o bicho 
if (instance_exists(obj_jogador)) {
    ini_write_real("Dados", "pos_x", obj_jogador.x);
    ini_write_real("Dados", "pos_y", obj_jogador.y);
    
    // Salva a sua tag da arma 
    ini_write_real("Dados", "arma", global.pegou_arma);
	
	//Salva a cor
	ini_write_real("Dados", "amarelin", obj_jogador.Amarelin);
	ini_write_real("Dados", "cor_maxima", obj_jogador.cor_maxima);
}

ini_close();

show_message("Jogo Salvo!");