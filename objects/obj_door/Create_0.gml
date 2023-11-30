is_open = initial_open_state;

original_x = x;
original_y = y;

open = function() {
	x = -1000;
	y = -1000;
	is_open = true;
	audio_play_sound(snd_fx_door_open, 1, false);
}

close = function() {
	x = original_x;
	y = original_y;
	is_open = false;
	audio_play_sound(snd_fx_door_open, 1, false);
}

toggle = function() {
	switch (is_open) {
		case false:
			open();
			break;
		case true:
			close();
			break;
	}
}

reset = function() {
	switch (initial_open_state) {
		case false:
			close();
			break;
		case true:
			open();
			break;
	}
	
	is_open = initial_open_state;
}

if (is_open) {
	open();
}