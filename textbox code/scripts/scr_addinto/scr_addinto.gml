// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_addinto(xx,yy,str,col,effect,font,choice_selected_color,choice_selected_script,total_numb_of_args,scrarg1,scrarg2,scrarg3){

textmessage[xx,yy][0] = str;
textmessage[xx,yy][1] = col;
textmessage[xx,yy][2] = effect;
textmessage[xx,yy][3] = font;
textmessage[xx,yy][4] = choice_selected_color;
textmessage[xx,yy][5] = choice_selected_script;
textmessage[xx,yy][5] = choice_selected_script;
textmessage[xx,yy][6] = total_numb_of_args;
textmessage[xx,yy][7] = scrarg1;
textmessage[xx,yy][8] = scrarg2;
textmessage[xx,yy][9] = scrarg3;

}