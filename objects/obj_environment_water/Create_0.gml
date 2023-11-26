
dangerous_to_enemies = false;
alarmvar_dangerous_to_enemies_default = 1;
alarmvar_dangerous_to_enemies = 0;

image_speed = 0;
image_index = 0;


make_dangerous_to_enemies = function() {
	if (dangerous_to_enemies) {
		return;
	}
	dangerous_to_enemies = true;
	image_index = 1;
	alarmvar_dangerous_to_enemies = alarmvar_dangerous_to_enemies_default;
	for (var i = 0; i < instance_number(obj_environment_water); i++) {
		var o = instance_find(obj_environment_water, i);
		if (distance_to_object(o) <= 16) {
			o.make_dangerous_to_enemies();
		}
	}
}

make_safe_to_enemies = function() {
	dangerous_to_enemies = false;
	image_index = 0;
}

