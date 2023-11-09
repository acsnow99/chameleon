

switch (movement_state) {
	
	case MOVEMENT_STATES_ENEMY.PATROL:
		movement_patrol();
		break;
	case MOVEMENT_STATES_ENEMY.PURSUE:
		movement_pursue();
		break;
	case MOVEMENT_STATES_ENEMY.START_PATROL:
		movement_patrol_from_pursue();
		break;
	
}
