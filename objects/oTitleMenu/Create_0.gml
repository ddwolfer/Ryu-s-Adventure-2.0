//menu font
MenuFontSize = 20
MenuFont = font_add("Chinese.ttf", MenuFontSize, false, false, 32, 128);

#region //set sound volume
defaultVolume = 0.2
audio_group_set_gain(soundEffect, defaultVolume, 0);
audio_group_set_gain(music, defaultVolume, 0);
#endregion

//menu txt
menu[0] = "menu_newGame"
menu[1] = "menu_continue"
menu[2] = "menu_options"
menu[3] = "menu_quit"

var MenuFont_X = view_get_wport(view_surface_id[0]) / 2 
var MenuFont_Y = view_get_hport(view_surface_id[0]) * 3 / 5 
var MenuFontSpaceY = view_get_hport(view_surface_id[0]) / 20
var MenuFontSpaceX = view_get_wport(view_surface_id[0]) / 15

for( var i = 0 ; i < array_length(menu) ; i++){
	show_debug_message("CREATE:"+string(menu[i]))
	MenuButton[i] = button_box_init( 
		menu[i], 
		MenuFont_X - MenuFontSpaceX, 
		MenuFont_Y + i * MenuFontSpaceY - (MenuFontSpaceY/2), 
		MenuFont_X + MenuFontSpaceX, 
		MenuFont_Y + i * MenuFontSpaceY + (MenuFontSpaceY/2)
	)
}
MenuButtonGroup = button_group_init(MenuButton[0], MenuButton[1], MenuButton[2], MenuButton[3], 1)

//options txt
options[0] = "options_music"
options[1] = "options_sfx"
options[2] = "options_language"
options[3] = "options_backtoMenu"

var OptionsFont_X = view_get_wport(view_surface_id[0]) / 2 
var OptionsFont_Y = view_get_hport(view_surface_id[0]) * 3 / 5 
var OptionsFontSpaceY = view_get_hport(view_surface_id[0]) / 20
var OptionsFontSpaceX = view_get_wport(view_surface_id[0]) / 5

for( var i = 0 ; i < array_length(options) ; i++){
	show_debug_message("CREATE:"+string(options[i]))
	OptionsButton[i] = button_box_init( 
		options[i], 
		OptionsFont_X - OptionsFontSpaceX, 
		OptionsFont_Y + i * OptionsFontSpaceY - (OptionsFontSpaceY/2), 
		OptionsFont_X + OptionsFontSpaceX, 
		OptionsFont_Y + i * OptionsFontSpaceY + (OptionsFontSpaceY/2)
		
	)
}
OptionsButtonGroup = button_group_init(OptionsButton[0], OptionsButton[1], OptionsButton[2], OptionsButton[3], 1)

MusicPressed = false
SFXPressed = false

//Language setting
Language_option[0] = "English"
Language_option[1] = "繁體中文"

//variable for controll view
enum menu_screen { //which page now
	main = 0,
	options = 1,
}
screen = menu_screen.main
SystemFileName = "SystemFile.txt"





