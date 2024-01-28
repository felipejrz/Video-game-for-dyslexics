function scr_player_state_bonk() {
    h_speed = lengthdir_x(speed_bonk, direction - 180);
    v_speed = lengthdir_y(speed_bonk, direction - 180);
    
    move_distance_remaining = max(0, move_distance_remaining - speed_bonk);
    var _collided = scr_player_collision();
    
    // Update Sprite
    sprite_index = spr_player_hurt;
	image_index = 0;
	image_speed = 1.0;
    scr_player_animate_sprite();
	
    // Change Height
    z = sin(((move_distance_remaining / distance_bonk) * pi)) * distance_bonk_height;
    
	for (var _i = 0; _i <= 1000; _i++) {
	    var _timer = 0;
	}

	if (move_distance_remaining == 0) {
		state = scr_player_state_free;
	}
}
