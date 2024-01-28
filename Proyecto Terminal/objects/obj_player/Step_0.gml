if(skip_step_event){
	skip_step_event = false
	return
}

key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"));
key_activate = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("H"));
key_attack = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(ord("J"));
key_item = keyboard_check_pressed(ord("C")) or keyboard_check_pressed(ord("K"));
key_item_select_up = keyboard_check_pressed(ord("E"));
key_item_select_down = keyboard_check_pressed(ord("Q"));


input_direction = point_direction(0,0,key_right-key_left,key_down-key_up);
imput_magnitude = (key_right-key_left != 0) or (key_down-key_up != 0);

if(!global.game_paused){
	script_execute(state);
	invulnerable = max(invulnerable - 1, 0);
	flash = max(flash - 0.05, 0);
}

depth = -bbox_bottom;