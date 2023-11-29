
enum ROOMS {
	TUTORIAL,
	FIRE,
	ELECTRICITY,
	FIRE_ELECTRICITY,
	CONGRATULATIONS,
	NEXT,
	LENGTH
}
enum DATA {
	START_X,
	START_Y,
	ROOM,
	LENGTH
}


room_data[ROOMS.TUTORIAL, DATA.START_X] = 95;
room_data[ROOMS.TUTORIAL, DATA.START_Y] = 80;
room_data[ROOMS.TUTORIAL, DATA.ROOM] = Room_tutorial;

room_data[ROOMS.FIRE_ELECTRICITY, DATA.START_X] = 160;
room_data[ROOMS.FIRE_ELECTRICITY, DATA.START_Y] = 96;
room_data[ROOMS.FIRE_ELECTRICITY, DATA.ROOM] = Room_fire_electricity;

room_data[ROOMS.ELECTRICITY, DATA.START_X] = 144;
room_data[ROOMS.ELECTRICITY, DATA.START_Y] = 96;
room_data[ROOMS.ELECTRICITY, DATA.ROOM] = Room_electricity;

room_data[ROOMS.FIRE, DATA.START_X] = 160;
room_data[ROOMS.FIRE, DATA.START_Y] = 96;
room_data[ROOMS.FIRE, DATA.ROOM] = Room_fire_electricity;

room_data[ROOMS.NEXT, DATA.START_X] = 3524;
room_data[ROOMS.NEXT, DATA.START_Y] = 1474;
room_data[ROOMS.NEXT, DATA.ROOM] = Room_next;

room_data[ROOMS.CONGRATULATIONS, DATA.START_X] = 3918;
room_data[ROOMS.CONGRATULATIONS, DATA.START_Y] = 2000;
room_data[ROOMS.CONGRATULATIONS, DATA.ROOM] = Room_congrats;


start_next_room = function(_room_index) {
	global.text_active = false;
	room_goto(room_data[_room_index, DATA.ROOM]);
	
	// NOT NECESSARY RIGHT NOW
	//obj_player.x = room_data[_room_index, DATA.START_X];
	//obj_player.y = room_data[_room_index, DATA.START_Y];
}
