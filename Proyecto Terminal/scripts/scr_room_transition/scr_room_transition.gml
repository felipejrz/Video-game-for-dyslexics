//@desc Room transition
function scr_room_transition(_type, _target_room){
	if !(instance_exists(obj_transition)){
		with (instance_create_depth(0, 0, -9999, obj_transition)){
			type = _type;
			target = _target_room;
		}
	}else show_debug_message("No se pudo perro intanta hacer las transicion bien")
}