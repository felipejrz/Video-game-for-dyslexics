function scr_player_state_free(){
	//Movimiento
	h_speed = lengthdir_x(imput_magnitude * speedwalk, input_direction);
	v_speed = lengthdir_y(imput_magnitude * speedwalk, input_direction);
	
	scr_player_collision();

	//Actualizar Sprite
	var _old_sprite = sprite_index;
	if (imput_magnitude != 0){
		direction = input_direction;
		sprite_index = sprite_run;
	}else sprite_index = sprite_idle;
	if (_old_sprite != sprite_index) local_frame = 0;

	//Actualizar Imagen Index  
	scr_player_animate_sprite();
	
	//Logica de tecla de ataque
	if (global.i_lifted == noone) {
		if (key_attack){
			state = scr_player_state_attack;
			state_attack = scr_attack_slash;
		}
	}
	
	
	//Logica de tecla de activacion
	if (key_activate){
		var _activate_x = x + lengthdir_x(10, direction);
		var _activate_y = y + lengthdir_y(10, direction);
		var _activate_size = 4;
		var _activate_list = ds_list_create();
		activate = noone;
		var _entities_found = collision_rectangle_list(
			_activate_x - _activate_size,
			_activate_y - _activate_size,
			_activate_x + _activate_size,
			_activate_y + _activate_size,
			obj_p_entity,
			false,
			true,
			_activate_list,
			true
		);
		
		 
		// If the fist instance we find is either our liftef entity or it has no script: try the next one
		while(_entities_found > 0){
			var _check = _activate_list[| --_entities_found];
			if (_check != global.i_lifted) && (_check.entity_activate_script != -1) {
				activate = _check;
				break;
			}
		}

		ds_list_destroy(_activate_list);
		

		if (activate == noone){
			if (global.i_lifted != noone){
				scr_player_throw();
			}else{
				//move_distance_remaining = distance_roll;
			}
		}else{

			//Activar Entity
			script_execute_ext(activate.entity_activate_script, activate.entity_activate_args);
			if (activate.entity_npc){
				with(activate){
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;	
				}
			}
		}
	}
	
	if key_item && !key_activate && global.player_has_any_items && global.player_equipped != ITEM.NONE{
		switch global.player_equipped{
			case ITEM.BOMB: scr_use_item_bomb() ;break;
			case ITEM.BOW: scr_use_item_bow();break;
			case ITEM.HOOK: scr_use_item_hook();break;
			default: break;
		}
	}
	
	//Cycle items
	if (global.player_has_any_items){
		var _cycle_direction = key_item_select_up - key_item_select_down;
		if _cycle_direction != 0{
			do{
				global.player_equipped += _cycle_direction;
				if (global.player_equipped < 1) global.player_equipped = ITEM.TYPE_COUNT - 1;
				if (global.player_equipped >= ITEM.TYPE_COUNT) global.player_equipped = 1; 
			}until global.player_item_unlocked[global.player_equipped]
		}
	}
}
