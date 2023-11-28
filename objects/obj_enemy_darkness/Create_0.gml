event_inherited();

reset_fading = function() {
	opacity = 1.5;
	fading_dir = -0.015;
}

reset_fading();

restart = function() {
	movement_state = MOVEMENT_STATES_ENEMY.PATROL;
	path_started = false;
	stop_stun();
	x = path_get_point_x(patrol_path, 0);
	y = path_get_point_y(patrol_path, 0);
	
	reset_fading();
}