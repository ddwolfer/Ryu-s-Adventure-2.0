// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function slidebar_controller(slidebarID){
	
	getInput()
	
	var PositionX1	=	slidebarID[?"x1"]
	var PositionX2	=	slidebarID[?"x2"]
	var PositionY	=	slidebarID[?"y"]
	var PickerR		=	slidebarID[?"pickerRadius"]
	
	//change value
	//right/left arrow key
	
	if( slidebarID[?"enable"] ){
		//pressed left
		if(leftMenu){
			slidebarID[?"value"] = max( 0.0 , slidebarID[?"value"] - 0.1 )
			audio_play_sound(sdMenu,2,false)
		}else if(rightMenu){
			slidebarID[?"value"] = min( 1.0 , slidebarID[?"value"] + 0.1 )
			audio_play_sound(sdMenu,2,false)
		}
	}
	
	//mouse
	if( slidebarID[?"enable"] ){
		if(! MOUSE_HIDE){
			if( device_mouse_x_to_gui(0) >= PositionX1 && device_mouse_x_to_gui(0)<=PositionX2 ){
				if( device_mouse_y_to_gui(0) >= PositionY-PickerR && device_mouse_y_to_gui(0) <= PositionY+PickerR){
					if( mouse_check_button_pressed(mb_left) ){
						slidebarID[?"MousePressed"] = true
					}
				}
			}
			if(slidebarID[?"MousePressed"]){
				var setValue = (device_mouse_x_to_gui(0) - PositionX1) / (PositionX2 - PositionX1)
				if( setValue>1.0 ){ setValue = 1.0}
				if( setValue<0.0 ){ setValue = 0.0}
				slidebarID[?"value"] = setValue
			}
			if( mouse_check_button_released(mb_left) && slidebarID[?"MousePressed"]){
				slidebarID[?"MousePressed"] = false
				audio_play_sound(sdMenu,2,false)
			}
		}
	}
	
	
	return slidebarID
}