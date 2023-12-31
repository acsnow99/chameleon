
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
image_speed_default = 1;
image_speed = image_speed_default;

base_move_speed = 350;

get_move_speed = function() { 
	multiplier = 1;
	
	if (place_meeting(x, y, obj_environment_water)) {
		multiplier = global.current_ability == ABILITY.WATER ? 1.35 : 0.5;
	}
	
	return base_move_speed * multiplier;
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
	
	if (_xinput == 1) {
		image_angle = 90;
	}
	else if (_yinput == -1) {
		image_angle = 180;
	}
	else if (_xinput == -1) {
		image_angle = 270;
	}
	else if (_yinput == 1) {
		image_angle = 0;
	}
	
	var _dir = point_direction(0, 0, _xinput, _yinput);
	if (_xinput == 0 && _yinput == 0) { 
		_spd = 0; image_speed = 0; 
	}
	else { 
		image_speed = image_speed_default; 
		try_play_water_step_sound();
	}
	
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
			if (!audio_is_playing(snd_fx_elec_player)) {
				audio_play_sound(snd_fx_elec_player, 1, false);
			}
			with(obj_lever) {
				if (distance_to_object(obj_player) < 40) {
					toggle();
					global.current_ability = ABILITY.NONE;
				}
			}
			with (obj_environment_water) {
				if (place_meeting(x, y, obj_player)) {
					make_dangerous_to_enemies();
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

play_sounds = function() {
	if (global.current_ability == ABILITY.FIRE and !audio_is_playing(snd_fx_fire_player)) {
		audio_play_sound(snd_fx_fire_player, 0.75, true);
	}
	if (global.current_ability != ABILITY.FIRE) {
		audio_stop_sound(snd_fx_fire_player);
	}
	
	if (global.current_ability == ABILITY.ELECTRICITY and !audio_is_playing(snd_fx_elec_player_background)) {
		audio_play_sound(snd_fx_elec_player_background, 0.75, true);
	}
	if (global.current_ability != ABILITY.ELECTRICITY) {
		audio_stop_sound(snd_fx_elec_player_background);
	}
}

try_play_water_step_sound = function() {
	if (place_meeting(x, y, obj_environment_water) and !audio_is_playing(snd_fx_water0) and !audio_is_playing(snd_fx_water1) and !audio_is_playing(snd_fx_water2)) {
		var _i = irandom(2);
		switch (_i) {
			case 0:
				var _snd = snd_fx_water0;
				break;
			case 1:
				var _snd = snd_fx_water1;
				break;
			case 2:
				var _snd = snd_fx_water2;
				break;
		}
		audio_play_sound(_snd, 0.75, false);
	}
}

