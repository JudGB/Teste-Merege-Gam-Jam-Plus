//sprite_index = PersonagemParadoNormal
// movimentação do personagem
if (!moving) {
    if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))) {
        xvel = velocidade;
        yvel = 0;
        moving = true;
        sprite_index = PersonagemGirando;
    }
    if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))) {
        xvel = -velocidade;
        yvel = 0;
        moving = true;
        sprite_index = PersonagemGirando;
    }
    if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))) {
        yvel = -velocidade;
        xvel = 0;
        moving = true;
        sprite_index = PersonagemGirando;
    }
    if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))) {
        yvel = velocidade;
        xvel = 0;
        moving = true;
        sprite_index = PersonagemGirando;
    }
}

// se estiver se movendo, continua até colidir
if (moving) {
    if (place_meeting(x + xvel, y + yvel, OChao) || place_meeting(x + xvel, y + yvel, OChao_falso)) {
        // para antes de atravessar a parede
        while (!place_meeting(x + sign(xvel), y + sign(yvel), OChao)
        && !place_meeting(x + sign(xvel), y + sign(yvel), OChao_falso)) {
            x += sign(xvel);
            y += sign(yvel);
        }

        // --- AO PARAR O MOVIMENTO ---
        moving = false;
        xvel = 0;
        yvel = 0;

        // --- Define sprite ao parar  ---
        if (place_meeting(x, y + 1, OChao) || place_meeting(x, y + 1, OChao_falso)) {
            sprite_index = PersonagemParadoNormal;
        } 
        else if (place_meeting(x, y - 1, OChao) || place_meeting(x, y - 1, OChao_falso)) {
            sprite_index = PersonagemParadoInvertida;
        }
		else if (place_meeting(x+1, y , OChao) || place_meeting(x+1, y, OChao_falso)) {
            sprite_index = PersonagemParadoDireita;
        } 
        else if (place_meeting(x-1, y, OChao) || place_meeting(x-1, y, OChao_falso)) {
            sprite_index = PersonagemParadoEsquerda;
        }
    }
    else {
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
	room_restart()
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
