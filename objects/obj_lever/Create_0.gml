toggle = function() {
	with(obj_door) {
		if (key == other.key) {
			toggle();
		}
	}
	
	switch (sprite_index) {
		case spr_lever_off:
			audio_play_sound(snd_fx_switch_on, 0.5, false);
			sprite_index = spr_lever_on;
			break;
		case spr_lever_on:
			audio_play_sound(snd_fx_switch_off, 0.5, false);
			sprite_index = spr_lever_off;
			break;
	}
		
}