
global.text_active = true;

text_max_width = sprite_get_width(spr_hud_textbox) - 26;
text_wrapped = "";
room_index = ROOMS.TUTORIAL;
text_by_level[ROOMS.TUTORIAL] = "Hey how are ya?";

draw_set_font(fnt_basic);


wrap_text = function(_text, _maxwidth) {{

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
}
