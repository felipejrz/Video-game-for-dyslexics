function scr_player_throw(){
	with (global.i_lifted){
		lifted = false;
		persistent = false;
	 	thrown = true;
		z = 8;
		throw_peak_height = z + 10;
		throw_distance = entity_throw_distance;
		throw_distance_travelled = 0;
		throw_start_percent = (8 / throw_peak_height) * 0.5;
		direction = other.direction;
		xstart = x;
		ystart = y;
	}
	//global.animation_activate = false;
	enetity_animation_lift = 0;
	scr_player_act_out_animation(spr_player_lift);
	scr_player_drop_item();
}