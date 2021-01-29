// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_sample_convo(){
	
	//audio
	audio_spd = 1;
	audio[0] = [talk1];
	audio[2] = [talk1];
	
	audio[16] = [Sound2,Sound3,talk1];
	
	//  sprite name\          / how fast to animate
	emote[0] = [spr_emote1	,20];
	emote[5] = [spr_emote2	,20];
	emote[6] = [spr_emote2	,20];
	emote[3] = [spr_emote1	,20];
	emote[8] = [spr_emote1	,20];
	emote[12] =[spr_emote2	,20];
	emote[16] =[spr_emote2	,20];
	emote[14] =[spr_emote2	,20];
	
	//script name \                  / how long to do the script for (there will be arguments here too)
	//scr[0] = [scr_makesparkles	,60];
	scr[1] = [scr_makesparkles	,60];
	scr[3] = [scr_makesparkles	,60];
	scr[6] = [scr_makesparkles	,60];
	
	//[page,i,][index]
	//decide whether to do the cool typewriter animation thing
	talkanimate = true;
	
	//fill in the grids
	scr_addinto(0,0,"Hello! Want to pay a ",c_white,textstates.NONE,font2,	noone,	noone);
	scr_addinto(0,1,"random ",c_white,textstates.SHAKY,font2,	noone,	noone);
	scr_addinto(0,2,"fine?",c_white,textstates.NONE,font2,	noone,	noone);
	
	scr_addinto(1,0,"Pay Fine? ",	c_orange,	textstates.QUESTION,				font2,	noone,	noone);
	scr_addinto(1,1,"Yes ",			c_red,		textstates.ANSWER,				font2,	c_white,scr_go_to_page,1,3);
	scr_addinto(1,2,"No ",			c_red,		textstates.ANSWER,				font1,	c_blue,scr_go_to_page,1,5);
	scr_addinto(1,3,"Pay exactly half of the fine ",c_orange,textstates.ANSWER,	font3,	c_white,scr_go_to_page,1,8);
	scr_addinto(1,4,"eat Some money",c_orange,textstates.ANSWER,				font1,	c_white,scr_go_to_page,1,10);
	
	scr_addinto(2,0,noone,	c_blue,textstates.NONE,font1,	noone,	noone);
	
	scr_addinto(3,0,"Thanks sucker! I just made you give me all of this money, and you did it! I can't believe the enourmous amount of luck I am having ha ha ha ha ha ha ha ha",			c_aqua,		textstates.WRAPPED,	font3,noone,noone,noone,230);
	
	scr_addinto(4,0,noone,	c_white,textstates.NONE,font1,	noone,	noone);
	
	scr_addinto(5,0,"How rude! ",			c_white,			textstates.NONE,	font1);
	scr_addinto(6,0,"In that case, ",			c_white,		textstates.NONE,	font2);
	scr_addinto(6,1,"Prepare To DIE!!! ",			c_red,		textstates.SHAKY,	font3);
	
	scr_addinto(7,0,noone,	c_white,textstates.NONE,font1,	noone,	noone);
	
	scr_addinto(8,0,"This... ",					c_white,	textstates.NONE,	font1);
	scr_addinto(8,1,"This isn't actually... ",	c_white,	textstates.NONE,	font2);
	scr_addinto(8,2,"Enough money... ",			c_red,		textstates.NONE,	font3);
	
	scr_addinto(9,0,noone,	c_white,textstates.NONE,font1,	noone,	noone);
	
	scr_addinto(10,0,"You gobbled up some tasty greens!",	c_lime,textstates.WAVY,	font1);
	scr_addinto(11,0,"it was just okay...",					c_white,textstates.NONE,	font2);
	scr_addinto(12,0,"That can't possibly be healthy... can it?",c_white,textstates.QUESTION,	font1);
	scr_addinto(12,1,"It's prolly' fine",			c_white,textstates.ANSWER,		font1,c_blue,scr_go_to_page,1,14);
	scr_addinto(12,2,"I can feel my organs failing",c_white,textstates.ANSWER,		font1,c_blue,scr_go_to_page,1,16);
	
	scr_addinto(13,0,noone,	c_white,textstates.NONE,font1,	noone,	noone);
	
	scr_addinto(14,0,"I wouldn't trust your opinion but whatever",	c_white,textstates.NONE,font1,	noone,	noone);
	
	scr_addinto(15,0,noone,	c_white,textstates.NONE,font1,	noone,	noone);
	
	scr_addinto(16,0,"Guess you'll ",	c_white,textstates.NONE,font1,	noone,	noone);
	scr_addinto(16,1,"Die ",			c_aqua,textstates.WAVY,font2,	noone,	noone);
	scr_addinto(16,2,"then.",			c_orange,textstates.NONE,font1,	noone,	noone);
	
	
	numb_of_pages = array_length(textmessage);
	
	
}