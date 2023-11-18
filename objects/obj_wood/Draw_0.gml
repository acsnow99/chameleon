switch (state) {
	case STATE.INTACT:
		draw_sprite(spr_wood, -1, original_x, original_y);
		break;
	case STATE.BURNING:
		draw_sprite(spr_wood_burning, -1, original_x, original_y);
		break;
}