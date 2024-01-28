function scr_room_to_area_name(_room_name){
	switch _room_name{
		case rm_village: return "El Pueblo"; break;
		case rm_river: return "El Rio"; break;	
		case rm_home_01: return "Casa"; break;
		default: return	"Area Bloqueada"; break;
	}
}