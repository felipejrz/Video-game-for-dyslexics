if (keyboard_check_pressed(vk_escape)) && (!instance_exists(obj_transition)) && (obj_ui.visible != false){
    global.game_paused = !global.game_paused;
    
    if (global.game_paused){
		with (all){
			game_paused_image_speed = image_speed;
			image_speed = 0;
	    }
	}

	 if (!global.game_paused){
	    with (all){
			image_speed = game_paused_image_speed;
		}
	}
}