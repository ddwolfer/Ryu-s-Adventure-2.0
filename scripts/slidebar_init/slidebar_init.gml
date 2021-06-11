// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function slidebar_init(position_bar_x, position_bar_x_end, position_bar_y,picker_radius,line_width){
	var slidebarStruct = ds_map_create()
	
	ds_map_add(slidebarStruct,"x1",position_bar_x)
	ds_map_add(slidebarStruct,"x2",position_bar_x_end)
	ds_map_add(slidebarStruct,"y",position_bar_y)
	ds_map_add(slidebarStruct,"enable",false)
	ds_map_add(slidebarStruct,"pickerRadius",picker_radius)
	ds_map_add(slidebarStruct,"lineWidth",line_width)
	ds_map_add(slidebarStruct,"value",0.0)
	ds_map_add(slidebarStruct,"MousePressed",false)
	
	return slidebarStruct
}