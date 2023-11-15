is_open = false;
original_x = x;
original_y = y;

open = function() {
	x = -1000;
	y = -1000;
}

close = function() {
	x = original_x;
	y = original_y;
}

toggle = function() {
	switch (is_open) {
		case false:
			open();
			break;
		case true:
			close();
			break;
	}
	
	is_open = !is_open;
}