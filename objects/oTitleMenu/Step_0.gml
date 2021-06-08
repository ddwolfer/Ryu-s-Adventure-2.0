getInput()
switch(screen){
	case menu_screen.main:
	#region //main screen
		if( button_group_click(MenuButtonGroup) == 0 ){ //Start Button
			audio_play_sound(sdMenuComfirm,2,false)
			show_debug_message("new GAME")
			//code
			room_goto_next()
		}else if( button_group_click(MenuButtonGroup) == 1 ){ // Continue Button
			audio_play_sound(sdMenuComfirm,2,false)
			show_debug_message("Continue")
			//code
		}else if( button_group_click(MenuButtonGroup) == 2 ){ // Quit Button
			audio_play_sound(sdMenuComfirm,2,false)
			show_debug_message("options")
			//code
			screen = menu_screen.options
		}else if( button_group_click(MenuButtonGroup) == 3 ){ // Quit Button
			audio_play_sound(sdMenuComfirm,2,false)
			//code
			game_end()
		}
		break
	#endregion
	
	case menu_screen.options:
		var MenuFont_X = view_get_wport(view_surface_id[0]) / 2 
		var MenuFont_Y = view_get_hport(view_surface_id[0]) * 3 / 5 
		var MenuFontSpaceY = view_get_hport(view_surface_id[0]) / 20
		
		vol_line_length = 180
		vol_line_X = 30
		#region //option screen
		switch( OptionsButtonGroup[?"cursor"] ){
			case 0: //music
				#region music controll code
				if(leftMenu){ //decrease
					audio_play_sound(sdMenu, 2, false)
					change_music_volume(-0.1)
				}else if(rightMenu){ //increase
					audio_play_sound(sdMenu, 2, false)
					change_music_volume(+0.1)
				}
				//滑鼠調整
				#region
				if(mouse_check_button_pressed(mb_left)){
					if((mouse_x >= MenuFont_X && mouse_x <= MenuFont_X+vol_line_length)&&
						(mouse_y>=MenuFont_Y-sprite_get_height(sVolPicker) && mouse_y<=MenuFont_Y+sprite_get_height(sVolPicker))){
						MusicPressed = true
					}
				}
				
				if (MusicPressed){
					var setVol = (mouse_x - MenuFont_X )/vol_line_length
					if(setVol > 1.0){setVol = 1.0}
					if(setVol < 0){setVol = 0.0}
					set_music_volume( setVol )
				}
				if (mouse_check_button_released(mb_left) && MusicPressed){
					MusicPressed = false
				}
				#endregion
				
				#endregion
				break
			case 1: //SFX
				#region SFX controll code
				if(leftMenu){ //decrease
					audio_play_sound(sdMenu, 2, false)
					change_sound_volume(-0.1)
				}else if(rightMenu){ //increase
					audio_play_sound(sdMenu, 2, false)
					change_sound_volume(0.1)
				}
				//滑鼠調整
				#region
				if(mouse_check_button_pressed(mb_left)){
					if((mouse_x >= MenuFont_X && mouse_x <= MenuFont_X+vol_line_length)&&
						(mouse_y>=MenuFont_Y+MenuFontSpaceY-sprite_get_height(sVolPicker) && mouse_y<=MenuFont_Y+MenuFontSpaceY+sprite_get_height(sVolPicker))){
						SFXPressed = true
					}
				}
				
				if (SFXPressed){
					var setVol = (mouse_x - MenuFont_X )/vol_line_length
					if(setVol > 1.0){setVol = 1.0}
					if(setVol < 0){setVol = 0.0}
					set_sound_volume( setVol )
					
				}
				if (mouse_check_button_released(mb_left) && SFXPressed){
					SFXPressed = false
				}
				if (mouse_check_button_released(mb_left) && SFXPressed){
					SFXPressed = false
				}
				#endregion
				#endregion
				break
			case 2: //Language
				#region Language controll code
				if(leftMenu){ //decrease
					audio_play_sound(sdMenu, 2, false)
					global.locale = max(0,global.locale - 1)
				}else if(rightMenu){ //increase
					audio_play_sound(sdMenu, 2, false)
					global.locale = min(array_length(Language_option),global.locale + 1)
				}
				//滑鼠選擇
				
				for(var i = 0; i < array_length(Language_option) ; i++){
					if(mouse_check_button_pressed(mb_left)){
						if(( mouse_x >= MenuFont_X + i*100 && mouse_x < MenuFont_X + (i+1)*145 )&&
							(mouse_y >= MenuFont_Y + MenuFontSpaceY*2 - MenuFontSpaceY/2 && MenuFont_Y + MenuFontSpaceY*2 + MenuFontSpaceY/2)){
							global.locale = i	
							audio_play_sound(sdMenuComfirm,2,false)
						}
					}
					
				}
				
				#endregion
				
				break
				
			default:
				break
		}
		
		if( button_group_click(OptionsButtonGroup) == 3 ){ // Back Button
			audio_play_sound(sdMenuComfirm,2,false)
			//code
			saveSystemData(SystemFileName,global.locale,MUSIC_VOLUME,SOUND_VOLUME)
			screen = menu_screen.main
		}
		break
		
		#endregion
	
}

