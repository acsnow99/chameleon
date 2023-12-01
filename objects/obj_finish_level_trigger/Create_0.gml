
self_next_room = function() {
	if (ability_index != ABILITY.NONE and global.num_abilities_obtained < 2) {
		global.num_abilities_obtained++;
		global.abilities_obtained[ability_index] = true;
	}
	obj_ctrl_change_room.start_next_room(room_index);
	if (!audio_is_playing(snd_fx_finish_room)) {
		audio_play_sound(snd_fx_finish_room, 1, false);
	}
}
