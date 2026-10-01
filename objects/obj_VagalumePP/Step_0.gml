
tempo += velocidade_voo;

// Movimento de onda suave
x = x_start + sin(tempo) * 15; // Menor amplitude
y = y_start + cos(tempo * 0.7) * 10; // Menor amplitude vertical

// Lógica do pisca pisac
if (apagando) {
    brilho_atual -= brilho_velocidade;
    if (brilho_atual <= brilho_minimo) {
        apagando = false;
    }
} else {
    brilho_atual += brilho_velocidade;
    if (brilho_atual >= 1) {
        apagando = true;
    }
}