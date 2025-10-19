//saí da tela cheia
if keyboard_check(vk_escape)
{
	window_set_fullscreen(false);
	window_set_size(1280, 720);
}
//entra na tela cheia
if keyboard_check(vk_f11)
{
	window_set_fullscreen(true);
}


with (OPersonagem) // `obj_1` é o objeto com o qual o Objeto 3 está colidindo
{
    // No escopo de `with(obj_1)`, `self` se refere ao Objeto 1
    if (place_meeting(x, y, OFim)) // Verifica se o Objeto 1 está colidindo com o Objeto 3
    {
        show_debug_message("Objeto 1 detectou colisão com Objeto 3.");
        var t = instance_create_layer(0, 0, layer, OTrancicoes_2);
		t.destino = Room2; // substitua pela room desejada
    }
	
	if (place_meeting(x, y, OFim2)) // Verifica se o Objeto 1 está colidindo com o Objeto 3
    {
        var t = instance_create_layer(0, 0, layer, OTrancicoes_2);
		t.destino = Room3; // substitua pela room desejada
    }
}

	