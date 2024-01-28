function scr_new_text_box(_message, _background, _responses){
	var _obj;
	if (instance_exists(obj_text)){
		_obj = obj_texto_en_cola;
	}else{
		_obj = obj_text;
	}

	with (instance_create_layer(0, 0, "Instances", _obj)){
		mensaje = _message;
		if (instance_exists(other)){
			origin_instance = other.id;
		}else{
			origin_instance = noone;
		}
		
		if is_undefined(_background){			
			background = 0;
		}else{
			background = _background;
		}			

		if is_undefined(_responses){
			responses = [-1];
			response_scripts = [-1];
		}else{
			// trim markers from responses			
			var _array_responses = _responses; // Bean Stinson test - Worked!
			for(var _i = 0; _i < array_length(_array_responses); _i++){
				responses[_i] = _array_responses[_i];  // Bean Stinson test - Worked!
				var _marker_position = string_pos(":", responses[_i]);
				response_scripts[_i] = string_copy(responses[_i], 1, _marker_position - 1);
				response_scripts[_i] = real(response_scripts[_i]);
				responses[_i] = string_delete(responses[_i], 1, _marker_position);
				//breakpoint = 10;
			}
		}		
	}

	with(obj_player){
		alarm[0] = 3;
		if(state != scr_player_state_locked){
			last_state = state;
			state = scr_player_state_locked;

		}
	}
}