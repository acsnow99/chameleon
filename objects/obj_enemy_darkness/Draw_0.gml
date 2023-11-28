if (movement_state == MOVEMENT_STATES_ENEMY.PURSUE) {
	reset_fading();
	image_alpha = 1;
} else {
	opacity += fading_dir;

	if (abs(opacity - 0.5) > 1) {
		fading_dir *= -1;
		opacity += fading_dir;
	}

	image_alpha = clamp(opacity, 0, 1);
}

draw_set_alpha(image_alpha)
draw_sprite(sprite_index, image_index, x, y);
draw_circle_color(x, y, detect_distance + sprite_get_width(spr_player)/2, c_aqua, c_white, true);
draw_set_alpha(1)