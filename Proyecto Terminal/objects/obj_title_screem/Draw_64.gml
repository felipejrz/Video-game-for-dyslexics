if title_visible > 0{
		draw_sprite(spr_title, 0, 0, -RESOLUTION_H + title_visible * RESOLUTION_H);
		draw_set_alpha(title_visible * abs(sin(get_timer() * 0.000001 * pi)));
		draw_sprite(spr_title, 1, 0, 0);
		draw_set_alpha(1.0);
}

if slots_visible > 0{
	draw_set_alpha(slots_visible);
	//Dibuja Cajas
	for (var _slot = 0; _slot <= 2; _slot++){
		var _y = 16 + _slot * 52;
		var _x = 160;
		var _img = 1;
		if(slot_selected == _slot){
			_img = 2;
			draw_sprite(spr_menu_player, 0, _x - 20, _y + 30);
		}
		draw_sprite_stretched(spr_text_box_bg, _img, _x, _y, 150, 48);
		//
		draw_set_font(fnt_text);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_black);
		if slot_data[_slot] == -1 {
			draw_text(_x + 8, _y + 8, "Comenzar Nuevo Juego");
		}else{
			draw_text(_x + 8, _y + 8, scr_room_to_area_name(slot_data[_slot][? "room"]));
			
			
			//Dibuja Corazones
			var _player_health = slot_data[_slot][? "player_health"];
			var _player_health_max = slot_data[_slot][? "player_health_max"];
			var _player_health_frac = frac(_player_health);
			_player_health -= _player_health_frac;

			for (var _i = 1; _i <= _player_health_max; _i++){
				var _image_index = (_i > _player_health);
				if (_i == _player_health + 1){
					_image_index += (_player_health_frac > 0);
					_image_index += (_player_health_frac > 0.25);
					_image_index += (_player_health_frac > 0.5);
				}
				draw_sprite(spr_health, _image_index, _x + 48 + ((_i - 1) * 16), _y + 24);
			}

			//Dibuja Monedas
			draw_sprite(spr_coin_ui, 0, _x + 8, _y + 28);
			draw_text(_x + 20, _y + 24, slot_data[_slot][? "player_money"]);
			
		}
	}
	draw_set_alpha(1.0);
}