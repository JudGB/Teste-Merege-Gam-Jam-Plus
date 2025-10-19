trans_count += 1;

if (!switched && trans_count >= half_dur) {
    // troca de sala no meio da transição
    room_goto_next();
    switched = true;
}

if (trans_count >= trans_dur) {
    // transição completa — destruir ou desativar o objeto
    instance_destroy();
}