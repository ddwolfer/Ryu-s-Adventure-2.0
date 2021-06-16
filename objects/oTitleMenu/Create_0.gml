SystemFileName = "SystemFile.txt"

#region menu font
MenuFontSize	=	20
MenuFont		=	font_add("Chinese.ttf", MenuFontSize, false, false, 32, 128);
#endregion 

#region variable for controll view
enum menu_screen { //which page now
	main = 0,
	options = 1,
}
screen = menu_screen.main
#endregion

#region //set sound volume
var defaultVolume	=	0.2
audio_group_set_gain(soundEffect, defaultVolume, 0);
audio_group_set_gain(music, defaultVolume, 0);
#endregion

#region menu setting
menu[0]			=	"menu_newGame"
menu[1]			=	"menu_continue"
menu[2]			=	"menu_options"
menu[3]			=	"menu_quit"

var Menu_X		=	view_get_wport(view_surface_id[0]) / 2 
var Menu_Y		=	view_get_hport(view_surface_id[0]) * 3 / 5 
var MenuSpace_Y	=	view_get_hport(view_surface_id[0]) / 20
var MenuSpace_X	=	view_get_wport(view_surface_id[0]) / 15
#endregion

#region //options setting
options[0]		=	"options_resolution"
options[1]		=	"options_master"
options[2]		=	"options_music"
options[3]		=	"options_sfx"
options[4]		=	"options_language"
options[5]		=	"options_backtoMenu"

Options_X		=	view_get_wport(view_surface_id[0]) / 2 
Options_Y		=	view_get_hport(view_surface_id[0]) * 4 / 7 
OptionsSpace_Y	=	view_get_hport(view_surface_id[0]) / 20
OptionsSpace_X	=	view_get_wport(view_surface_id[0]) / 5

SlideBarLength			=	180
masterSlideBar			=	slidebar_init(Options_X,Options_X+SlideBarLength,Options_Y + OptionsSpace_Y,9,4)
masterSlideBar[?"value"]=	MASTER_VOLUME

musicSlideBar			=	slidebar_init(Options_X,Options_X+SlideBarLength,Options_Y + OptionsSpace_Y*2,9,4)
musicSlideBar[?"value"]	=	MUSIC_VOLUME

SFXSlideBar				=	slidebar_init(Options_X,Options_X+SlideBarLength,Options_Y + OptionsSpace_Y*3,9,4)
SFXSlideBar[?"value"]	=	SOUND_VOLUME
#endregion

#region //Language setting
Language_option[0]		=	"English"
Language_option[1]		=	"繁體中文"

Langeage_Space = 120

LanguageButton[0]		=	button_box_init("English",Options_X ,Options_Y + OptionsSpace_Y*4 - (OptionsSpace_Y/2), Options_X + Langeage_Space, Options_Y + OptionsSpace_Y*4 + (OptionsSpace_Y/2),"left")
LanguageButton[1]		=	button_box_init("繁體中文",Options_X + Langeage_Space,Options_Y + OptionsSpace_Y*4 - (OptionsSpace_Y/2), Options_X +Langeage_Space*2, Options_Y + OptionsSpace_Y*4 + (OptionsSpace_Y/2),"left")

LanguageButtonGroup				=	button_group_init(LanguageButton[0], LanguageButton[1], 0)
LanguageButtonGroup[?"enable"]	=	false
LanguageButtonGroup[?"lock"]	=	true
LanguageButtonGroup[?"cursor"]	=	global.locale
#endregion

#region //init the menu button
for( var i = 0 ; i < array_length(menu) ; i++){
	show_debug_message("CREATE:"+string(menu[i]))
	MenuButton[i] = button_box_init( 
		menu[i], 
		Menu_X - MenuSpace_X, 
		Menu_Y + i * MenuSpace_Y - (MenuSpace_Y/2), 
		Menu_X + MenuSpace_X, 
		Menu_Y + i * MenuSpace_Y + (MenuSpace_Y/2)
	)
}
MenuButtonGroup = button_group_init(MenuButton[0], MenuButton[1], MenuButton[2], MenuButton[3], 1)
#endregion

#region //init the options button
for( var i = 0 ; i < array_length(options) ; i++){
	show_debug_message("CREATE:"+string(options[i]))
	var _i = i
	if( i == array_length(options)-1  ){_i+=1}
	OptionsButton[i] = button_box_init( 
		options[i], 
		Options_X - OptionsSpace_X, 
		Options_Y + _i * OptionsSpace_Y - (OptionsSpace_Y/2), 
		Options_X + OptionsSpace_X, 
		Options_Y + _i * OptionsSpace_Y + (OptionsSpace_Y/2)
	)
}
OptionsButtonGroup		=	button_group_init(OptionsButton[0], OptionsButton[1], OptionsButton[2], OptionsButton[3], OptionsButton[4], OptionsButton[5], 1)
#endregion
