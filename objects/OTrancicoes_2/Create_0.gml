// --- CONFIGURAÇÕES BÁSICAS ---
lins = 20;            // número de linhas (divisões verticais)
cols = 30;           // número de colunas (divisões horizontais)
tamanho = 60;        // tamanho de cada bloco em pixels
img = 0;             // frame atual da animação
img_vel = 1;       // velocidade da animação
sprite_transicao = Trancicoes; // sprite usado na transição (com vários frames)
img_num = sprite_get_number(sprite_transicao) - 1; // número total de frames

// --- CONTROLE DE ESTADO ---
entrando = true;     // true = cobrindo tela, false = revelando

global.go = false;

count = 0;