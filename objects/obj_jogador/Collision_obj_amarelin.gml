// 1. Confere se já não pegou
if (Amarelin == false) {
    
    // 2. Desbloqueia a cor
    Amarelin = true;
    global.amarelo_salvo = true; // <-- AVISA A MEMÓRIA GLOBAL
    
    // 3. Aumenta o tamanho da roda com mais cores
    cor_maxima++; 
    global.cor_maxima_salva = cor_maxima; // <-- SALVA O TAMANHO DA RODA GLOBALMENTE
}

// Destrói 
instance_destroy(other);