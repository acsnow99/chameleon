event_inherited();
base_pursue_speed *= 1.35;

x_prev = x;
y_prev = y;


update_sprite = function() {
	if (x > x_prev) {
		image_angle = 270;
	}
	else if (y > y_prev) {
		image_angle = 180;
	}
	else if (x < x_prev) {
		image_angle = 90;
	}
	else if (y < y_prev) {
		image_angle = 0;
	}
	x_prev = x;
	y_prev = y;
}
