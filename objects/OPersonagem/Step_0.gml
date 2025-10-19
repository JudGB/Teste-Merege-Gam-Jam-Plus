
if (global.pause or global.go) exit;

// movimentação do personagem
if (!moving) {
    if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))) {
        xvel = velocidade;
        yvel = 0;
        moving = true;
    }
    if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))) {
        xvel = -velocidade;
        yvel = 0;
        moving = true;
    }
    if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))) {
        yvel = -velocidade;
        xvel = 0;
        moving = true;
    }
    if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))) {
        yvel = velocidade;
        xvel = 0;
        moving = true;
    }
}

// se estiver se movendo, continua até colidir
if (moving) {
    if (place_meeting(x + xvel, y + yvel, OChao)) {
        // para antes de atravessar a parede
      while (!place_meeting(x + sign(xvel), y + sign(yvel), OChao)) {
            x += sign(xvel);
            y += sign(yvel);
        }
        // ao colidir, para o movimento
        moving = false;
        xvel = 0;
        yvel = 0;
    } else {
        // move enquanto não colide
        x += xvel;
        y += yvel;
    }
}

//controlar pro player não sair do mapa;
// checa colisão com bordas do mapa
if (x < 0 or x > room_width - sprite_width or y < 0 or y > room_height - sprite_height) {
    moving = false;
    xvel = 0;
    yvel = 0;

    // impede sair do limite
    x = clamp(x, 0, room_width - sprite_width);
    y = clamp(y, 0, room_height - sprite_height);
}

//Se tocar no espinho (vermelho) você só some
if place_meeting(x, y, OEspinhos)
{
	instance_destroy()	
}

//se você tocar na semente (amarelo) ela sóme e aumenta um no contador
if place_meeting(x, y, OSemente)
{
	global.semente += 1
	instance_destroy(OSemente)
}
if place_meeting(x, y, OSemente2)
{
	global.semente += 1
	instance_destroy(OSemente2)
}
if place_meeting(x, y, OSemente3)
{
	global.semente += 1
	instance_destroy(OSemente3)
}


if object_exists(OPersonagem)
{
	show_debug_message("oi")
}