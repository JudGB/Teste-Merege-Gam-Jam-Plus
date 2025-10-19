if !instance_exists(target) exit;
if (confirmar == false) {
	alarm[0] = room_speed * 2;
	confirmar = true;
}
// calcula diffs
var dx = target.x - x;
var dy = target.y - y;

// decide prioridade de eixo (horizontal ou vertical)
var try_order = array_create(0);
if (abs(dx) >= abs(dy)) {
    // tenta horizontal primeiro, depois vertical, depois perpendiculares
    array_push(try_order, [sign(dx), 0]); // direita ou esquerda
    array_push(try_order, [0, sign(dy)]); // cima ou baixo
} else {
    array_push(try_order, [0, sign(dy)]);
    array_push(try_order, [sign(dx), 0]);
}
// perpendiculares como fallback
array_push(try_order, [ try_order[0][0]==0 ? 1 : 0, try_order[0][1]==0 ? 1 : 0 ]);
array_push(try_order, [ try_order[0][0]==0 ? -1 : 0, try_order[0][1]==0 ? -1 : 0 ]);

// tenta cada direção em ordem
var moved = false;
for (var i = 0; i < array_length(try_order); i++) {
    var dir = try_order[i];
    var sx = dir[0];
    var sy = dir[1];

    // se direção nula (0,0) pula
    if (sx == 0 && sy == 0) continue;

    var step_x = sx * chase_speed;
    var step_y = sy * chase_speed;

    // se destino direto está livre, move; senão faz pixel-per-pixel até encostar
    if (!place_meeting(x + step_x, y + step_y, OChao)) {
        x += step_x;
        y += step_y;
        moved = true;
        break;
    } else {
        // tenta aproximar até a parede (mesma técnica do player)
        if (!place_meeting(x + sign(step_x), y + sign(step_y), OChao)) {
            while (!place_meeting(x + sign(step_x), y + sign(step_y), OChao)) {
                x += sign(step_x);
                y += sign(step_y);
            }
            moved = true;
            break;
        } // else essa direção bloqueada logo ao lado -> tentar próxima
    }
}

