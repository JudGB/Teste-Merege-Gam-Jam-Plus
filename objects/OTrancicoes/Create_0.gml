tamanho = sprite_get_width(Trancicoes);

cols = ceil(room_width /tamanho);

lins = ceil(room_height /tamanho);

img = 0;

img_vel = sprite_get_speed(Trancicoes) / game_get_speed(gamespeed_fps);

img_num = sprite_get_number(Trancicoes) - 1;


entrando = true;