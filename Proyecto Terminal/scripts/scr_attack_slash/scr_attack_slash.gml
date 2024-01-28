function scr_attack_slash(){
	if (sprite_index != spr_player_attack){
		sprite_index = spr_player_attack;
		local_frame = 0;
		image_index = 0;
		//audio_play_sound(snd_sword_hit_1,1000, false)
		
		//Clear hit list
		if (!ds_exists(hit_byattack, ds_type_list)) hit_byattack = ds_list_create();
		ds_list_clear(hit_byattack);
	}
	scr_calc_attack(spr_player_attack_hb);
	
	
	//Actualizar sprite
	scr_player_animate_sprite();
	
	if (animation_end){
		state = scr_player_state_free;
		animation_end = false;
	}
}