
self_next_room = function() {
	global.num_abilities_obtained++;
	global.abilities_obtained[ability_index] = true;
	obj_ctrl_change_room.start_next_room(room_index);
}
