if (entrando)
{
    // Aumenta o índice da imagem (blocos cobrindo diagonalmente)
    img += img_vel;

    // Quando a animação passar do limite, troca de sala
    if (img - img_num > cols + 1)
    {
        if (room_exists(destino))
        {
            room_goto(destino);
            entrando = false;
			global.go = !global.go
        }
    }
}
else
{

    // Regride o índice (blocos saindo)
		img -= img_vel;
	
    // Quando terminar, remove o objeto
    if (img < 0)
    {
        instance_destroy();
		global.go = !global.go
		
    }
	
}

