/// @description Insert description here
// You can write your code in this editor

#region variable
//setting
messages		=	array_create()
pictures		=	array_create()
names			=	array_create()
messages_count	=	0
textspeed		=	room_speed*0.1  //The larger the value, the slower text speed
textspeedUp		=	false
message_index	=	0
character_index =	0
pictureSize		=	128
start_dialog	=	true
wait_keypressed	=	false
DialogFontSize	=	20
DialogFont		=	font_add("Chinese.ttf", DialogFontSize, false, false, 32, 128);
loop			=	true

//border position
borderX1		=	view_get_wport(view_camera[0]) * 0.2
borderX2		=	view_get_wport(view_camera[0]) * 0.8
borderY1		=	view_get_hport(view_camera[0]) * 0.70
borderY2		=	view_get_hport(view_camera[0]) * 0.98
borderwidth		=	borderX2 - borderX1
borderheight	=	borderY2 - borderY1

//picture position
picX1			=	borderwidth * 0.05 + borderX1
picX2			=	picX1 + pictureSize
picX			=	( picX1 + picX2 ) / 2
picY1			=	(borderheight - pictureSize)/2 + borderY1
picY2			=	picY1 + pictureSize
picY			=	( picY1 + picY2 ) / 2
showPic			=	true

//name position
nameX			=	( picX1 + picX2 )	  / 2
nameY			=	( picY2 + borderY2 )  / 2

//textbox position
if(showPic)
	textboxX1	=	borderwidth * 0.04	+	picX2
else
	textboxX1	=	borderwidth * 0.05	+	borderX1
textboxX2		=	borderwidth * 0.95	+	borderX1
textboxY1		=	borderheight * 0.15	+	borderY1
textboxY2		=	borderheight * 0.85	+	borderY1
textboxWidth	=	textboxX2 - textboxX1
textboxHeight	=	textboxY2 - textboxY1
textLine		=	0
_textline		=	array_create()
textSeg			=	array_create()
textSeg[0]		=	1
textLineCount	=	3
textYSpace		=	textboxHeight / textLineCount

#endregion

#region function

function dialog_add(_picture, _name, _message){
	messages[messages_count]	=	_message
	pictures[messages_count]	=	_picture
	names[messages_count]		=	_name
	messages_count				+=	1
}

function dialog_next(){
	message_index		+=	1
	wait_keypressed		=	false
	character_index		=	0
	textLine			=	0
}

function dialog_end(){
	if( message_index >= messages_count ){
		return true
	}else{
		return false
	}
}

function dialog_reset(){
	message_index	=	false
	start_dialog	=	true
	wait_keypressed	=	false
}

#endregion

dialog_add(sRyuDialog, "Ryu", Text("dialog_test"))
dialog_add(sRyuDialog, "Ryu", Text("dialog_test"))
dialog_add(sRyuDialog, "Ryu", "aAaAa")
