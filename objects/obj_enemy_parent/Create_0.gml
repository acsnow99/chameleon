
enum MOVEMENT_STATES_ENEMY {
	
	PATROL,
	PURSUE,
	START_PATROL,
	LENGTH
	
}

movement_state = MOVEMENT_STATES_ENEMY.PATROL;
path_started = false;
base_path_speed = 2.5;
base_pursue_speed = 265;
// distance within which the enemy starts chasing the player
detect_distance = 150;
stop_pursuit_distance = 400;
start_path_from_pursue_distance = 10;

patrol_start_target_x = 0;
patrol_start_target_y = 0;

stunned_by_electricity = false;

get_speed_multiplier = function() {
	if (stunned_by_electricity) {
		return 0;
	} else if (place_meeting(x, y, obj_environment_water)) {
		return object_index == obj_enemy_water ? 1.4 : 0.55;
	} else {
		return 1;
	}
}

get_path_speed = function() {
	return base_path_speed * get_speed_multiplier();
}

get_pursue_speed = function() {
	return base_pursue_speed * get_speed_multiplier();
}

path_speed_pre_stunned = get_path_speed();
// how long the enemy is stunned by electricity
alarmvar_stunned_by_electricity_default = 4;
alarmvar_stunned_by_electricity = 0;

movement_patrol = function() {
	stunned_update();
	if (stunned_by_electricity) {
		path_speed = 0;
		return;
	}
	
	path_speed = (path_speed > 0 ? 1 : -1) * get_path_speed();
	
	if (!path_started) {
		path_start(patrol_path, get_path_speed(), path_action_reverse, true);
		path_started = true;
	}
	
	if (can_see_player()) {
		start_movement_pursue();	
	}
}

movement_patrol_from_pursue = function() {
	/* 
	// PREVIOUS CODE - MOVES TOWARDS START OF PATROL PATH THEN STARTS PATROLLING
	//  - PRONE TO GETTING STUCK ON WALLS
	stunned_update();
	if (stunned_by_electricity) {
		return;
	}
	
	if (distance_to_point(patrol_start_target_x, patrol_start_target_y) < start_path_from_pursue_distance) {
		start_movement_patrol();
	}
	
	var _spd = global.dt_steady * get_pursue_speed();
	var _dir = point_direction(x, y, patrol_start_target_x, patrol_start_target_y);
	move(_spd, _dir);
	*/
	x = patrol_start_target_x;
	y = patrol_start_target_y;
	start_movement_patrol();
	
}

movement_pursue = function() {
	stunned_update();
	if (stunned_by_electricity) {
		return;
	}
	
	if (distance_to_object(obj_player) > stop_pursuit_distance || collision_line(x, y, obj_player.x, obj_player.y, global.collision_layer, false, true)) {
		start_movement_patrol_from_pursue();
		return;
	}
	
	var _spd = global.dt_steady * get_pursue_speed();
	var _dir = 0;
	if (global.current_ability == ABILITY.FIRE) {
		_dir = point_direction(obj_player.x, obj_player.y, x, y);
	}
	else {
		_dir = point_direction(x, y, obj_player.x, obj_player.y);
	}
	
	move(_spd, _dir);
}


start_movement_patrol = function() {
	movement_state = MOVEMENT_STATES_ENEMY.PATROL;
	path_start(patrol_path, get_path_speed(), path_action_reverse, true);
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
}


can_see_player = function() {
	return point_distance(obj_player.x, obj_player.y, x, y) < detect_distance && !collision_line(x, y, obj_player.x, obj_player.y, global.collision_layer, false, true);
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

stop_stun = function() {
	stunned_by_electricity = false;
	alarmvar_stunned_by_electricity = 0;
}


restart = function() {
	movement_state = MOVEMENT_STATES_ENEMY.PATROL;
	path_started = false;
	stop_stun();
	x = path_get_point_x(patrol_path, 0);
	y = path_get_point_y(patrol_path, 0);
}
