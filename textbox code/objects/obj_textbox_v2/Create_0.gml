enum textstates
{
	NONE,
	WRAPPED,
	QUESTION,
	ANSWER,
	SHAKY,
	WAVY,
}

enum data
{
	STRNG,
	COL,
	EFF,
	FONT,
	SEL_COL,
	SEL_SCR,
	TOT_ARG_NUMB,
	ARG1,
	ARG2,
	ARG3,
}


input_key = vk_space;
key_left = vk_left;
key_right = vk_right;
page = 0;
time = 0;
emotetime = 0;
scripttime = 0;
talktime = 0;
pause = false;
//set to false to get all text to appear instantly
talkanimate = true;
lastpage = page;
answerindex = 0;
numb_of_answers = 0;

//audio stuffs
audio_spd = 1; 

stop_audio = false;

drawbeginningx = 10;
drawbeginningy = 10;

draw_set_valign(fa_left);
draw_set_halign(fa_left);

//default fill
for(var i = 0; i < 99; i ++)
{
	emote[i]		= [noone,0];
	scr[i]			= [noone,0];
	talkspeed[i]	= 1;
}










