is_open = true;
initial_state = is_open;

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

reset = function() {
	switch (initial_state) {
		case false:
			close();
			break;
		case true:
			open();
			break;
	}
	
	is_open = initial_state;
}