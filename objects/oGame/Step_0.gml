/// @description Insert description here
// You can write your code in this editor


#region //checkout mouse and keyboard priority
if( keyboard_check_pressed( vk_anykey ) ){
	MOUSE_HIDE = true
}

if(mouse_x != mxPrevoius){
	mxPrevoius = mouse_x
	MOUSE_HIDE = false
}

if(MOUSE_HIDE){
	window_set_cursor(cr_none)
}else{
	window_set_cursor(cr_default)
}
#endregion