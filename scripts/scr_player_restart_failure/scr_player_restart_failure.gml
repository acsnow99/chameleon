// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_restart_failure() {
	
	if (!instance_exists(obj_player)) return;
	
	obj_ctrl_enemies.restart_enemies();
	with(obj_player) {
		x = global.respawn_x;
		y = global.respawn_y;
	}
	global.current_ability = ABILITY.NONE;

}