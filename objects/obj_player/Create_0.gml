
enum MOVEMENT_STATES {
	
	FREE_MOVEMENT,
	USE_ABILITY,
	LENGTH
	
}

enum DIRECTIONS {
	
	EAST,
	NORTH,
	WEST,
	SOUTH,
	LENGTH
	
}

movement_state = MOVEMENT_STATES.FREE_MOVEMENT;

sprite_index = spr_player;
global.current_ability = ABILITY.NONE;


get_move_speed = function() { 
	return global.current_ability == ABILITY.ELECTRICITY ? 750 : 600;
}

movement_free = function() {
	
	var _spd = get_move_speed() * global.dt_steady;
	var _xinput = 0;
	var _yinput = 0;
	for (var i = 0; i < DIRECTIONS.LENGTH; i++;) {
	
		if (global.directions_pressed[i]) {
		
			switch (i) {
				
				case DIRECTIONS.EAST:
					_xinput++;
					break;
				case DIRECTIONS.NORTH:
					_yinput--;
					break;
				case DIRECTIONS.WEST:
					_xinput--;
					break;
				case DIRECTIONS.SOUTH:
					_yinput++;
					break;
				
			}
		
		}
	
	}
	var _dir = point_direction(0, 0, _xinput, _yinput);
	if (_xinput == 0 && _yinput == 0) _spd = 0;
	
	move(_spd, _dir);
	
}

use_ability = function() {
	// code to perform ability action here
	switch (global.current_ability) {
		case ABILITY.DARKNESS:
			with(obj_enemy_parent) {
				if (distance_to_object(obj_player) < 200 && movement_state == MOVEMENT_STATES_ENEMY.PURSUE) {
					start_movement_patrol_from_pursue();
					global.current_ability = ABILITY.NONE;
				}
			}
			break;
		case ABILITY.ELECTRICITY:
			with(obj_lever) {
				if (distance_to_object(obj_player) < 80) {
					toggle();
					global.current_ability = ABILITY.NONE;
				}
			}
			break;
		default:
			global.current_ability = ABILITY.NONE;
	}
	
	movement_state = MOVEMENT_STATES.FREE_MOVEMENT;
}


check_caught = function() {
	
	if (place_meeting(x, y, obj_enemy_parent)) {
		
		player_restart_failure();
		
	}
	
}

check_for_burning = function() {
	if (global.current_ability == ABILITY.FIRE) {
		with(obj_wood) {
			if (distance_to_object(obj_player) < 15 && state == STATE.INTACT) {
				start_burning();
			}
		}
	}
}

change_sprite = function() {
	switch (global.current_ability) {
		case ABILITY.NONE:
			sprite_index = spr_player;
			break;
		case ABILITY.FIRE:
			sprite_index = spr_fire_player;
			break;
		case ABILITY.WATER:
			sprite_index = spr_water_player;
			break;
		case ABILITY.ELECTRICITY:
			sprite_index = spr_electricity_player;
			break;
		case ABILITY.DARKNESS:
			sprite_index = spr_darkness_player;
			break;
		case ABILITY.TELEPORTATION:
			sprite_index = spr_teleportation_player;
			break;
	}
}