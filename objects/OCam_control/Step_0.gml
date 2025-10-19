// Define qual objeto a câmera vai seguir
var alvo = OPersonagem;

// Define o tamanho da view (quanto o jogador enxerga)
var largura = 320;
var altura = 180;

// Centraliza a câmera no jogador
var cam_x = alvo.x - largura / 2;
var cam_y = alvo.y - altura / 2;
// posição alvo da câmera
var alvo_x = alvo.x - largura / 2;
var alvo_y = alvo.y - altura / 2;

// interpolação suave
cam_x = lerp(camera_get_view_x(view_camera[0]), alvo_x, 0.1);
cam_y = lerp(camera_get_view_y(view_camera[0]), alvo_y, 0.1);


// Impede a câmera de sair da sala
cam_x = clamp(cam_x, 0, room_width - largura);
cam_y = clamp(cam_y, 0, room_height - altura);

// Atualiza a posição da view
camera_set_view_pos(view_camera[0], cam_x, cam_y);
camera_set_view_size(view_camera[0], largura, altura);