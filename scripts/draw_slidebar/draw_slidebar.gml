// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_slidebar(slidebarID){
	
	//draw 
	if( slidebarID[?"enable"] ){
		draw_set_color(c_white)
	}else{
		draw_set_color(c_gray)
	}
	
	var PositionX1	=	slidebarID[?"x1"]
	var PositionX2	=	slidebarID[?"x2"]
	var PositionY	=	slidebarID[?"y"]
	var width		=	slidebarID[?"lineWidth"]
	var value		=	slidebarID[?"value"]
	var PickerR		=	slidebarID[?"pickerRadius"]
	
	draw_line_width(PositionX1,PositionY,PositionX2,PositionY,width)
	draw_set_color(c_gray)
	draw_circle((PositionX2-PositionX1)*value + PositionX1,PositionY,PickerR*1.1,false)
	
	if(slidebarID[?"enable"]){ 
		draw_set_color(c_white)
	}else{
		draw_set_color($AAAAAA)
	}	
	draw_circle((PositionX2-PositionX1)*value + PositionX1,PositionY,PickerR,false) 
	
	draw_reset()
	//draw end	
}