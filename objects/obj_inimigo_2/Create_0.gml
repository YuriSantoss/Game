// Criar Inimigo

// Precisamos criar a vida dele manualmente sempre, esse é o template

total = [Tags.Azul, Tags.Vermelho, Tags.Amarelo]; //Fala quais as cores
cor_dele = [spr_inimigo_1_1, spr_inimigo_1_2, spr_inimigo_1_3];


vida = array_length(cor_dele);
dano = 0;

sprite_index = cor_dele[0];


primeiro = 0; // Sempre 0, pois é onde começa no Vetor (no caso acima o 0 seria o vermelho
ultimo = 3; // O ultimo é literalmente o 1 a mais do numero que vc colocou de vida, então temos Azul(0) Verde(1) Amarelo(2) Azul(3), o ultimo vai ser o 4