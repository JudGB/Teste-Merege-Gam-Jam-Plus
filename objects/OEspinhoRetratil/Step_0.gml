timer -= 1;

if (timer < 0) {
	ativo = !ativo
	timer = 120;
}
if (ativo) {
	mata = true
	sprite_index = EspinhoRetratilAtivo
}else {
	mata = false
	sprite_index = EspinhoRetratil
}