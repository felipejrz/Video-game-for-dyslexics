function scr_screen_shake(_magnitude, _frames){
	// @desc ScreenShake (magnitude, frames)
	// @arg Magnitude sets the strength of the shake (distance range)
	// @ Frames sets the length of the shake  in frames (60 = 1 sec)
	with (global.i_camara) 
	{
		if (_magnitude > shake_remain) 
		{
			shake_magnitude = _magnitude; 
			shake_remain = shake_magnitude; 
			shake_length = _frames; 
	
		}
	}
}
