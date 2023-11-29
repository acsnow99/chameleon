movement_patrol = function() {
	stunned_update();
	if (stunned_by_electricity) {
		path_speed = 0;
		return;
	}
	
	path_speed = (path_speed > 0 ? 1 : -1) * get_path_speed();
	
	if (!path_started) {
		path_start(patrol_path, get_path_speed(), path_action_restart, true);
		path_started = true;
	}
	
	if (can_see_player()) {
		start_movement_pursue();	
	}
}