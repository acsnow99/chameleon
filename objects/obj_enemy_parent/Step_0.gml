

switch (movement_state) {
	
	case MOVEMENT_STATES_ENEMY.PATROL:
		movement_patrol();
		break;
	case MOVEMENT_STATES_ENEMY.CHASE:
		movement_chase();
		break;
	
}
