// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_restart_failure() {
	
	//for (var i = 0; i < instance_number(obj_respawn_point_trigger); i++) {
	//	var _o = instance_find(obj_respawn_point_trigger, i);
	//	_o.is_current_respawn_point = false;
	//}
	with(obj_door) {
		reset();
	}
	
	with(obj_lever) {
		sprite_index = spr_lever_off;
	}
	
	with(obj_wood) {
		reset();
	}
	
	if (!instance_exists(obj_player)) return;
	
	obj_ctrl_enemies.restart_enemies();
	with(obj_player) {
		x = global.respawn_x;
		y = global.respawn_y;
	}
	global.current_ability = ABILITY.NONE;

}