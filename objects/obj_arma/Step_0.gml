// 1. Aumenta o tempo a cada frame girando
tempo_giro += 0.05; 

// A imgem tem que oscilar entre 1 e -1 (bleh)
image_xscale = sin(tempo_giro);