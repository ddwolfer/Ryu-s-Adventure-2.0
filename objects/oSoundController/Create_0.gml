/// @description Initialize Sound Controller


//stop all prior audio (should be none)
audio_stop_all()


//create global variables
globalvar MUSIC_VOLUME, SOUND_VOLUME, MUSIC_LOADED, SOUND_LOADED, CURRENT_MUSIC;

MUSIC_VOLUME = 1;
SOUND_VOLUME = 1;
MUSIC_LOADED = false;
SOUND_LOADED = false;
CURRENT_MUSIC = -1;

audio_group_load(music);
audio_group_load(soundEffect);


//check to see if loaded
//nessary for game restart, as game restart doesn't need to reload
if (audio_group_is_loaded(music)) {
	MUSIC_LOADED = true;
}

if (audio_group_is_loaded(soundEffect)) {
	SOUND_LOADED = true;
}
