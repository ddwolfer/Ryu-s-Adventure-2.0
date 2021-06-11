// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_master_volume(){
	var vol = argument[0];

	MASTER_VOLUME = vol;
	set_music_volume(MUSIC_VOLUME)
	set_sound_volume(SOUND_VOLUME)
}