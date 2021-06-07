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
	global.locale = _loadSystemFile[0].Language
	MUSIC_VOLUME = _loadSystemFile[0].Music
	SOUND_VOLUME = _loadSystemFile[0].Effects 
	
}else{ //create a system file
	saveSystemData(SystemFileName,0,1.0,1.0)
	
	//default setting
	global.locale = 0
	MUSIC_VOLUME = 1.0
	SOUND_VOLUME = 1.0
}


room_goto_next()