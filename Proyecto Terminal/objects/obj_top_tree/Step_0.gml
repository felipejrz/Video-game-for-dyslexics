if position_meeting(obj_player.x, obj_player.y, id){
	image_alpha = max(image_alpha - 0.4, 0.25);	
}else{
	image_alpha = min(image_alpha + 0.4, 1.00);	
}