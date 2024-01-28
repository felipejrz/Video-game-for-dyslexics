if  room == rm_title visible = false; else visible = true;
if (global.game_paused){
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pause_option_selected += (key_down - key_up);
	if (pause_option_selected >= array_length(pause_option)) pause_option_selected = 0;
	if (pause_option_selected < 0) pause_option_selected = array_length(pause_option) -1; 
	
	key_activate = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("H"));
	if (key_activate){
		switch (pause_option_selected){
			case 0:{ //Continue
				global.game_paused = false;
				with (all){
					image_speed = game_paused_image_speed;
				}
			}break;
			
			case 1:{//Save and Quit
				with (obj_game) instance_destroy();
				scr_save_game();
				game_restart();				
			}break;
			
			case 2:{
				scr_save_game();
				game_end();
			}break;
			
		}
	}
}