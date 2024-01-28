//@arg Respuestas
function scr_dialogues_responses(_opcion){
	switch(_opcion){
		case 0: break;
		case 1: {
			scr_collect_coins(1);
			opcion = floor(random_range(1, 6));
			switch(opcion){
			    case 1: scr_new_text_box("\n¡Muy bien! Respuesta correcta.", 0); break;
			    case 2: scr_new_text_box("\nCorrecto, elegiste la respuesta válida.", 0); break;
			    case 3: scr_new_text_box("\nEso es correcto, tu elección es válida.", 0); break;
			    case 4: scr_new_text_box("\n¡Exacto! La respuesta es correcta.", 0); break;
			    case 5: scr_new_text_box("\nBien hecho, has seleccionado \nla respuesta adecuada.", 0); break;
			    case 6: scr_new_text_box("\nSí, tu respuesta es válida. ¡Buena elección!", 0); break;
			    default: break;
			}
			scr_new_text_box("¿Quieres seguir Jugando?", 0, ["7:Si", "3:No"]);
		}break;
		case 2: {
				global.quest_status[? "TheQuizz"] = 1;
				scr_new_text_box("\nRespuesta Incorreccta", 0);
			}break;
		case 3: {
				global.quest_status[? "TheQuizz"] = 1;
				scr_new_text_box("Gracias por jugar", 0); 
			}break;
		case 4:{
			scr_new_text_box("Gracias");
			scr_new_text_box("Los ogros se fuero hacia el norte\no puede ver mas de ellos");
			global.quest_status[? "TheBookQuest"] = 1;
		} break;
		case 5: scr_new_text_box("Supongo que no eres tan valiente!"); break;
		case 6: scr_purchase_item(activate.item, activate.item_amount, activate.item_cost); break;
		case 7: {
			global.quest_status[? "TheQuizz"] = 2;
			scr_activate_quizz();
		}break;
		case 8: scr_new_text_box("\nVuelve cuando quieras jugar de nuevo."); break;
		default: break;
			
	}
}