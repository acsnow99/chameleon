
reset_input_booleans_to_false();
for (var i = 0; i < global.keyboard_input_count; i++) {

	if (keyboard_check(global.mve_inputs_keyboard[i])) global.directions_pressed[i % 4] = true;
	
}
	