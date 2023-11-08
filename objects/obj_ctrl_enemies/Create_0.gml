


restart_enemies = function() {
	
	for (var i = 0; i < instance_number(obj_enemy_parent); i++) {
		
		var _o = instance_find(obj_enemy_parent, i);
		_o.restart();
		
	}
	
}
