

if (!is_current_respawn_point && place_meeting(x, y, obj_player)) {
	
	// sets is_current_respawn_point for this object and global.respawn_x and y
	obj_ctrl_respawn.set_respawn_point(self);
	
}
