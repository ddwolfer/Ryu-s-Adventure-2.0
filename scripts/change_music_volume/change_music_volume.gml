// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_music_volume(){
	var shift = argument[0];

	MUSIC_VOLUME = clamp(MUSIC_VOLUME + shift, 0, 1);
	audio_group_set_gain(music, MUSIC_VOLUME*0.2, 0);
}