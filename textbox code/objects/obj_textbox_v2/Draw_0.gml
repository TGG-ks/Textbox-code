var str, col, effect,  font, animate_speed, emoteid, emoteshift, curr_char,currstr,randx,randy,truelength, laststrlength,laststrwidth,emotebeginx;
var Lstr, Lfont, seccol, ansscr,total_numb_of_args,scrarg1,scrarg2,scrarg3;

var beginx, beginy
beginx = drawbeginningx;
beginy = drawbeginningy;
emotebeginx = beginx;
curr_char = "";

//find the amount to shift the text over to make room for the emote
if(sprite_exists(emote[page,0]))
{
	emoteshift = sprite_get_width(emote[page,0]);
	beginx += emoteshift+5;
}
else
{
	emoteshift = 0;
}

laststrlength	= 0;
truelength		= 0;

//find the length of all the letters
for(var i = 0; i < array_length(textmessage[page]); i++)
{
	truelength	+= string_length(textmessage[page,i][data.STRNG]);
}
i = 0;

//draw the text
for(var i = 0; i < array_length(textmessage[page]);i++)
{	
	str		= textmessage[page,i][data.STRNG];
	col		= textmessage[page,i][data.COL];
	effect	= textmessage[page,i][data.EFF];
	font	= textmessage[page,i][data.FONT];
	seccol	= textmessage[page,i][data.SEL_COL];
	ansscr	= textmessage[page,i][data.SEL_SCR];
	
	draw_set_color(col);
	
	draw_set_font(font);
	
	//find where to space the line //sprites are 64x64
	for(var j = 0; j < i; j++)
	{
		Lstr		= textmessage[page,j][0];
		Lfont		= textmessage[page,j][3];
		
		laststrlength	+= string_length(Lstr);
	}
	
	if(talkanimate)
	{
		//check if the string that you are copying is valid
		if(floor(talktime)-laststrlength>0)
		{
			currstr		= string_copy(str,0,floor(talktime)-laststrlength);
		}else
		{
			currstr = "";
		}
	}else{
		currstr = str;
	}
	
	//get the currently last character
	curr_char	= string_char_at(str,floor(talktime)-laststrlength);
	
	#region //make natural pauses at natural places
	
	if(!pause)
	{
		switch(curr_char)
		{
			case " ":
				alarm[0] = 2;
				pause = true;
				break;
				
			case ",":
				alarm[0] = 20;
				pause = true;
				break;
				
			case "!":
				alarm[0] = 30;
				pause = true;
				break;
				
			case "?":
				alarm[0] = 20;
				pause = true;
				break;
				
			case ".":
				alarm[0] = 40;
				pause = true;
				break;
		}
	}
	#endregion
	
	switch(effect)
	{
		case textstates.NONE:
			draw_text(beginx,beginy,currstr);
			break;
			
		case textstates.WRAPPED:
			draw_text_ext(beginx,beginy,currstr,string_height(currstr)+2,textmessage[page,i][data.ARG1]);
			break;
		
		case textstates.SHAKY:
			var length  = 0;
			
			draw_set_font(font);
			var currchar = "";
			for(var j = 0; j < string_length(str)+1; j ++;)
			{
				currchar = string_char_at(currstr,j+1);
				
				randx = random_range(-1,1);
				randy = random_range(-1,1);
				
				draw_text(beginx+randx+length,drawbeginningy+randy,currchar);
				length += string_width(string_char_at(str,j+1));
			}
			break;
			
		case textstates.WAVY:
			var length  = 0;
			
			draw_set_font(font);
			var currchar = "";
			for(var j = 0; j < string_length(str)+1; j ++;)
			{
				currchar = string_char_at(currstr,j+1);
				
				randx = 0;
				randy = 2*sin((time-j)/5);
				
				draw_text(beginx+randx+length,drawbeginningy+randy,currchar);
				length += string_width(string_char_at(str,j+1));
			}
			break;
			
		case textstates.QUESTION:		
			numb_of_answers = array_length(textmessage[page])-1;
		
			draw_text(beginx,beginy,currstr);
			break;
			
		case textstates.ANSWER:
			if(answerindex+1==i)
			{
				draw_set_color(seccol);
				total_numb_of_args = textmessage[page,i][data.TOT_ARG_NUMB];
				scrarg1 = textmessage[page,i][data.ARG1];
				scrarg2 = textmessage[page,i][data.ARG2];
				scrarg3 = textmessage[page,i][data.ARG3];
				
				if(keyboard_check_pressed(input_key))
				{
					switch(total_numb_of_args)
					{
						case 0:
							ansscr();
							break;
							
						case 1:
							ansscr(scrarg1);
							break;
							
						case 2:
							ansscr(scrarg1,scrarg2);
							break;
							
						case 3:
							ansscr(scrarg1,scrarg2,scrarg3);
							break;
					}
				}
			}

			//check if whole question has been asked, then draw the answers
			if(floor(talktime)>string_length(textmessage[page,0][data.STRNG]))
			{
				draw_text(drawbeginningx+emoteshift+5,beginy+20,str);
			}
			
			beginx -= string_width(str);
			beginy += 20;
			break;
	}
	beginx += string_width(str);
}


//draw the emote
if(sprite_exists(emote[page,0]))
{
	emoteid			= emote[page,0];
	animate_speed	= emote[page,1];
	
	//find the animation speed for the portrait
	if(animate_speed != 0)and(!pause)
	{
		emotetime += (time % animate_speed == 0);
	}
	
	//if a break in conversation, then show close mouthed animation
	if(pause)or(talktime > truelength)
	{
		animate_speed = 1;
	}
	
	draw_sprite(emoteid,animate_speed,emotebeginx,drawbeginningy);
}


//advance the page
if(effect != textstates.ANSWER)
{
	if(talkanimate)
	{
		if(talktime > truelength)
		{
			stop_audio = true;
			if(keyboard_check_pressed(input_key))
			{
				if(page + 1 >= numb_of_pages)or(textmessage[page+1,0][data.STRNG]==noone)
				{
					instance_destroy();
				}
				else
				{
					page += 1;
				}
			}
		}
		else
		{
			stop_audio = false;
		}
	}
	else
	{
		if(keyboard_check_pressed(input_key))
			{
				if(page + 1 >= numb_of_pages)or(textmessage[page+1,0][data.STRNG]==noone)
				{
					instance_destroy();
				}
				else
				{
					page += 1;
				}
			}
	}
}



