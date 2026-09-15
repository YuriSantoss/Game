enum Tags { //Sistema de Cores (Muito importante para vida do inimigo e nosso ataque
    Vermelho, //0
    Azul, // 1
    Amarelo, //2
	Roxo, //3
	Verde, //4
	Laranja //5
}

function AvancarFilaInimigo(_inimigo, _ataque) { // _inimigo é o pra trocar pro coiso d inimigo e do ataque o mesmo

    if (_ataque == true) { 
        
        _inimigo.primeiro = _inimigo.primeiro + 1; 
    }
    
    if (_inimigo.primeiro == _inimigo.ultimo) {
        // Destroi o objeto
        instance_destroy(_inimigo); 
        
        // Se a sua ideia for reciclar o inimigo em vez de destruir, 
        // você apagaria a linha acima e usaria: _inimigo.primeiro = 0;
    }      
}

