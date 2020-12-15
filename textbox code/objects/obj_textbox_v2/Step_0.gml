var scripttorun, maxscrtime;

time += 1;

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
