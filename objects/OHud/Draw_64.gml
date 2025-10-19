
draw_sprite_ext(Semente, 1, 60, 30, 1, 1, 0, c_gray, 1)
draw_sprite_ext(Semente, 1, 120, 30, 1, 1, 0, c_gray, 1)
draw_sprite_ext(Semente, 1, 180, 30, 1, 1, 0, c_gray, 1)


switch (global.semente) //hud da semente
{
	case 1:
		draw_sprite_ext(Semente, 1, 60, 30, 1, 1, 0, c_white, 1);
		
	case 2:
		if global.semente == 2
		{
			draw_sprite_ext(Semente, 1, 120, 30, 1, 1, 0, c_white, 1);
			draw_sprite_ext(Semente, 1, 60, 30, 1, 1, 0, c_white, 1)
		}
	case 3:
		if global.semente == 3
		{
			draw_sprite_ext(Semente, 1, 120, 30, 1, 1, 0, c_white, 1);
			draw_sprite_ext(Semente, 1, 60, 30, 1, 1, 0, c_white, 1);
			draw_sprite_ext(Semente, 1, 180, 30, 1, 1, 0, c_white, 1)
		}
	
	
	
	
}




