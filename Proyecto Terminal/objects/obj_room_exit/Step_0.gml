/// @description Causar una transición de habitación
if (instance_exists(obj_player) && position_meeting(obj_player.x, obj_player.y, id)){
	if (!instance_exists(obj_transition)) && (obj_player.state != scr_player_state_dead){
		global.target_room = target_room;
		global.target_x = target_x;
		global.target_y = target_y
		global.target_direction = obj_player.direction;
		with (obj_player) state = scr_player_state_transition;
		scr_room_transition(TRANS_TYPE.FADE, target_room);
		instance_destroy();
	}
}