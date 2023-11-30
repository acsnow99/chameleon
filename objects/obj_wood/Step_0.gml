/// @description Play fire sound
// You can write your code in this editor
if (state == STATE.BURNING and !audio_is_playing(snd_fx_fire_environment)) {
	audio_play_sound(snd_fx_fire_environment, 0.5, false);
}

