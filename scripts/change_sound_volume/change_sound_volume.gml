// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_sound_volume(){
	var shift = argument[0];

	SOUND_VOLUME = clamp(SOUND_VOLUME + shift, 0, 1);
	audio_group_set_gain(soundEffect, SOUND_VOLUME*0.2, 0);
}