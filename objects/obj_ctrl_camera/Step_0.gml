
if (!global.levels_initiated) {
	global.levels_initiated = levels_init();
	exit;
}
global.level = level_seek(obj_player.x, obj_player.y);

#macro view view_camera[0]

camera_set_view_size(view, global.view_width, global.view_height);


#region crash prevention
if (!instance_exists(focus_obj) || !global.levels_initiated) {
	
	exit;
	
}
#endregion
	
	
var _focusx = focus_obj.x;
var _focusy = focus_obj.y;
	
	
var _min_x = global.levels[global.level, 0];
var _max_x = global.levels[global.level, 1];
var _min_y = global.levels[global.level, 2];
var _max_y = global.levels[global.level, 3];
	
	
var _camera_focusx = _focusx - global.view_width / 2;
var _camera_focusy = _focusy - global.view_height / 2;


var _x = clamp(_camera_focusx, _min_x, _max_x - global.view_width);
var _y = clamp(_camera_focusy, _min_y, _max_y - global.view_height);
	
var _cur_x = camera_get_view_x(view);
var _cur_y = camera_get_view_y(view);


var _spd = cam_spd;


//set the camera's position
camera_set_view_pos(view, round(lerp(_cur_x, _x, _spd)), round(lerp(_cur_y, _y, _spd)));
	