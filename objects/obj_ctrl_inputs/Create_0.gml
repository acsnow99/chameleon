
global.mve_inputs_keyboard[0] = ord("D");
global.mve_inputs_keyboard[1] = ord("W");
global.mve_inputs_keyboard[2] = ord("A");
global.mve_inputs_keyboard[3] = ord("S");
global.mve_inputs_keyboard[4] = vk_right;
global.mve_inputs_keyboard[5] = vk_up;
global.mve_inputs_keyboard[6] = vk_left;
global.mve_inputs_keyboard[7] = vk_down;
global.keyboard_input_count = 8;

reset_input_booleans_to_false = function() {
	
	for (var i = 0; i < 4; i++) global.directions_pressed[i] = false;
	
}

