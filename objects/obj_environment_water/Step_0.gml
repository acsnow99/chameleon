
if (alarmvar_dangerous_to_enemies > 0) {
	alarmvar_dangerous_to_enemies -= global.dt_steady;
}
else if (dangerous_to_enemies) {
	make_safe_to_enemies();
}

