

global.num_abilities_obtained = 0;

global.abilities_obtained[ABILITY.NONE] = true;
global.abilities_obtained[ABILITY.FIRE] = false;
global.abilities_obtained[ABILITY.ELECTRICITY] = false;
global.abilities_obtained[ABILITY.WATER] = false;
global.abilities_obtained[ABILITY.DARKNESS] = false;
global.abilities_obtained[ABILITY.TELEPORTATION] = false;

global.debug = false;

if (global.debug) {
	for (var i = 0; i < ABILITY.LENGTH; i++) {
		global.abilities_obtained[i] = true;
	}
}
