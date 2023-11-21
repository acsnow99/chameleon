
reset_input_booleans_to_false();
for (var i = 0; i < global.keyboard_input_count; i++) {

	if (keyboard_check(global.mve_inputs_keyboard[i])) global.directions_pressed[i % 4] = true;
	
}



for (var i = 0; i < ABILITY.LENGTH; i++) {
	if (keyboard_check(ord(string(i)))) {
		switch i {
			case 0:
				global.current_ability = ABILITY.NONE;
				break;
			case 1:
				global.current_ability = ABILITY.FIRE;
				break;
			case 2:
				global.current_ability = ABILITY.WATER;
				break;
			case 3:
				global.current_ability = ABILITY.ELECTRICITY;
				break;
			case 4:
				global.current_ability = ABILITY.DARKNESS;
				break;
			case 5:
				global.current_ability = ABILITY.TELEPORTATION;
				break;
		}
		alarmvar_end_ability = alarmvar_end_abilitiy_defaults[global.current_ability];
	}
}

ability_update();
