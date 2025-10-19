for (var i = 0; i < lins; i++)
{
    for (var j = 0; j < cols; j++)
    {
        // Calcula o frame atual baseado na linha e coluna
        var _img = min(max(0, img - j - i * 0.2), img_num);

        // Desenha o frame da transição correspondente
        draw_sprite_ext(
            sprite_transicao,
            _img,
            j * tamanho,
            i * tamanho,
            1, 1,
            0,
            c_black,
            1
        );
    }
}