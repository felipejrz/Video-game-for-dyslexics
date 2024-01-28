function scr_collect_coins(_amount){
	global.player_money += _amount;
}

function scr_collect_ammo(_array){
	//array = [type, ammo]
	global.player_ammo[_array[0]] += _array[1];
}