hsp = 0
vsp = 0

vx = 2
pulo = -20


grav = 2

//FILA do Protagonista ----------------------------------------------------------------------------------------------------------------------------------------

cor_maxima = 2; // Tamanho maximo da roda 

//Struct para a roda que pode guardar ou jogar fora
cores = array_create(3); //Slots visiveis 
tamanho_atual = 3; // Para ter um controle melhor

//Fazer aleatorio usamos o rand:
cores[0] = irandom(cor_maxima - 1); 
cores[1] = irandom(cor_maxima - 1);
cores[2] = irandom(cor_maxima - 1); 

// função para quando usa o ataque ou joga fora
avancar_e_repor = function() {

    // 1. Shift para a esquerda:
    cores[0] = cores[1];
    cores[1] = cores[2];

    // 2. Repoe um slot [2] com rand() % cor_maxima:
    // rand() % cor_maxima; // é pra ser aleatório (usado na reposição)
    cores[2] = irandom(cor_maxima - 1);
}

//Sistema de cores

// Desbloqueio de cores
Amarelin = false; // Começa bloqueado
Verdin = false;
Roxin = false;
Laranjin = false;


//Sistema da arma

atacando = false; // Verifica pra n bugar
pegou_arma = false; // Começa o jogo sem ela