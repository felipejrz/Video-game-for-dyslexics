if !key_pressed{
	title_visible = min(1, title_visible + 0.01);
}else{
	title_visible = max(0, title_visible - 0.01);
	slots_visible = min(1, slots_visible + 0.01);
}



if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")){
	slot_selected -= 1;
	if slot_selected < 0 slot_selected = 2;
}

if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")){
	slot_selected += 1;
	if slot_selected > 2 slot_selected = 0;
}

if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("H")) and key_pressed and !loading_started{
	global.game_save_slot = slot_selected;
	if !scr_load_game(global.game_save_slot){
		scr_room_transition(TRANS_TYPE.FADE, rm_village);	
	}
	loading_started = true;
}

if (keyboard_check_pressed(vk_anykey)) key_pressed = true;

