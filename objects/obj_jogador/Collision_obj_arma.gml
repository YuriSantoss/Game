// Vai aumentar a velocidade dele
vx = 3; 

// Informa que pegou
pegou_arma = true;

//Muda o sprite para o dele com a Arma
sprite_index = Protagonista_Idle_Arma; 

//Pra começar do primeiro frame
image_index = 0;

//Destrói o item do chão para ele sumir
instance_destroy(other);