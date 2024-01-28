function scr_activate_book(){
var _has_book = (global.i_lifted != noone) && (global.i_lifted.object_index == obj_book);
	switch (global.quest_status[? "TheBookQuest"]){
		case 0: //not started
		{
			//player might have brought the hat back anyway
			if (_has_book){
				//complete quest
				scr_new_text_box("\nGracias por traer mi libro ahora podre volver a leer.",0);
				global.quest_status[? "TheBookQuest"] = 2;
				with (obj_book) instance_destroy();
				scr_player_drop_item();
			}else{
				//offer quest
				scr_new_text_box("Hola joven viajero eh perdido mi \nlibro te gustaria recuperarlo \npor mi?",0);
				scr_new_text_box("\Me lo robaron unos ogros muy extraños",0, ["4:Claro que si", "5:Ahora no puedo"]);
			}	
		}break;
		
		case 1: //quest in progress
		{
			if (_has_book){
				//complete quest
				scr_new_text_box("\nGracias por encontrar mi libro",0);
				global.quest_status[? "TheBookQuest"] = 2;
				with (obj_book) instance_destroy();
				scr_player_drop_item();
			}else{
				//clue reminder
				scr_new_text_box("\nLos ogros se fuero hacia el norte\nno puede ver más de ellos");
			}
			
		}break;
		
		case 2: //quest already completed
		{
			scr_new_text_box("Este libro cuenta de como un\nniño creo algo maravilloso.");
		} break;
	}
}