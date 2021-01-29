var scripttorun, maxscrtime;

time += 1;

//audio
if(!stop_audio)and(!pause)
{
	if(array_length(audio[page]) != 0)
	{
		var a = audio[page][irandom(array_length(audio[page])-1)];
		
		if(time % audio_spd == 0)
		{
			audio_play_sound(a,10,false);
		}
	}
}


if(talkanimate)and(!pause)
{
	talktime += (time%talkspeed[page] == 0);
}

if(script_exists(scr[page,0]))
{
	scripttorun		= scr[page,0];
	maxscrtime		= scr[page,1];
	
	scripttime += 1;
	
	//actually run the script
	if(scripttime < maxscrtime)
	{
		scripttorun();
	}
}

if(lastpage != page)
{
	talktime = 0;
	scripttime = 0;
	answerindex = 0;
	
	lastpage = page;
}

//move the chice cursor
if(keyboard_check_pressed(key_left))
{
	answerindex-=1;
	if(answerindex == -1){answerindex = numb_of_answers-1;}
}
if(keyboard_check_pressed(key_right))
{
	answerindex+=1;
	if(answerindex == numb_of_answers){answerindex = 0;}
}
