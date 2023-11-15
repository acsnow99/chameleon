toggle = function() {
	with(obj_door) {
		if (key == other.key) {
			toggle();
		}
	}
	
	switch (sprite_index) {
		case spr_lever_off:
			sprite_index = spr_lever_on;
			break;
		case spr_lever_on:
			sprite_index = spr_lever_off;
			break;
	}
		
}