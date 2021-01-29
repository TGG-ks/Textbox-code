// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_initialize_values(){
	
	//audio
	audio_spd = 1;
	audio[0] = [talk1];
	
	//  sprite name\          / how fast to animate
	emote[0] = [noone	,20];
	
	//script name \                  / how long to do the script for (there will be arguments here too)
	//scr[0] = [scr_makesparkles	,60];
	scr[1] = [noone	,60];
	
	//[page,i,][index]
	//decide whether to do the cool typewriter animation thing
	talkanimate = true;
	
	//fill in the grids
	scr_addinto(0,0,"",c_white,textstates.NONE,font2,	noone,	noone);
	
	numb_of_pages = array_length(textmessage);
	
	
}