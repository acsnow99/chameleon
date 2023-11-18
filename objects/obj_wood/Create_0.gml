enum STATE {
	INTACT,
	BURNING,
	BURNED,
	LENGTH
}

state = STATE.INTACT;

original_x = x;
original_y = y;

start_burning = function() {
	state = STATE.BURNING;
	alarm[0] = 2 * game_get_speed(gamespeed_fps);
}

reset = function() {
	x = original_x;
	y = original_y;
	alarm[0] = -1;
	state = STATE.INTACT;
}