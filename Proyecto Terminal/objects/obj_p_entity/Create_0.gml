/// @description Entity Essentials
local_frame = 0; //Variable que se usa si el NPC esta animado

spd = 0;
z = 0;
flash = 0;
lifted = 0;
thrown = false;
flash_shader = sh_white_flash;
u_flash = shader_get_uniform(flash_shader, "flash");
entity_drop_list = -1;
collision_map = layer_tilemap_get_id(layer_get_id("Col"));