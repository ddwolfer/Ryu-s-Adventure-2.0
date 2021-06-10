/// @description Insert description here
// You can write your code in this editor



position_bar_y = view_get_hport(view_camera[0])
position_bar_y_end = position_bar_y - 100

can_display_text = false
is_waiting_for_keypressed = false

start_dialog = false

character_index = 0

dialog_init()

dialog_add(sRyuDialog, "Hey!  it's a test for\n English")
dialog_add(sRyuDialog, "安安! 這是中文測試 喔!")

dialog_reset()

