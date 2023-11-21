
enum MOVEMENT_STATES_ENEMY {
	
	PATROL,
	PURSUE,
	START_PATROL,
	LENGTH
	
}

movement_state = MOVEMENT_STATES_ENEMY.PATROL;
patrol_path = pth_updown;
path_speed_default = 5;
path_speed = path_speed_default;
path_started = false;
move_speed_pursuit = 400;
// distance within which the enemy starts chasing the player
detect_distance = 200;
stop_pursuit_distance = 400;
start_path_from_pursue_distance = 10;

patrol_start_target_x = 0;
patrol_start_target_y = 0;

stunned_by_electricity = false;
alarmvar_stunned_by_electricity_default = 2;
alarmvar_stunned_by_electricity = 0;
path_speed_set_post_stunned = true;


movement_patrol = function() {
	stunned_update();
	if (stunned_by_electricity) {
		if (path_speed > 0) {
			path_speed_pre_stunned = path_speed;
			path_speed_set_post_stunned = false;
		}
		path_speed = 0;
		return;
	}
	else {
		if (!path_speed_set_post_stunned) {
			path_speed = path_speed_pre_stunned;
			path_speed_set_post_stunned = true;
		}
	}
	
	if (!path_started) {
		path_start(patrol_path, path_speed, path_action_reverse, true);
		path_started = true;
	}
	
	if (can_see_player()) {
		start_movement_pursue();	
	}
	
}

movement_patrol_from_pursue = function() {
	stunned_update();
	if (stunned_by_electricity) {
		return;
	}
	
	if (distance_to_point(patrol_start_target_x, patrol_start_target_y) < start_path_from_pursue_distance) {
		start_movement_patrol();
	}
	
	var _spd = global.dt_steady * move_speed;
	var _dir = point_direction(x, y, patrol_start_target_x, patrol_start_target_y);
	move(_spd, _dir);
}

movement_pursue = function() {
	stunned_update();
	if (stunned_by_electricity) {
		return;
	}
	
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


can_see_player = function() {
	return distance_to_object(obj_player) < detect_distance && !collision_line(x, y, obj_player.x, obj_player.y, global.collision_layer, false, true);
}


stunned_update = function() {
	if (!stunned_by_electricity) {
		check_stunned();
	}
	else {
		alarmvar_stunned_by_electricity -= global.dt_steady;
		if (alarmvar_stunned_by_electricity <= 0) {
			stunned_by_electricity = false;
		}
	}
	return stunned_by_electricity;
}

check_stunned = function() {
	if (stunned_by_electricity) {
		return;
	}
	if (place_meeting(x, y, obj_environment_water)){
		if (instance_nearest(x, y, obj_environment_water).dangerous_to_enemies) {
			stunned_by_electricity = true;
			alarmvar_stunned_by_electricity = alarmvar_stunned_by_electricity_default;
		}
	}
}


restart = function() {
	movement_state = MOVEMENT_STATES_ENEMY.PATROL;
	path_started = false;
}
