function scr_drop_items(_x, _y, _array_items){
	var _items = array_length(_array_items);
	
	if (_items > 1){
		var _angle_per_item = 360 / _items;	
		var _angle = random(360);
		for(var _i = 0; _i < _items; _i++){
			with (instance_create_layer(_x, _y, "Instances", _array_items[_i])){
				direction = _angle;
				spd = 0.75 + (_items * 0.1) + random(0.1);
			}
			_angle += _angle_per_item;
		}
	}else instance_create_layer(_x, _y, "Instances", _array_items[0]);
		
}