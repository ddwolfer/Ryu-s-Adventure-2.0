/// @description Insert description here
// You can write your code in this editor
draw_set(c_black, 0.3)

draw_rectangle(0, view_get_hport(view_camera[0]),view_get_wport(view_camera[0]), position_bar_y, false)

draw_reset()

if(can_display_text){
	draw_set_allign(fa_center, fa_middle)
	
	draw_sprite(dialog_get_picture(),0,64,view_get_hport(view_camera[0])-50)
	
	var message = dialog_get_text()
	
	var text = string_copy(message, 0, character_index)
	
	draw_text(view_get_wport(view_camera[0])/2,view_get_hport(view_camera[0])-50,text)
	
	if( is_waiting_for_keypressed ){
		draw_set_allign(fa_left, fa_middle)
		text = "* press any key"
		var text_length = string_width(text)
		draw_text_transformed(view_get_wport(view_camera[0]) - text_length, view_get_hport(view_camera[0]) -20 , text,0.75,0.75,0)
	}
}