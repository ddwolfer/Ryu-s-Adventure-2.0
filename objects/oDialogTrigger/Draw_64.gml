/// @description Insert description here
// You can write your code in this editor

if( start_dialog ){
	draw_set_font(DialogFont)
	//background
	draw_set(c_black, 0.75)
	draw_rectangle(borderX1,borderY1,borderX2,borderY2,false)
	draw_reset()
	
	//picture and name
	if(showPic){
		//background
		draw_set(c_gray, 0.5)
		draw_rectangle(picX1,picY1,picX2,picY2,false)
		draw_reset()
		//picture
		draw_sprite_ext(pictures[message_index], 0, picX, picY, 1, 1, 0, -1, 1)
	
		//name
		draw_set_allign(fa_center, fa_center)
		draw_text_transformed(nameX,nameY,names[message_index],0.8,0.8,0)
	}
	
	//background
	draw_set(c_gray, 0.5)
	draw_rectangle(textboxX1,textboxY1,textboxX2,textboxY2,false)
	draw_reset()
	
	//text
	draw_set_allign(fa_left ,fa_center)
	
	var _text = string_copy(messages[message_index], textSeg[textLine], character_index - textSeg[textLine] + 1)
	
	_textline[textLine] = _text
	
	var _line = 0
	for( var _i = max(0, textLine-textLineCount+1) ; _i <= textLine ; _i++ ){
		draw_text(textboxX1, textboxY1 + textYSpace * (1+(_line*2))/2, _textline[_i])
		_line ++
	}
	
	if( string_width( string_copy(messages[message_index], textSeg[textLine], character_index- textSeg[textLine] + 2) ) >= textboxWidth ){
		if( global.locale = LOCALE.CN ){ //符號型文字 如 日文、中文、韓文 (好像也就這三種)
			textLine			+=	1
			textSeg[textLine]	=	character_index + 1
		}
		if( global.locale = LOCALE.EN ){ //字母型文字 如 英文、法文...
			//find space
			space_position = string_length(_textline[textLine])
			while( !(string_char_at(_textline[textLine], space_position) == " ") ){
				space_position		+=	-1
			}
			//cut form space
			_textline[textLine]		=	string_copy(_textline[textLine], 1, space_position)
			textLine				+=	1
			textSeg[textLine]		=	space_position + textSeg[textLine-1]
			
		}
	}
	
	// next dialog
	if(wait_keypressed){
		draw_set_allign(fa_right, fa_bottom)
		draw_text_transformed(borderX2*0.99, borderY2,Text("dialog_next"),0.75,0.75,0)
	}
	
}