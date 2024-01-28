function scr_hurt_player(_direction, _force, _damage){
	if (obj_player.invulnerable <= 0){
		global.player_health = max(0, global.player_health - _damage);
		if (global.player_health > 0){
			with (obj_player){
				state = scr_player_state_bonk;
				direction = _direction - 180;
				move_distance_remaining = _force;
				scr_screen_shake(2, 10);
				invulnerable = 60;
			}
		}else{
			
			with(obj_player){
				state = scr_player_state_dead;
			}
		}
	}
}