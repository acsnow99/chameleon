
enum MOVEMENT_STATES_ENEMY {
	
	PATROL,
	PURSUE,
	START_PATROL,
	LENGTH
	
}

movement_state = MOVEMENT_STATES_ENEMY.PATROL;
patrol_path = pth_updown;
path_speed = 5;
path_started = false;
move_speed_pursuit = 400;
// distance within which the enemy starts chasing the player
detect_distance = 200;
stop_pursuit_distance = 400;
start_path_from_pursue_distance = 10;


movement_patrol = function() {
	
	if (!path_started) {
		path_start(patrol_path, path_speed, path_action_reverse, true);
		path_started = true;	
	}
	
	if (distance_to_object(obj_player) < detect_distance) {
		start_movement_pursue();	
	}
	
}

movement_patrol_from_pursue = function() {
	if (distance_to_point(patrol_start_target_x, patrol_start_target_y) < start_path_from_pursue_distance) {
		start_movement_patrol();
	}
	
	var _spd = global.dt_steady * move_speed;
	var _dir = point_direction(x, y, patrol_start_target_x, patrol_start_target_y);
	move(_spd, _dir);
}

movement_pursue = function() {
	if (distance_to_object(obj_player) > stop_pursuit_distance) {
		start_movement_patrol_from_pursue();
	}
	
	var _spd = global.dt_steady * move_speed;
	var _dir = point_direction(x, y, obj_player.x, obj_player.y);
	
	move(_spd, _dir);
}


start_movement_patrol = function() {
	movement_state = MOVEMENT_STATES_ENEMY.PATROL;
	path_start(patrol_path, path_speed, path_action_reverse, true);
	path_position = path_position_to_start_patrol;
}

start_movement_patrol_from_pursue = function() {
	movement_state = MOVEMENT_STATES_ENEMY.START_PATROL;
	
	var _point_count = path_get_number(patrol_path);
	var _x_start = path_get_point_x(patrol_path, 0);
	var _y_start = path_get_point_y(patrol_path, 0);
	var _x_end = path_get_point_x(patrol_path, _point_count - 1);
	var _y_end = path_get_point_y(patrol_path, _point_count - 1);
	
	// target either the beginning or end of the path and start patrolling from there 
	//  (may change to look for closest point out of the whole path)
	if (distance_to_point(_x_start, _y_start) < distance_to_point(_x_end, _y_end)) {
		patrol_start_target_x = _x_start;
		patrol_start_target_y = _y_start;
		path_position_to_start_patrol = 0;
	}
	else {
		patrol_start_target_x = _x_end;
		patrol_start_target_y = _y_end;
		path_position_to_start_patrol = 1;
	}
}

start_movement_pursue = function() {
	movement_state = MOVEMENT_STATES_ENEMY.PURSUE;
	path_end();
	move_speed = move_speed_pursuit;
}


restart = function() {
	
	movement_state = MOVEMENT_STATES_ENEMY.PATROL;
	path_started = false;
	
}
