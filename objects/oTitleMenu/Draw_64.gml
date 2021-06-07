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
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_button_group(OptionsButtonGroup,c_gray,c_white, sdMenu)
		//右側文字 text right side
		draw_set_font(MenuFont)
		draw_set_halign(fa_left)
		draw_set_valign(fa_center)
		var MenuFont_X = view_get_wport(view_surface_id[0]) / 2 
		var MenuFont_Y = view_get_hport(view_surface_id[0]) * 3 / 5 
		var MenuFontSpaceY = view_get_hport(view_surface_id[0]) / 20
		
		vol_line_length = 180
		vol_line_X = 60
		
		if(OptionsButtonGroup[?"cursor"]==0){draw_set_color(c_white)}else{draw_set_color(c_gray)}		
		draw_text(MenuFont_X, MenuFont_Y , string( int64(MUSIC_VOLUME*100) )) //music vol
		draw_line_width(MenuFont_X + vol_line_X,MenuFont_Y,MenuFont_X + vol_line_X + vol_line_length,MenuFont_Y,4)
		draw_sprite(sVolPicker,0, MenuFont_X + vol_line_X + vol_line_length*MUSIC_VOLUME ,MenuFont_Y)
		
		if(OptionsButtonGroup[?"cursor"]==1){draw_set_color(c_white)}else{draw_set_color(c_gray)}	
		draw_text(MenuFont_X, MenuFont_Y + MenuFontSpaceY , string( int64(SOUND_VOLUME*100) )) //SFX vol
		draw_line_width(MenuFont_X + vol_line_X,MenuFont_Y + MenuFontSpaceY, MenuFont_X + vol_line_X + vol_line_length,MenuFont_Y + MenuFontSpaceY,4)
		draw_sprite(sVolPicker,0, MenuFont_X + vol_line_X + vol_line_length*SOUND_VOLUME ,MenuFont_Y + MenuFontSpaceY)
		
		if(OptionsButtonGroup[?"cursor"]==2){draw_set_color(c_white)}else{draw_set_color(c_gray)}	
		for(var i = 0; i < array_length(Language_option) ; i++){
			if(global.locale==i && OptionsButtonGroup[?"cursor"]==2){draw_set_color(c_white)}else{draw_set_color(c_gray)}	
			draw_text(MenuFont_X + i*100,MenuFont_Y + MenuFontSpaceY*2,Language_option[i])
		}
		
		break
}