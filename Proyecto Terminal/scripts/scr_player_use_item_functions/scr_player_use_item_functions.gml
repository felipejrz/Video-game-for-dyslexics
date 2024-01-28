function scr_use_item_bomb(){
	if global.player_ammo[ITEM.BOMB] > 0 && global.i_lifted == noone{
		global.player_ammo[ITEM.BOMB]--;
		var _bomb = instance_create_layer(x, y, "Instances", obj_bomb);
		scr_activate_liftable(_bomb);
	}
}

function scr_use_item_bow(){
	if (global.player_ammo[ITEM.BOW] > 0) && (global.i_lifted == noone) {
		global.player_ammo[ITEM.BOW]--;
		scr_player_act_out_animation(spr_player_bow, scr_player_fire_arrow);
	}
}

function scr_player_fire_arrow(){
	with instance_create_depth(floor(x), floor(y) - 7, depth, obj_arrow){
		direction = other.direction;
		image_index = CARDINAL_DIR;
		direction = image_index * 90;
		image_speed = 0;
		speed = 6;
	}
}

function scr_use_item_hook(){
	state = scr_player_state_hook;
	local_frame = 0;
}