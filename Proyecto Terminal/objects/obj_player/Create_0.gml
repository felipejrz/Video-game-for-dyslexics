//Variable para que al iniciar vea hacia abajo
direction = 270;

state = scr_player_state_free;
state_attack = scr_attack_slash;
hit_byattack = -1;
last_state = state;

collision_map = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
h_speed = 0;
v_speed = 0;
speedwalk = 1.2;
speed_bonk = 1.5;
speed_hook = 3.0;

distance_roll = 72;
distance_bonk = 40;
distance_bonk_height = 15;
distance_hook = 88;

z = 0;
invulnerable = 0;
flash = 0;
flash_shader = sh_white_flash;
animation_end_script = -1;
move_distance_remaining = 0;

sprite_run = spr_player_run;
sprite_idle = spr_player;
local_frame = 0;

skip_step_event = false;

hook = 0;
hook_x = 0;
hook_y = 0;
hook_size = sprite_get_width(spr_hook_chain);

if (global.target_x != -1){
	x = global.target_x;
	y = global.target_y;
	direction = global.target_direction;
}

if (global.i_lifted != noone){
	sprite_run = spr_player_carry_run;
	sprite_idle = spr_player_carry;
	sprite_index = sprite_idle;
}
