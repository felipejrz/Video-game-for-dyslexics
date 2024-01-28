function scr_player_state_dead(){
	h_speed = 0;
	v_speed = 0;
	
	//If just arriveing in this state
	if (sprite_index != spr_player_die) && (sprite_index != spr_player_dead){
		//Update the sprite
		sprite_index = spr_player_die;
		image_index = 0;
		image_speed = 0.7;
	}
	
	//Animation ending this frame?
	if (image_index + image_speed > image_number){
		if (sprite_index == spr_player_die){
			image_speed = max(0, image_speed - 0.03);
			if image_speed < 0.1{
				image_index = 0;
				sprite_index = spr_player_dead;
				image_speed = 1.0;
			}
		}else{
			image_speed = 0;
			image_index = image_number - 1;
			global.target_x = -1;
			global.target_y = -1;
			scr_room_transition(TRANS_TYPE.FADE, rm_village);
		}
	}
}