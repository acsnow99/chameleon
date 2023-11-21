
dangerous_to_enemies = false;
alarmvar_dangerous_to_enemies_default = 1;
alarmvar_dangerous_to_enemies = 0;


make_dangerous_to_enemies = function() {
	if (dangerous_to_enemies) {
		return;
	}
	dangerous_to_enemies = true;
	sprite_index = spr_electricity_player;
	alarmvar_dangerous_to_enemies = alarmvar_dangerous_to_enemies_default;
	for (var i = 0; i < instance_number(obj_environment_water); i++) {
		var o = instance_find(obj_environment_water, i);
		if (distance_to_object(obj_environment_water) <= sprite_width/2) {
			o.make_dangerous_to_enemies();
		}
	}
}

make_safe_to_enemies = function() {
	dangerous_to_enemies = false;
	sprite_index = spr_water_environment;
}

