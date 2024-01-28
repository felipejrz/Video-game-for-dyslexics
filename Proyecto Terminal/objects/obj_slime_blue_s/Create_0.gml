event_inherited();

state = ENEMY_STATE.WANDER;

//Enemy Sprites
spr_move = spr_slime_blue_s;
spr_attack = spr_slime1_attack;
spr_die = spr_slime_die;
spr_hurt = spr_slime_hurt;

//Enemy Scripts
enemy_script[ENEMY_STATE.WANDER] = scr_slime_wander; //Deanvular
enemy_script[ENEMY_STATE.CHASE] = scr_slime_chase;	 //Perseguir
enemy_script[ENEMY_STATE.ATTACK] = scr_slime_attack; //Atacar
enemy_script[ENEMY_STATE.HURT] = scr_slime_hurt;     //Herir
enemy_script[ENEMY_STATE.DIE] = scr_slime_die;		 //Morir

entity_drop_list = choose(
	[obj_coin],
	[obj_coin],
	[obj_bomb_drop],
	[obj_coin, obj_coin],
	[obj_coin, obj_bomb_drop],

	[obj_coin, obj_coin, obj_coin]
	);
