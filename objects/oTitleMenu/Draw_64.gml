//draw menu GUI
switch(screen){
	case menu_screen.main:
		draw_set_font(MenuFont)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_button_group(MenuButtonGroup,c_gray, c_white, sdMenu)
		break
	case menu_screen.options:
		//左側文字 txt left side
		draw_set_font(MenuFont)
		draw_set_halign(fa_right)
		draw_set_valign(fa_center)
		draw_button_group(OptionsButtonGroup,c_gray,c_white, sdMenu)
		//右側文字 text right side
		#region 位置設定
		draw_set_font(MenuFont)
		draw_set_halign(fa_left)
		draw_set_valign(fa_center)
		
		vol_line_X = 30
		#endregion
		#region master
		if(OptionsButtonGroup[?"cursor"]==1){draw_set_color(c_white)}else{draw_set_color(c_gray)}		
		draw_text(Options_X+vol_line_X+SlideBarLength, Options_Y + OptionsSpace_Y, string( int64(MASTER_VOLUME*100) )) //music vol
		
		draw_slidebar(masterSlideBar)
		#endregion
		#region music
		if(OptionsButtonGroup[?"cursor"]==2){draw_set_color(c_white)}else{draw_set_color(c_gray)}		
		draw_text(Options_X+vol_line_X+SlideBarLength, Options_Y + OptionsSpace_Y*2, string( int64(MUSIC_VOLUME*100) )) //music vol
		
		draw_slidebar(musicSlideBar)
		
		#endregion
		#region SFX
		if(OptionsButtonGroup[?"cursor"]==3){draw_set_color(c_white)}else{draw_set_color(c_gray)}	
		draw_text(Options_X+vol_line_X+SlideBarLength, Options_Y + OptionsSpace_Y*3 , string( int64(SOUND_VOLUME*100) )) //SFX vol
		
		draw_slidebar(SFXSlideBar)
		
		#endregion
		
		#region 語言
		if(OptionsButtonGroup[?"cursor"]==4){
			draw_set_color(c_white)
			LanguageButtonGroup[?"enable"] = true
		}else{LanguageButtonGroup[?"enable"] = false}	
		draw_set_halign(fa_left)
		if( leftMenu or rightMenu ){
			LanguageButtonGroup[?"lock"] = false
		}
		if(mouse_check_button_pressed(mb_left)){
			LanguageButtonGroup[?"lock"] = false
			audio_play_sound(sdMenu,2,false)
		}
		draw_button_group(LanguageButtonGroup,c_gray,c_white, sdMenu)
		LanguageButtonGroup[?"lock"] = true
		#endregion
		break
}