//Pisou nele
if (place_meeting(x, y, obj_jogador)) {
	
    
    // flag pra n bugar
    if (!instance_exists(obj_falas)) {
        
        // Cria a caixa de texto
        var _caixa = instance_create_layer(0, 0, "Instances", obj_falas);
        
        // Passa o texto DESSE gatilho para a caixa de texto
		//Abra o Codigo de criação para digitar o texto que quer
        _caixa.textos = meus_textos;
        
        // Destrói esse gatilho para a fala acontecer apenas uma vez
        instance_destroy();
    }
}