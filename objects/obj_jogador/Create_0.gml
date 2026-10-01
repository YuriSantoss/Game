hsp = 0


vx = 2.6


grav = 0.3;
pulo = -7; 
vsp = 0;
pulos = 0;
limite_queda = 8;

//flag

if (variable_global_exists("pegou_arma")) {
    pegou_arma = global.pegou_arma;
} else {
    pegou_arma = false;
}

//flag cor

// Se a cor amarela foi salva como verdadeira na memória global
if (variable_global_exists("amarelo_salvo")) {
    if (global.amarelo_salvo == true) {
        Amarelin = true;
    }
}

// Se o tamanho máximo da roda foi salvo, atualiza ele também
if (variable_global_exists("cor_maxima_salva")) {
    cor_maxima = global.cor_maxima_salva;
}

//flag FILA

// Se a global.fila_salva já existe e tem dados, aproveita ela!
if (variable_global_exists("fila_salva")) {
    cores = global.fila_salva;
} else {
    // Sua criação de fila padrão de início de jogo (exemplo:)
    cores = [0, 1, 2]; 
}

// Segredos do Game Feel
coyote_max = 6;     // Quantidade de frames para pular após cair da beirada
coyote_time = 0;

jump_buffer_max = 5; // Quantidade de frames que o jogo "guarda" o seu input de pulo
jump_buffer = 0;


//VIDA DO PROTAGONISTA ------------------------------------------------------------------------------

// Sistema de Vida
hp_max = 4;        // Vida máxima do jogador (ex: 4 corações)
hp = hp_max;       // Vida atual

// Sistema de Invencibilidade (Piscar)
invencivel = false;   // Começa normal (falso)
tempo_invencivel = 0; // Temporizador para o piscar


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



// TELA PRETA ----------------------------------------

global.transicao_ativa = false;
global.transicao_alvo = room;
global.transicao_alfa = 0; // Transparência da tela preta
global.novo_x = x;
global.novo_y = y;