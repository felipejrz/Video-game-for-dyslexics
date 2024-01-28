// @desc Inicializacion & Globals
randomize();

global.game_save_slot = 0;

global.game_paused = false;
global.text_speed = .75;

global.animation_activate = false;

global.target_room = -1;
global.target_x = -1;
global.target_y = -1;
global.target_direction = 0;

//Player
global.player_health_max = 5;
global.player_health = global.player_health_max;
global.player_money = 100;

//Items
global.player_has_any_items = false;
global.player_equipped = ITEM.BOMB;
global.player_ammo = array_create(ITEM.TYPE_COUNT, -1);
global.player_item_unlocked = array_create(ITEM.TYPE_COUNT, false);
global.player_ammo[ITEM.BOMB] = 0;
global.player_ammo[ITEM.BOW] = 0;



//Quest
global.quest_status = ds_map_create();
global.quest_status[? "TheBookQuest"] = 0;
global.quest_status[? "TheQuizz"] = 0;
global.quest_status[? "TheAlphabet"] = 0;

//Lift
global.i_lifted = noone;


global.i_camara = instance_create_layer(0, 0, layer, obj_camara);
global.i_ui = instance_create_layer(0, 0, layer, obj_ui);


display_set_gui_size(RESOLUTION_W,RESOLUTION_H);
room_goto(ROOM_START);
