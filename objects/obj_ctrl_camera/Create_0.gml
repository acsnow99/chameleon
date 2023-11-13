/// @description view setup - size
//See obj_camera in Eclipse files for more source code

//camera

global.default_view_width = 2160;
global.view_width = global.default_view_width;
global.default_view_height = 1440;
global.view_height = global.default_view_height;
global.window_scale = 0.5;

window_set_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
surface_resize(application_surface, global.view_width*global.window_scale, global.view_height*global.window_scale);
display_set_gui_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
window_set_fullscreen(false);
camera_set_view_size(view_camera[0], global.view_width, global.view_height);


depth = -1;

_x = 0;
_y = 0;


cam_reset = function() {
	
	//reset camera settings to normal gameplay
	global.view_width = global.default_view_width;
	global.view_height = global.default_view_height;
	focus_obj = obj_player;
	focus_quick = true;
	
}
