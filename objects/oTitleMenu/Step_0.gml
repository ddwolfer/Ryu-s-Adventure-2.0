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
		
		vol_line_X = 30
		#region //option screen
		switch( OptionsButtonGroup[?"cursor"] ){
			case 1: //master
				#region master controll code
				masterSlideBar[?"enable"] = true
				//controller
				masterSlideBar = slidebar_controller(masterSlideBar)
				//get value from slidebar
				set_master_volume( masterSlideBar[?"value"] )
				//如果還在調整該slidebar 不要移動按鈕位置
				if( masterSlideBar[?"MousePressed"] ){
					OptionsButtonGroup[?"lock"] = true
				}else{
					OptionsButtonGroup[?"lock"] = false
				}
				
				masterSlideBar[?"enable"] = false
				
				#endregion
				break
			case 2: //music
				#region music controll code
				musicSlideBar[?"enable"] = true
				//controller
				musicSlideBar = slidebar_controller(musicSlideBar)
				//get value from slidebar
				set_music_volume( musicSlideBar[?"value"] )
				//如果還在調整該slidebar 不要移動按鈕位置
				if( musicSlideBar[?"MousePressed"] ){
					OptionsButtonGroup[?"lock"] = true
				}else{
					OptionsButtonGroup[?"lock"] = false
				}
				
				musicSlideBar[?"enable"] = false
				#endregion
				break
			case 3: //SFX
				#region SFX controll code
				SFXSlideBar[?"enable"] = true
				//controller
				SFXSlideBar = slidebar_controller(SFXSlideBar)
				//get value from slidebar
				set_sound_volume( SFXSlideBar[?"value"] )
				//如果還在調整該slidebar 不要移動按鈕位置
				if( SFXSlideBar[?"MousePressed"] ){
					OptionsButtonGroup[?"lock"] = true
				}else{
					OptionsButtonGroup[?"lock"] = false
				}
				
				SFXSlideBar[?"enable"] = false
				#endregion
				break
			case 4: //Language
				#region Language controll code
				
				global.locale = LanguageButtonGroup[?"cursor"]
				
				#endregion
				break
				
			default:
				break
		}
		
		if( button_group_click(OptionsButtonGroup) == 5 ){ // Back Button
			audio_play_sound(sdMenuComfirm,2,false)
			//code
			saveSystemData(SystemFileName,global.locale,MASTER_VOLUME,MUSIC_VOLUME,SOUND_VOLUME)
			screen = menu_screen.main
		}
		break
		
		#endregion
	
}

