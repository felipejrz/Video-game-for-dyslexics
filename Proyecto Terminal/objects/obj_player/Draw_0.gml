draw_sprite(spr_shadow, 0, floor(x), floor(y));

if state == scr_player_state_hook && image_index != 3 draw_hook_chain();

if (invulnerable != 0) && ((invulnerable mod 8 < 2) == 0) && (flash == 0){
	//Skip draw
}else{
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y - z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
}

if state == scr_player_state_hook && image_index == 3 draw_hook_chain();

function draw_hook_chain(){
	var _origin_x = floor(x);
	var _origin_y = floor(y) - 1.5;

	var _chains = hook div hook_size;
	var _hook_dir_x = sign(hook_x);
	var _hook_dir_y = sign(hook_y);
	
	for(var _i = 0; _i < _chains; _i++){
		draw_sprite(
			spr_hook_chain,
			0,
			_origin_x + hook_x - (_i * hook_size * _hook_dir_x),
			_origin_y + hook_y - (_i * hook_size * _hook_dir_y));	
	}
	draw_sprite(spr_hook_blade, CARDINAL_DIR, _origin_x + hook_x, _origin_y + hook_y);
}