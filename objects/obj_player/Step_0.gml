change_sprite();
check_caught();

check_for_burning();

switch (movement_state) {
	
	case MOVEMENT_STATES.FREE_MOVEMENT:
		movement_free();
		break;
	case MOVEMENT_STATES.USE_ABILITY:
		use_ability();
		break;
	
}