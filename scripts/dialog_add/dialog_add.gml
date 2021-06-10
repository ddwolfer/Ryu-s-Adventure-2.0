// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dialog_add(){
	var picture = argument0;
	var message = argument1;

	if(global.dialog_index == -1) {
		global.dialog_index = 0;
	} else {
		global.dialog_index += 1;
	}

	global.dialog_messages[global.dialog_index, DIALOG.PICTURE] = picture;
	global.dialog_messages[global.dialog_index, DIALOG.MESSAGE] = message;
}