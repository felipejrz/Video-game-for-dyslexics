function scr_activate_liftable(_id){
	if (global.i_lifted == noone){
		scr_player_act_out_animation(spr_player_lift);
	
		sprite_run = spr_player_carry_run;
		sprite_idle = spr_player_carry;
		
		global.i_lifted = _id;

		with(global.i_lifted){
			lifted = true;
			persistent = true;
		}
	}	
}