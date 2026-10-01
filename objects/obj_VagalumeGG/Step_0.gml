// O tempo passa a cada frame
tempo += velocidade_voo;

// Atualiza a posição X e Y fazendo um movimento 
x = x_start + sin(tempo) * 20; 
y = y_start + cos(tempo * 0.8) * 15;