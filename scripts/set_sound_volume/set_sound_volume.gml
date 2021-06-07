// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_sound_volume(){
	var vol = argument[0];

	SOUND_VOLUME = vol;
	audio_group_set_gain(soundEffect, SOUND_VOLUME*0.2, 0);
}