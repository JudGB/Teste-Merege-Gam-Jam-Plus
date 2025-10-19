
if entrando
{
	img += img_vel;

	if (img - img_num > cols + 1)
	{
		if room_exists(destino)
		{
			room_goto(destino);
			entrando = false;
		}
	}
}
else
{
	img -= img_vel;
	
	if img < 0
	{
		
		instance_destroy();
	}
}