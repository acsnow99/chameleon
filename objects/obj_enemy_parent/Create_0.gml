
enum MOVEMENT_STATES_ENEMY {
	
	PATROL,
	CHASE,
	LENGTH
	
}

movement_state = MOVEMENT_STATES_ENEMY.PATROL;
patrol_path = pth_updown;
path_speed = 5;
path_started = false;


movement_patrol = function() {
	
	if (!path_started) {
		path_start(patrol_path, path_speed, path_action_reverse, true);
		path_started = true;	
	}
	
}


restart = function() {
	
	movement_state = MOVEMENT_STATES_ENEMY.PATROL;
	path_started = false;
	
}
