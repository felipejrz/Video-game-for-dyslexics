function scr_bat_chase(){
	sprite_index = spr_move;
	if (instance_exists(target)){
		y_to = target.y;
		x_to = target.x;
		
		var _distance_to_go = point_distance(x, y, x_to, y_to);
		image_speed = 0;
		dir = point_direction(x, y, x_to, y_to);
		direction = src_direction_entitie(x, y, x_to, y_to);
		
		if (_distance_to_go > enemy_speed){
			h_speed = lengthdir_x(enemy_speed, dir);
			v_speed = lengthdir_y(enemy_speed, dir);
		}else{
			h_speed = lengthdir_x(_distance_to_go, dir);
			v_speed = lengthdir_y(_distance_to_go, dir);
		}
		//Collide & Move
		scr_enemy_tile_collision();
	}
}

function scr_bat_wander(){
	sprite_index = spr_move;
	image_speed = 1.0;
	
	if ((x== x_to) && (y == y_to)) || (time_passed > enemy_wander_distance / enemy_speed){
		h_speed = 0;
		v_speed = 0;
		
		if (++wait >= wait_duration){
			wait = 0;
			time_passed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-30, 30);
			x_to = x + lengthdir_x(enemy_wander_distance, dir);
			y_to = y + lengthdir_y(enemy_wander_distance, dir);
		}
	
	}else{ //Move towards new destination
		time_passed++;
		var _distance_to_go = point_direction(x, y, x_to, y_to);
		var _speed_this_frame = enemy_speed;
		if (_distance_to_go < enemy_speed) _speed_this_frame = _distance_to_go;
		direction = src_direction_entitie(x, y, x_to, y_to);
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(_speed_this_frame, dir);
		v_speed = lengthdir_y(_speed_this_frame, dir);
		//if (h_speed != 0) image_xscale = sign(h_speed);
	
		//Collide & move
		scr_enemy_tile_collision();
	}
	
	//Check for Aggro
	if (++aggro_check >= aggro_check_duration){
		aggro_check = 0 ;
		if (instance_exists(obj_player)) && (point_distance(x, y, obj_player.x, obj_player.y) <= enemy_aggro_radius){
			state = ENEMY_STATE.CHASE;
			target = obj_player;
		}
	}
}
