// Guarda a posição inicial para ele não vazar
x_start = x;
y_start = y;

// Cria um "relógio" interno em um ponto aleatório para cada vagalume não se mover igual
tempo = random(360); 
velocidade_voo = random_range(0.02, 0.05);

// Configuração da luz
cor_brilho = make_color_rgb(180, 255, 50); // Cor do vagalume
tamanho_brilho = random_range(10, 18);     // Tamanho da luz 