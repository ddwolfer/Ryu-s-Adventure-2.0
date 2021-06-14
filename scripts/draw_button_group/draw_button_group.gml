///@arg GroupID
///@arg button_Color 
///@arg mouse_on_button_Color
function draw_button_group(argument0, argument1, argument2, MoveSound) {

	var group = argument0
	ButtonGroup = group[?"button"]
	var MX = device_mouse_x_to_gui(0) 
	var MY = device_mouse_y_to_gui(0) 

	//keyboard
	if(!group[?"lock"] && group[?"enable"]){
		if( group[?"direction"] == 0 ){
			if(keyboard_check_pressed(vk_left)){
				audio_play_sound(MoveSound, 2, false)
				if(group[?"cursor"]>0){
					group[?"cursor"]-=1
				} 
			}
			if(keyboard_check_pressed(vk_right)){
				audio_play_sound(MoveSound, 2, false)
				if(group[?"cursor"] < array_length_1d(ButtonGroup) -1  ){
					group[?"cursor"]+=1
				} 
			}
		}else if(group[?"direction"] == 1){
			if(keyboard_check_pressed(vk_up)){
				audio_play_sound(MoveSound, 2, false)
				if(group[?"cursor"]>0){
					group[?"cursor"]-=1
				} 
			}
			if(keyboard_check_pressed(vk_down)){
				audio_play_sound(MoveSound, 2, false)
				if(group[?"cursor"] < array_length_1d(ButtonGroup) -1  ){
					group[?"cursor"]+=1
				} 
			}

		}

		//mouse
		if(!MOUSE_HIDE){
			for( var i = 0 ; i < array_length_1d(ButtonGroup) ; i++ ){
				var Button = ButtonGroup[i]
				//mouse
				if( MX >= Button[?"x1"] && MX <=Button[?"x2"] && MY >= Button[?"y1"] && MY <= Button[?"y2"]){
					//if(i!= group[?"cursor"]){audio_play_sound(sdMenu,2,false)}
					group[?"cursor"] = i
				}
				ButtonGroup[i] = Button
			}
		}
	
		for( var i = 0 ; i < array_length(ButtonGroup) ; i++ ){
			var Button = ButtonGroup[i]

			if(i != group[?"cursor"]) Button[?"cursor"] = 0
			else Button[?"cursor"] = 1

			ButtonGroup[i] = Button
		}
	}
	
	//draw
	for( var i = 0 ; i < array_length(ButtonGroup) ; i++ ){
		var Button = ButtonGroup[i]
	
		DrawX1 = Button[?"x1"]
		DrawX2 = Button[?"x2"]
		DrawY1 = Button[?"y1"]
		DrawY2 = Button[?"y2"]
		centerX = (DrawX1 + DrawX2)/2
		centerY = (DrawY1 + DrawY2)/2
	
		if( group[?"cursor"] == i && group[?"enable"] ){
			draw_set_color(argument2)
			//draw_rectangle(DrawX1, DrawY1, DrawX2, DrawY2, 0)
		}else{
			draw_set_color(argument1)
			//draw_rectangle(DrawX1, DrawY1, DrawX2, DrawY2, 0)
		}
		//draw_set_color(c_black)
		if( Button[?"position"]=="center" ){
			if(Button[?"text"] =="options_backtoMenu"){draw_set_halign(fa_center)} //呃  例外
			draw_text_transformed( centerX , centerY, Text(Button[?"text"]), 1,1,0)
		}else if( Button[?"position"]=="right"){
			draw_text_transformed( DrawX2 , centerY, Text(Button[?"text"]), 1,1,0)
		}else if( Button[?"position"]=="left" ){
			draw_text_transformed( DrawX1 , centerY, Text(Button[?"text"]), 1,1,0)
		}
		
		
	}
}
