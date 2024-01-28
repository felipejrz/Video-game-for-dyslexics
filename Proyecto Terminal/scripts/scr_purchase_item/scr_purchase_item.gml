function scr_purchase_item(_item, _amount, _cost){
	if global.player_money >= _cost{
		global.player_has_any_items = true;
		global.player_item_unlocked[_item] = true;
		global.player_ammo[_item] += _amount;
		global.player_money -= _cost;
		global.player_equipped = _item;
		instance_destroy(activate);
		
		var _desc = "";
		switch _item{
			case ITEM.BOMB: _desc = "Son bombas que pueden explorar rocas\n queinterfiern en tu camino"; break;
			case ITEM.BOW: _desc = "Arco que las flechas estan chidas"; break;
			case ITEM.HOOK: _desc = "Arpon que te traslada a muchos lugares"; break;
			default: _desc = "Item no encontrado"; break;	
		}
		scr_new_text_box(_desc, 0);
	}else{
		scr_new_text_box("No tienes tanto dinero...", 0);
	}
}