/// @description Insert description here
// You can write your code in this editor
if( not instance_exists(oGame) ){return}
if( not instance_exists(oSoundController) ){return}

var SystemFileName = "SystemFile.txt"

if( file_exists( SystemFileName ) ){ // load system file
	show_debug_message(" Already exists ")
	var _buffer = buffer_load(SystemFileName)
	var _string = buffer_read(_buffer, buffer_string)
	
	var _loadSystemFile = json_parse( _string)
	global.locale = variable_struct_exists(_loadSystemFile[0],"Language") ? _loadSystemFile[0].Language : 0 
	MASTER_VOLUME = variable_struct_exists(_loadSystemFile[0],"Master") ?  _loadSystemFile[0].Master : 1.0 
	MUSIC_VOLUME = variable_struct_exists(_loadSystemFile[0],"Music") ? _loadSystemFile[0].Music : 1.0
	SOUND_VOLUME =variable_struct_exists(_loadSystemFile[0],"Effects" ) ? _loadSystemFile[0].Effects : 1.0
	
}


room_goto_next()