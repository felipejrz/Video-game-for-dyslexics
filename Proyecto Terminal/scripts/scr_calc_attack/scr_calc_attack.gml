//Usa el ataque y checa la hitbox
function scr_calc_attack(_hitbox){
	mask_index = _hitbox
	var _hit_byattack_now = ds_list_create();
	var _hits = instance_place_list(x, y, obj_p_entity, _hit_byattack_now, false);
	
	if (_hits > 0){
		for (var _i = 0; _i < _hits; _i++){
			var _hit_id = _hit_byattack_now[| _i];
			if (ds_list_find_index(hit_byattack, _hit_id) == -1){
				ds_list_add(hit_byattack, _hit_id)
				with (_hit_id){
					if (object_is_ancestor(object_index, obj_p_enemy)){
						scr_hurt_enemy(id, 5, other.id, 10);
					}
					if (entity_hit_script != -1) script_execute(entity_hit_script);
				}
			}
		}
	}
	ds_list_destroy(_hit_byattack_now);
	mask_index = spr_player;
}