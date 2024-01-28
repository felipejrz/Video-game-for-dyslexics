event_inherited();

//Intrinsic variables
state = ENEMY_STATE.IDLE;
h_speed = 0;
v_speed = 0;
x_to = xstart;
y_to = ystart;
dir = 0;
aggro_check = 0;
aggro_check_duration = 5;
state_target = state;
state_previous = state;
state_wait = 0;
state_wait_duration = 0;

//Enemy Sprites
spr_move = spr_slime_blue_s;

//Enemy Stast
time_passed = 0;
wait_duration = irandom(120) + 20;
wait = 0;

//Enemy Scripts
enemy_script[ENEMY_STATE.IDLE] = -1;
enemy_script[ENEMY_STATE.WANDER] = -1;
enemy_script[ENEMY_STATE.CHASE] = -1;
enemy_script[ENEMY_STATE.ATTACK] = -1;
enemy_script[ENEMY_STATE.HURT] = -1;
enemy_script[ENEMY_STATE.DIE] = -1;
enemy_script[ENEMY_STATE.WAIT] = scr_enemy_wait;
