/// @description Insert description here
// You can write your code in this editor

if( start_dialog ){
	
	if(! wait_keypressed){
		if(textspeedUp){
			if(delta_time mod 1 == 0){
				character_index += 1
				audio_play_sound(sdDialogVoice1,2,false)
			}
		}else{
			if(delta_time mod textspeed == 0){
				character_index += 1
				audio_play_sound(sdDialogVoice1,2,false)
			}
		}
		
		
		if(keyboard_check_pressed(vk_anykey)){
			textspeedUp = true
		}
		
		if( character_index >= string_length( messages[message_index] )){
			wait_keypressed = true
		}
	}else{
		if(keyboard_check_released(vk_anykey)){
			dialog_next()
			textspeedUp = false
			if( dialog_end() ){
				if(loop){
					dialog_reset()
				}else{
					instance_destroy(id)
				}
			}
		}
	}
}