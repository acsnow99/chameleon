
global.text_active = false;

text_max_width = sprite_get_width(spr_hud_textbox) - 150;
text_wrapped = "";
room_index = ROOMS.TUTORIAL;
text_by_level[ROOMS.TUTORIAL] = "Welcome to Scalemental. You are a chameleon that has escaped from a strange laboratory filled with animals that have elemental powers and aggressive personalities. Control your chameleon with WASD or arrow keys, and stay out of sight of the patrolling animals!";
text_by_level[ROOMS.ELECTRICITY] = "Your chameleon has learned how to change its scales to the color CYAN. Press 1 to turn CYAN and then press SPACE to apply an electric shock. Electricity can turn on blue electricity switches and stun enemies that are in water.";
text_by_level[ROOMS.FIRE] = "Your chameleon has learned how to change its scales to the color RED. Press 2 to turn RED and light yourself on fire! While you're on fire, enemies run away from you. Touching wooden walls while RED will burn them away, opening new paths.";
text_by_level[ROOMS.FIRE_ELECTRICITY] = "Now, for a challenge... Use the powers of CYAN and RED to get through this maze. Good luck.";
text_by_level[ROOMS.CONGRATULATIONS] = "YOU DID IT! Your chameleon escaped to the outside world with your help. No more stressful escapes for him. Exit with Escape or wait a second to begin New Game+";

alarmvar_stop_display_text_default = 7;

draw_set_font(fnt_basic);


alarmvar_end_game_default = 10;
alarmvar_end_game = 0;


wrap_text = function(_text, _maxwidth) {

	var _text_length = string_length(_text);
	var _last_space = 1;

	var _count = 1;
	var _sub_text;

	repeat(_text_length) {
		
		_sub_text = string_copy(_text, 1, _count);
	
		if (string_char_at(_text, _count) == " ") _last_space = _count;
	
		if (string_width(_sub_text) > _maxwidth){
			
			_text = string_delete(_text, _last_space, 1);
			_text = string_insert("\n", _text, _last_space);
		
		}
	
		_count++;
		
	}

	return _text;

}


start_drawing_text = function(_room_index) {
	room_index = _room_index;
	global.text_active = true;
	
	if (room_index == ROOMS.CONGRATULATIONS) {
		alarmvar_end_game = alarmvar_end_game_default;
	}
}
