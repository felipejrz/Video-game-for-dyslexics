/// @description Dibujar Texto Box
 draw_sprite_stretched(spr_text_box_bg, background, x1, y1, x2 - x1, y2 - y1);
 draw_set_font(fnt_text);
 draw_set_halign(fa_center);
 draw_set_valign(fa_top);
 draw_set_color(c_white);
 var _print = string_copy(mensaje, 1, text_progress);
 
 
 if (responses[0] != -1) and (text_progress >= string_length(mensaje)){
	for (var _i = 0; _i < array_length(responses); _i++){
		_print += "\n";
		if !(responses[_i] == "") {
			if (_i == response_selected) _print += "> ";
			_print += responses[_i];
			if (_i == response_selected) _print += " <";
		}
	}
}
 
 draw_text((x1+x2)/2, y1 + 8, _print);
 draw_set_color(c_black);
 draw_text((x1+x2)/2, y1 + 7, _print);

