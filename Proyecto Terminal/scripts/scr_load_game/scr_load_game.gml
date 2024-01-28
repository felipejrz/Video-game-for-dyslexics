function scr_load_game(_slot){
	global.game_save_slot = _slot;
	var _file = "save" + string(global.game_save_slot) + ".sav";
	if file_exists(_file){
		//Cargar la informacion
		var _json = load_JSON_from_file(_file);
		
		//Global Variable
		global.player_health = _json[? "player_health"];
		global.player_health_max = _json[? "player_health_max"];
		global.player_money = _json[? "player_money"];
		global.player_equipped = _json[? "player_equipped"];
		global.player_has_any_items = _json[? "player_has_any_items"];
		global.target_x = _json[? "target_x"];
		global.target_y = _json[? "target_y"];
		
		for (var _i = 0; _i < ITEM.TYPE_COUNT; _i++){
			global.player_item_unlocked[_i] = _json[? "player_item_unlocked"][| _i];
			global.player_ammo[_i] = _json[? "player_ammo"][| _i];
		}
		
		//Quest
		ds_map_copy(global.quest_status, _json[? "quest_status"]);
		
		//Room
		scr_room_transition(TRANS_TYPE.FADE, _json[? "room"]);
		
		ds_map_destroy(_json);

		return true;
	}else {
		show_debug_message("No existe save")
		return false;
	}
}

function load_JSON_from_file(_file_name){
	var _buffer = buffer_load(_file_name);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
}
