// Verifica se a cor do ataque é igual à cor que está na posição 'primeiro' do 'total'
var ataque_correto = (other.cor_alvo == total[primeiro]); 

// Chama a sua função passando se acertou a cor ou não
AvancarFilaInimigo(id, ataque_correto);

// Destrói o projétil para não atravessar
instance_destroy(other);