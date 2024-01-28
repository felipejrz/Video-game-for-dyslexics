function scr_save_game(){
	//Crear el mapa de guardado 
	var _map = ds_map_create();
	
	_map[? "room"] = room;
	_map[? "player_health"] = global.player_health;
	_map[? "player_health_max"] = global.player_health_max;
	_map[? "player_money"] = global.player_money;
	_map[? "player_item_unlocked"] = global.player_item_unlocked;
	_map[? "player_ammo"] = global.player_ammo;
	_map[? "player_equipped"] = global.player_equipped;
	_map[? "player_has_any_items"] = global.player_has_any_items;
	_map[? "target_x"] = obj_player.x;
	_map[? "target_y"] = obj_player.y;
	
	var _quest_map = ds_map_create();
	ds_map_copy(_quest_map, global.quest_status);
	ds_map_add_map(_map, "quest_status", _quest_map);
	
	//Guardar todo en uns string
	var _string = json_encode(_map);
	save_string_to_file("save" + string(global.game_save_slot) + ".sav", _string);
	show_debug_message(_string);
	
	ds_map_destroy(_map);
	show_debug_message("Game save!");
}

function save_string_to_file(_file_name, _string){
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _file_name);
	buffer_delete(_buffer);
}