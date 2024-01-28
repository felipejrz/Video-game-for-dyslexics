/// @description Progress Transition

with (obj_player){
	if (state != scr_player_state_dead)	state = scr_player_state_transition;
}

if (leading == OUT){
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1){//If screen fully obscured
		room_goto(target);	
		leading = IN;
	}
}else{//leanding  == IN
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0){//If screen fully revealed
		with (obj_player) state = scr_player_state_free;
		instance_destroy();	
	}
}

