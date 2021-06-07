// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
InitTranslations()

function InitTranslations(){
	global.locData = load_csv("RyuText.csv") 
	
	var hh = ds_grid_height(global.locData) //how many row in csv file
	var translations = ds_map_create()

	for( var i=0 ; i<hh ; i++ ){
		ds_map_add(translations, global.locData[# 0, i],i)
	}
	global.translations = translations //all text in csv will store in this variable
}

function Text(key){
	var text = ""
	
	if( global.translations[? key] != undefined ){
		var text = global.locData[# 1 + global.locale, global.translations[? key]] // col 0 is ID, so it start form 1
		var a = argument_count > 1 ? argument[1] : "" //改變參數用
		text = string_replace_all(text, "{a}",a)
	}else{
		var text = key
	}
	
	return text
}