// Verifica se a cor do ataque é igual à cor que está na posição 'primeiro' do 'total'
var  ataque_correto = (other.cor_alvo == total[primeiro]); 

// Chama a sua função passando se acertou a cor ou não
AvancarFilaInimigo(id, ataque_correto);

var _idx = min(primeiro , array_length(cor_dele) - 1);
sprite_index = cor_dele[_idx];

//Aumenta ou diminui conforme o ataque
if (ataque_correto = true)
{
	dano -= 1;
}
else if (ataque_correto = false)
{
	if (dano < vida)
	{
		dano += 1;
	}
}

// Destrói o projétil para não atravessar
instance_destroy(other);