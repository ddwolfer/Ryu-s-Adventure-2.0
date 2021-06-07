// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_music_volume(){
	var vol = argument[0];

	MUSIC_VOLUME = vol;
	audio_group_set_gain(music, MUSIC_VOLUME*0.2, 0);
}