// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function saveSystemData(SaveFileName,Language, Music, Effects){
	
	var _systemSaveData = array_create(0) //initial
	
	var _saveEntity={
		Language : Language,
		Music : Music,
		Effects : Effects
	}
	
	array_push( _systemSaveData, _saveEntity)
	
	var _string = json_stringify(_systemSaveData)
	var _buffer = buffer_create(string_byte_length(_string) +1 , buffer_fixed, 1)
	buffer_write( _buffer, buffer_string, _string)
	buffer_save( _buffer, SaveFileName)
	buffer_delete( _buffer)
	
	show_debug_message("Save succeful" + _string)
}