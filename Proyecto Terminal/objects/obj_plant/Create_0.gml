// Inherit the parent event
event_inherited();
image_speed = 0; // Detiene la animación
entity_drop_list = choose(
	[obj_coin],
	[obj_arrow_drop],
	[obj_bomb_drop],
	[obj_coin, obj_coin],
	[obj_coin, obj_bomb_drop],
	-1,
	-1,
	-1,
	-1,
	[obj_coin, obj_coin, obj_coin]
	);
