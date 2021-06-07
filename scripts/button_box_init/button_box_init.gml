
function button_box_init(textID, x1, y1, x2, y2) {
	var buttonStruct = ds_map_create()

	ds_map_add(buttonStruct,"text",textID)
	ds_map_add(buttonStruct,"x1",x1)
	ds_map_add(buttonStruct,"y1",y1)
	ds_map_add(buttonStruct,"x2",x2)
	ds_map_add(buttonStruct,"y2",y2)
	ds_map_add(buttonStruct,"cursor",0)

	return buttonStruct
}
