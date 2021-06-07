// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_music(){
	var song = argument[0];
	var looping = argument[1];

	if (song != CURRENT_MUSIC) {
		audio_stop_sound(CURRENT_MUSIC);
		audio_play_sound(song, 1000, looping);	
		CURRENT_MUSIC = song;
	}
}