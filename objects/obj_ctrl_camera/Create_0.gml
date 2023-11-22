/// @description view setup - size
//See obj_camera in Eclipse files for more source code

//camera

global.default_view_width = 1080;
global.view_width = global.default_view_width;
global.default_view_height = 720;
global.view_height = global.default_view_height;
global.window_scale = 0.5;

window_set_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
surface_resize(application_surface, global.view_width*global.window_scale, global.view_height*global.window_scale);
display_set_gui_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
window_set_fullscreen(true);
camera_set_view_size(view_camera[0], global.view_width, global.view_height);


depth = -1;

_x = 0;
_y = 0;

cam_spd = 0.15;
focus_obj = obj_player;


global.levels_initiated = false;


cam_reset = function() {
	
	//reset camera settings to normal gameplay
	global.view_width = global.default_view_width;
	global.view_height = global.default_view_height;
	focus_obj = obj_player;
	
}



levels_init = function() {
	
	global.level_count = instance_number(obj_level_frame) - 1;

	for (var i = 0; i <= global.level_count; i++) {
	
		var _this_frame = instance_find(obj_level_frame, i);
	
		//mins and maxes for each level's camera reach
		global.levels[i, 0] = _this_frame.x;
		global.levels[i, 1] = global.levels[i, 0] + _this_frame.sprite_width;
		global.levels[i, 2] = _this_frame.y;
		global.levels[i, 3] = global.levels[i, 2] + _this_frame.sprite_height;
	
	
	}
	
	return true;

}

level_seek = function(_focusx, _focusy) {
	
	for (var i = 0; i < instance_number(obj_level_frame); i++) {
		
		var _min_x = global.levels[i, 0];
		var _max_x = global.levels[i, 1];
		
		var _min_y = global.levels[i, 2];
		var _max_y = global.levels[i, 3];
		
		if (_focusx >= _min_x && _focusx <= _max_x && _focusy >= _min_y && _focusy <= _max_y) {
			
			return i;
		
		}
		
	}
	
	return -1;
	
}
