function scr_player_state_hook(){
	h_speed = 0;
	v_speed = 0;
	
	//Si acaba de llegar a este estado
	if (sprite_index != spr_player_hook){
		hook = 0;
		hook_x = 0;
		hook_y = 0;
		hook_status = HOOK_STATUS.EXTENDING;
		hooked_entity = noone;
		
		//Actualiza sprite
		sprite_index = spr_player_hook;
		//image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
	//Extend/Retract hook
	var _speed_hook_temp = speed_hook;
	if (hook_status != HOOK_STATUS.EXTENDING) _speed_hook_temp *= -1;
	hook += _speed_hook_temp;
	switch (CARDINAL_DIR){
		case 0: hook_x = hook; break;
		case 1: hook_y = -hook; break;
		case 2: hook_x = -hook; break;
		case 3: hook_y = hook; break;
	}
	
	//Hookshot state machine
	switch (hook_status){
		case HOOK_STATUS.EXTENDING:{
			//Finish extending
			if (hook >= distance_hook) hook_status = HOOK_STATUS.MISSED;
			
			//Check extending
			var _hook_hit = collision_circle(x + hook_x, y + hook_y, 4, obj_p_entity, false, true);
			if (_hook_hit != noone) && (global.i_lifted != _hook_hit){
				//Act depending on what  is hit
				switch (_hook_hit.entity_hook_able){
					default: { //not hookable
						//... else potentially harm enemy
						if (object_is_ancestor(_hook_hit.object_index, obj_p_enemy)){
							scr_hurt_enemy(_hook_hit, 1, id, 5);
							hook_status = HOOK_STATUS.MISSED;

						}else{
							if (_hook_hit.entity_hit_script != -1){
								with (_hook_hit) script_execute(entity_hit_script);
								hook_status = HOOK_STATUS.MISSED;
							}
						}
					
					}break;
				
					case 1:{
						hook_status = HOOK_STATUS.PULLTOPLAYER;
						hooked_entity = _hook_hit;
					
					}break;
				
					case 2:
					{
						hook_status = HOOK_STATUS.PULLTOENTITY;
						hooked_entity = _hook_hit;
					}break;
				}	
			}
		}break;
		
		//Pull the entity towerds the hooked player
		case HOOK_STATUS.PULLTOPLAYER:{
			with hooked_entity{
				x = other.x + other.hook_x;
				y = other.y + other.hook_y;
			}
		}break;
		
		case HOOK_STATUS.PULLTOENTITY:{
			switch (CARDINAL_DIR){
				case 0: x += speed_hook; break;
				case 1: y -= speed_hook; break;
				case 2: x -= speed_hook; break;
				case 3: y += speed_hook; break;
			}	
		}break;
	}
	
	//Finish retract and end state
	if hook <= 0{
		hooked_entity = noone;
		state = scr_player_state_free;
	}
}