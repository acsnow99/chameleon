
enum MOVEMENT_STATES {
	
	FREE_MOVEMENT,
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
move_speed = 600;

// TODO: check for attack button and change the state


movement_free = function() {
	
	var _spd = move_speed * global.dt_steady;
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


check_caught = function() {
	
	if (place_meeting(x, y, obj_enemy_parent)) {
		
		player_restart_failure();
		
	}
	
}
