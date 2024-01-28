/// @description Dibujar UI

//Dibuja Corazones
var _player_health = global.player_health;
var _player_health_max = global.player_health_max;
var _player_health_frac = frac(_player_health);
_player_health -= _player_health_frac;

for (var _i = 1; _i <= _player_health_max; _i++){
	var _image_index = (_i > _player_health);
	if (_i == _player_health + 1){
		_image_index += (_player_health_frac > 0);
		_image_index += (_player_health_frac > 0.25);
		_image_index += (_player_health_frac > 0.5);
	}
	draw_sprite(spr_health, _image_index, 8 + ((_i - 1) * 12), 8);
}

//Dibuja Monedas
//Moneda
var _xx, _yy;

//Monedas Icon
_xx = 28;
_yy = 28;
draw_sprite(spr_coin_ui, 0, _xx, _yy);

//Moneda Texto
draw_set_color(c_black);
draw_set_font(fnt_ammo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

_xx += sprite_get_width(spr_coin_ui) + 4;
_yy = 24;
var _str = string(global.player_money);
draw_text(_xx + 1, _yy, _str);
draw_text(_xx - 1, _yy, _str);
draw_text(_xx, _yy + 1, _str);
draw_text(_xx, _yy - 1, _str);
draw_set_color(c_white);
draw_text(_xx, _yy, _str);


//Dibujar item box
_xx = 8;
_yy = 20;

draw_sprite(spr_item_box_ui, 0, _xx, _yy);
if global.player_has_any_items{
	draw_sprite(spr_items_ui, global.player_equipped, _xx, _yy);
	if global.player_ammo[global.player_equipped] != -1{
		draw_set_font(fnt_ammo);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_set_color(c_white);
		draw_text(
			_xx + sprite_get_width(spr_item_box_ui) + 1, 
			_yy + sprite_get_width(spr_item_box_ui) + 1,
			string(global.player_ammo[global.player_equipped]));
	}
}


//Dibujar Pantalla Pause
if (global.game_paused){
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(RESOLUTION_W * 0.5,RESOLUTION_H * 0.4,"Juego en Pausa");
	for(var _i = 0; _i < array_length(pause_option); _i++)
	{
		var _print = "";
		if (_i == pause_option_selected){
			_print += "> " + pause_option[_i] + " <"
		}else{
			_print += pause_option[_i];
			draw_set_alpha(0.7)
		}
		draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.4 + 18 + (_i *  12) , _print)
		draw_set_alpha(1.0)
	}	
}


