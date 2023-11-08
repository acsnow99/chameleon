// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// @function mve_simple(_spd, _dir)
// @param {real} _spd
// @param {real} _dir


function move(_spd, _dir){

	#region from online(supposed to fix graphical jitter effect)
	//result: does the same thing as rounding draw event vars
	/*
	hr += length_dir_x(_spd, _dir);
	vr += length_dir_y(_spd, _dir);

	var h = floor(hr), v = floor(vr);

	hr -= h;
	vr -= v;
	*/
	#endregion

	var xtarg = round(x + lengthdir_x(_spd, _dir));
	var ytarg = round(y + lengthdir_y(_spd, _dir));
	var setx = false;
	var sety = false;
	var l = layer_get_id("Tiles_collision");
	var map = layer_tilemap_get_id(l);
	
	
	#region check which side of the bounding box to use for collisions
	//bbox_x and bbox_y are the distance from the origin to the specified edge of the bbox
	var bbox_x = (bbox_right - bbox_left)/2;
	var bbox_y = (bbox_bottom - bbox_top)/2;

	//moving right
	if (xtarg > x) {
		bbox_x = bbox_right - x + 1;
	}
	//moving left
	else if (xtarg < x) {
		bbox_x = bbox_left - x;
	}

	//moving up
	if (ytarg < y) {
		bbox_y = bbox_top - y;
	}
	//moving down
	else if (ytarg > y) {
		bbox_y = bbox_bottom - y + 1;
	}

	#endregion
	
	if (!(tilemap_get_at_pixel(map, xtarg + bbox_x, bbox_top) > 0) && !(tilemap_get_at_pixel(map, xtarg + bbox_x, bbox_bottom) > 0) && !(place_meeting(xtarg, y, obj_obstacle_parent))) {
		
		x = xtarg;
		setx = true;
	
	}
	else {
		var inc = sign(xtarg - x);
		while (!(tilemap_get_at_pixel(map, x + inc + bbox_x, bbox_top) > 0) && !(tilemap_get_at_pixel(map, x + inc + bbox_x, bbox_bottom) > 0) && !(place_meeting(x + inc, y, obj_obstacle_parent))) {
			x += inc;
		}
	}
	
	if (!(tilemap_get_at_pixel(map, bbox_right, ytarg + bbox_y) > 0) && !(tilemap_get_at_pixel(map, bbox_left, ytarg + bbox_y) > 0) && !(place_meeting(x, ytarg, obj_obstacle_parent))) {
		
		y = ytarg;
		sety = true;
		
	}
	else {
		var inc = sign(ytarg - y);
		while (!(tilemap_get_at_pixel(map, bbox_right, y + inc + bbox_y) > 0) && !(tilemap_get_at_pixel(map, bbox_left, y + inc + bbox_y) > 0) && (!place_meeting(x, y + inc, obj_obstacle_parent))) {
			y += inc;
		}
	}


	if (!setx || !sety) {
		return false;
	}
	return true;

}