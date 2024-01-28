function scr_player_drop_item(){
	with obj_player{
		global.i_lifted = noone;
		sprite_run = spr_player_run;
		sprite_idle = spr_player;
	}
}