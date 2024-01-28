function scr_hurt_enemy(_enemy, _damage, _source, _knockback){
	with(_enemy){
		if (state != ENEMY_STATE.DIE){
			enemy_hp -= _damage;
			//flash = 1;
			
			//Hurt or Dead
			if (enemy_hp <= 0){
				state = ENEMY_STATE.DIE
			}else{
				if (state != ENEMY_STATE.HURT) state_previous = state;
				state = ENEMY_STATE.HURT;
			}
			
			image_index = 0;
			if (_knockback != 0){
				var _knockback_direction = point_direction(x, y, (_source).x, (_source).y)
				x_to = x - lengthdir_x(_knockback, _knockback_direction);
				y_to = y - lengthdir_y(_knockback, _knockback_direction)
			}
		}
	}
}