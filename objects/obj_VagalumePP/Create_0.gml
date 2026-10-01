// Posição inicial e tempo para movimento
x_start = x;
y_start = y;
tempo = random(360); 
velocidade_voo = random_range(0.01, 0.03); // devagarzinho

// Configuração do brilho e piscar
brilho_atual = 1; // Alpha (opacidade)
brilho_minimo = random_range(0.2, 0.4); // Brilho mais baixo ao piscar
brilho_velocidade = random_range(0.005, 0.01); // Velocidade do piscar
apagando = true; // controlar se está apagando ou acendendo