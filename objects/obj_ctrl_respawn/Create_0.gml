
global.respawn_x = 0;
global.respawn_y = 0;


set_respawn_point = function(_respawn_point) {
	
	global.respawn_x = _respawn_point.x;
	global.respawn_y = _respawn_point.y;
	
	for (var i = 0; i < instance_number(obj_respawn_point_trigger); i++) {
		var _o = instance_find(obj_respawn_point_trigger, i);
		_o.is_current_respawn_point = false;
	}
	_respawn_point.is_current_respawn_point = true;
	
}
