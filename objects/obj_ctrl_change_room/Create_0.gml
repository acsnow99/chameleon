
enum ROOMS {
	TUTORIAL,
	FIRE,
	ELECTRICITY,
	NEXT,
	LENGTH
}
enum DATA {
	START_X,
	START_Y,
	ROOM,
	LENGTH
}

room_data[ROOMS.NEXT, DATA.START_X] = 3524;
room_data[ROOMS.NEXT, DATA.START_Y] = 1474;
room_data[ROOMS.NEXT, DATA.ROOM] = Room_next;


start_next_room = function(_room_index) {
	room_goto(room_data[_room_index, DATA.ROOM]);
	obj_ctrl_camera.levels_init();
	
	// NOT NECESSARY RIGHT NOW
	//obj_player.x = room_data[_room_index, DATA.START_X];
	//obj_player.y = room_data[_room_index, DATA.START_Y];
}
