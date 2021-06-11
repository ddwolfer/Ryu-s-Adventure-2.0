/// @description Insert description here
// You can write your code in this editor

if( place_meeting(x,y,oRyu) ){
	start_dialog = true
	IN_DIALOG = true
}

if(start_dialog){
	show_debug_message("對話長度:"+string(string_length(dialog_get_text()))+"|delta time:"+string(delta_time))
	position_bar_y = lerp(position_bar_y, position_bar_y_end, 0.2)

	if( abs(position_bar_y - position_bar_y_end) <= 5 ){
		can_display_text = true
	}


	if(can_display_text){
		if(! is_waiting_for_keypressed){
			if(delta_time mod 5 == 0){
				character_index += 1
				audio_play_sound(sdDialogVoice1,2,false)
			}
		
			if(keyboard_check_released(vk_anykey)){
				character_index = string_length(dialog_get_text())
			}
		
			if(character_index >= string_length(dialog_get_text())){
				is_waiting_for_keypressed = true
			}
		} else{
			if(keyboard_check_released(vk_anykey)){
				is_waiting_for_keypressed = false
				character_index = 0
			
				dialog_next()
			
				if(dialog_end()){
					IN_DIALOG = false
					can_display_text = false
					is_waiting_for_keypressed = false

					start_dialog = false

					character_index = 0
					dialog_reset()
					//instance_destroy(id)
				}
			}
		}
	}
}
