switch (is_open) {
	case false:
		draw_sprite(spr_door_closed, -1, original_x, original_y);
		break;
	case true:
		draw_sprite(spr_door_open, -1, original_x, original_y);
		break;
}