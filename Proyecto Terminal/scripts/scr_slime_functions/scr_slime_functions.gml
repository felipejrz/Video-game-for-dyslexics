function scr_slime_chase(){
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
	
	//Verifica si esta ef player para attacar
	if (instance_exists(target)) && (point_distance(x, y, target.x, target.y) <= enemy_attack_radius){
		state = ENEMY_STATE.ATTACK;
		sprite_index = spr_attack;
		image_index = 0;
		image_speed = 1.0;
		
		//Target 8px past the player
		x_to += lengthdir_x(8, dir);
		y_to += lengthdir_y(8, dir);
	}
	
}

function scr_slime_wander(){
	sprite_index = spr_move;
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
		
		//image_index = 1.0;
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

function scr_slime_attack(){
	// Qué tan rápido moverse
	var _spd = enemy_speed;
	
	// No te muevas mientras te estás preparando para saltar
	//if (image_index < 2) _spd = 0;
	
	// Congela la animación mientras está en el aire y también después de que aterriza
	//if (floor(image_index) == 3 || floor(image_index) == 5) image_speed = 0;
	
	// Qué tan lejos tenemos que saltar
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	
	// Comienza a aterrizar al final de la animación una vez que casi hemos terminado
	//if (_distance_to_go < 4 && image_index < 5) image_speed = 1.0;
	
	// Mover
	if (_distance_to_go > _spd){
		dir = point_direction(x, y, x_to, y_to);
		direction = src_direction_entitie(x, y, x_to, y_to);
		h_speed = lengthdir_x(_spd, dir);
		v_speed = lengthdir_y(_spd, dir);
		
		if (scr_enemy_tile_collision()){
			x_to = x; 
			y_to = y;
		}
	}else{
		x = x_to; 
		y = y_to;
		if (animation_end){
			state_target = ENEMY_STATE.CHASE;
			state_wait_duration = 15;
			state = ENEMY_STATE.WAIT;
		}
	}
}

function scr_slime_hurt(){
	sprite_index = spr_hurt;
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	if _distance_to_go > enemy_speed {
		image_speed = 1.0
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(enemy_speed, dir);
		v_speed = lengthdir_y(enemy_speed, dir);
		
		if scr_enemy_tile_collision(){
			x_to = x;
			y_to = y;
		}
	}else{
		x = x_to; 
		y = y_to;
		if (state_previous != ENEMY_STATE.ATTACK) state = state_previous;
		else state = ENEMY_STATE.CHASE;
	}
	
}

function scr_slime_die(){
	sprite_index = spr_die;
	image_speed = 1.0;
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	if _distance_to_go > enemy_speed {
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(enemy_speed, dir);
		v_speed = lengthdir_y(enemy_speed, dir);
		
		scr_enemy_tile_collision();
	}else{
		x = x_to; 
		y = y_to;
	}
	if (animation_end){
		instance_destroy()
	}
}