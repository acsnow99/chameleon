switch (is_open) {
	case false:
		image_speed = 0;
		image_index = 0;
		draw_sprite_ext(spr_door_closed, 0, original_x, original_y, image_xscale, image_yscale, image_angle, c_white, 1);
		break;
	case true:
		image_speed = 0.3;
		sprite_index = spr_door_open;
		draw_sprite_ext(spr_door_open, image_index, original_x, original_y, image_xscale, image_yscale, image_angle, c_white, 1);
		break;
}