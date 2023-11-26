
global.mve_inputs_keyboard[0] = ord("D");
global.mve_inputs_keyboard[1] = ord("W");
global.mve_inputs_keyboard[2] = ord("A");
global.mve_inputs_keyboard[3] = ord("S");
global.mve_inputs_keyboard[4] = vk_right;
global.mve_inputs_keyboard[5] = vk_up;
global.mve_inputs_keyboard[6] = vk_left;
global.mve_inputs_keyboard[7] = vk_down;
global.keyboard_input_count = 8;

alarmvar_end_ability_defaults[ABILITY.NONE] = 50000;
alarmvar_end_ability_defaults[ABILITY.FIRE] = 5;
alarmvar_end_ability_defaults[ABILITY.ELECTRICITY] = 5000;
alarmvar_end_ability_defaults[ABILITY.WATER] = 5000;
alarmvar_end_ability_defaults[ABILITY.DARKNESS] = 5000;
alarmvar_end_ability_defaults[ABILITY.TELEPORTATION] = 5000;
alarmvar_end_ability = 0;

alarmvar_cooldown_ability_defaults[ABILITY.NONE] = 0;
alarmvar_cooldown_ability_defaults[ABILITY.FIRE] = 3;
alarmvar_cooldown_ability_defaults[ABILITY.ELECTRICITY] = 2;
alarmvar_cooldown_ability_defaults[ABILITY.WATER] = 5;
alarmvar_cooldown_ability_defaults[ABILITY.DARKNESS] = 10;
alarmvar_cooldown_ability_defaults[ABILITY.TELEPORTATION] = 5;
alarmvar_cooldown_ability[ABILITY.NONE] = 0;
alarmvar_cooldown_ability[ABILITY.FIRE] = 0;
alarmvar_cooldown_ability[ABILITY.ELECTRICITY] = 0;
alarmvar_cooldown_ability[ABILITY.WATER] = 0;
alarmvar_cooldown_ability[ABILITY.DARKNESS] = 0;
alarmvar_cooldown_ability[ABILITY.TELEPORTATION] = 0;


reset_input_booleans_to_false = function() {
	
	for (var i = 0; i < 4; i++) global.directions_pressed[i] = false;
	
}


ability_update = function() {
	ability_update_based_on_time();
	ability_update_based_on_environment();
	ability_update_cooldowns();
}


ability_update_based_on_time = function() {
	if (alarmvar_end_ability >= 500) {
		return;
	}
	alarmvar_end_ability -= global.dt_steady;
	if (alarmvar_end_ability <= 0) {
		end_ability();
	}
}

ability_update_based_on_environment = function() {
	switch global.current_ability{
		case ABILITY.FIRE:
			with (obj_player) {
				if (place_meeting(x, y, obj_environment_water)) {
					other.end_ability();
				}
			}
			break;
		default:
			return;
	}
}

ability_update_cooldowns = function() {
	for (var i = 0; i < ABILITY.LENGTH; i++) {
		if (i != global.current_ability && alarmvar_cooldown_ability[i] > 0) {
			alarmvar_cooldown_ability[i] -= global.dt_steady;
		}
	}
}


end_ability = function() {
	global.current_ability = ABILITY.NONE;
}
