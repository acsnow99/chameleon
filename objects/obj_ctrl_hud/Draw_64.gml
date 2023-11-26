
#macro COOLDOWN_SPRITE_FRAME_COUNT 7

var _i = global.num_abilities_obtained;

draw_sprite(spr_hud_colors, _i, 0, 0);


// CALCULATE AND DRAW COOLDOWNS
#region display when ability will end (just fire does this right now)
if (global.current_ability != ABILITY.NONE) {
	switch(_i) {
		case 2:
			if (global.current_ability == ABILITY.FIRE) {
				// (numbers of frames per cooldown thing times which ability we're displaying minus 1) plus all the frames for each previous section of frames plus how far along we're through the animation
				var _frames_offset = COOLDOWN_SPRITE_FRAME_COUNT * (_i - 1);
				var _ability_time_left = _frames_offset + COOLDOWN_SPRITE_FRAME_COUNT * (ABILITY.FIRE - 1) + round((COOLDOWN_SPRITE_FRAME_COUNT - 1) * (1 - (obj_ctrl_inputs.alarmvar_end_ability/obj_ctrl_inputs.alarmvar_end_ability_defaults[ABILITY.FIRE])));
				draw_sprite_ext(spr_hud_cooldowns, _ability_time_left, 0, 0, 1, 1, 0, c_white, 0.4);
			}
			break;
	}
}
#endregion

#region display ability cooldowns (when the ability can be used again)
if (_i > 0) {
	for (var i = 1; i <= _i; i++) {
		if (global.current_ability != i && obj_ctrl_inputs.alarmvar_cooldown_ability[i] > 0) {
			var _frames_offset = COOLDOWN_SPRITE_FRAME_COUNT * (_i - 1);
			var _ability_cooldown_left = _frames_offset + COOLDOWN_SPRITE_FRAME_COUNT * (i - 1) + round((COOLDOWN_SPRITE_FRAME_COUNT - 2) * (obj_ctrl_inputs.alarmvar_cooldown_ability[i]/obj_ctrl_inputs.alarmvar_cooldown_ability_defaults[i]));
			draw_sprite_ext(spr_hud_cooldowns, _ability_cooldown_left, 0, 0, 1, 1, 0, c_white, 0.4);
		}
	}
}
#endregion
