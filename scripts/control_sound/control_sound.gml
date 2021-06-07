// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function control_sound(){
	var val = argument[0];	
	var lower_bound = argument[1];	
	var upper_bound = argument[2];	
	var desired_lower_bound = argument[3];	
	var desired_upper_bound = argument[4];	

	var total = upper_bound - lower_bound;
	var percent = (val - lower_bound) / total;
	var new_val = lerp(desired_lower_bound, desired_upper_bound, percent);
	return new_val;
}