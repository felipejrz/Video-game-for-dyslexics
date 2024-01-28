event_inherited();

state = ENEMY_STATE.WANDER;

//Enemy Sprites
spr_move = spr_bat_purple;
spr_attack = spr_bat_purple;
spr_die = spr_bat_purple_die;
spr_hurt = spr_bat_purple_hurt;

//Enemy Scripts
enemy_script[ENEMY_STATE.WANDER] = scr_bat_wander; //Deanvular
enemy_script[ENEMY_STATE.CHASE] = scr_bat_chase;	 //Perseguir
enemy_script[ENEMY_STATE.ATTACK] = -1; //Atacar
enemy_script[ENEMY_STATE.HURT] = scr_slime_hurt;     //Herir  Aqui es lo mismo que el slime tengo que hacer uno generico para todos los enemigos	
enemy_script[ENEMY_STATE.DIE] = scr_slime_die;		 //Morir