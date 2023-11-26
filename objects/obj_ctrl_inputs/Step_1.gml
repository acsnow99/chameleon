
reset_input_booleans_to_false();
for (var i = 0; i < global.keyboard_input_count; i++) {

	if (keyboard_check(global.mve_inputs_keyboard[i])) global.directions_pressed[i % 4] = true;
	
}



for (var i = 0; i < ABILITY.LENGTH; i++) {
	if (keyboard_check(ord(string(i)))) {
		if (!global.abilities_obtained[i] || alarmvar_cooldown_ability[i] > 0) {
			return;
		}
		switch i {
			case ABILITY.NONE:
				global.current_ability = ABILITY.NONE;
				break;
			case ABILITY.FIRE:
				global.current_ability = ABILITY.FIRE;
				break;
			case ABILITY.WATER:
				global.current_ability = ABILITY.WATER;
				break;
			case ABILITY.ELECTRICITY:
				global.current_ability = ABILITY.ELECTRICITY;
				break;
			case ABILITY.DARKNESS:
				global.current_ability = ABILITY.DARKNESS;
				break;
			case ABILITY.TELEPORTATION:
				global.current_ability = ABILITY.TELEPORTATION;
				break;
		}
		alarmvar_end_ability = alarmvar_end_ability_defaults[global.current_ability];
		alarmvar_cooldown_ability[global.current_ability] = alarmvar_cooldown_ability_defaults[global.current_ability];
	}
}

ability_update();
