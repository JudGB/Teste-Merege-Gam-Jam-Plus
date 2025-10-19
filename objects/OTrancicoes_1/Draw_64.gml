// primeiro desenhar a sala normalmente


// agora desenhar a sobreposição da transição
var alpha;
if (trans_count < half_dur) {
    // fase de escurecer
    alpha = trans_count / half_dur;
} else {
    // fase de clarear
    alpha = 1 - ( (trans_count - half_dur) / half_dur );
}



// desenhar um retângulo que cobre toda a tela com alpha
draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, 1366, 782, false);
draw_set_alpha(1);
draw_set_color(c_white);