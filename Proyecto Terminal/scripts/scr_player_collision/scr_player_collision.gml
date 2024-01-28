function scr_player_collision(){
	var _collision = false;
	var _entity_list = ds_list_create();
	
	// Horizontal Tile
	if tilemap_get_at_pixel(collision_map, x + h_speed, y){
		x -= x mod TILE_SIZE;
		if (sign(h_speed) == 1) x += TILE_SIZE - 1;
		h_speed = 0;
		_collision = true;
	}
	
	//Horizontal entitis
	var _entity_count = instance_position_list(x + h_speed, y, obj_p_entity, _entity_list, false);
	var _snapx;
	while (_entity_count > 0){
		var _entity_check = _entity_list[| 0];
		if (_entity_check.entity_collision == true){
			//Move as close as we can
			if (sign(h_speed) == -1) _snapx = _entity_check.bbox_right + 1;
			else _snapx = _entity_check.bbox_left - 1;
			x = _snapx;
			h_speed = 0;
			_collision = true;
			_entity_count = 0;
		}
		ds_list_delete(_entity_list, 0);
		_entity_count--;
	}
	
	//Horizontal move commit
	x += h_speed;
	
	//Clear list between axis
	ds_list_clear(_entity_list)
	
	// Vertical Tile
	if tilemap_get_at_pixel(collision_map, x, y + v_speed){
		y -= y mod TILE_SIZE;
		if (sign(v_speed) == 1) y += TILE_SIZE - 1;
		v_speed = 0;
		_collision = true;
	}
	
	//Vertical entitis
	_entity_count = instance_position_list(x, y + v_speed, obj_p_entity, _entity_list, false);
	var _snapy;
	while (_entity_count > 0){
		var _entity_check = _entity_list[| 0];
		
		if (_entity_check.entity_collision == true){
			//Move as close as we can
			if (sign(v_speed) == -1) _snapy = _entity_check.bbox_bottom + 1;
			else _snapy = _entity_check.bbox_top - 1;
			y = _snapy;
			v_speed = 0;
			_collision = true;
			_entity_count = 0;
		}
		ds_list_delete(_entity_list, 0);
		_entity_count--;
	}
	
	// Verical move commit
	y += v_speed;
	
	ds_list_destroy(_entity_list);
	return _collision;
}