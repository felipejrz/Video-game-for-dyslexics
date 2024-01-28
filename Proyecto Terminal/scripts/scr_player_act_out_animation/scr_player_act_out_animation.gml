function scr_player_act_out_animation(_sprite, _end_script){
	//Carry out an animation and optionally carry out a script when the animation ends
	state = scr_player_state_act;
	sprite_index = _sprite;
	
	if is_undefined(_end_script){			
		animation_end_script = -1;
	}else{
		animation_end_script = _end_script;
	}	
	
	local_frame = 0;
	image_index = 0;
	
	//Cambio de animacion 
	enetity_animation_lift = 1;
	scr_player_animate_sprite();
}
