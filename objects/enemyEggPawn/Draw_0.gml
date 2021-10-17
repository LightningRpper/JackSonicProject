/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprp,image_i,x,y,xdir,1,angle,c_white,1);
if image_i > 998 image_i = 0;
if frame >= 1 {frame = 0; image_i+=1}

//stand
if hsp=0 && ground
{
	sprp = eggpawn; last_action=0; frame += 0.1;
}
if (hsp!=0 || !ground) && action = 0
{
	if last_action = 0 image_i = 0 
	last_action = 1;
	frame+= 1/max(8-(abs(hsp)),1);
	if abs(hsp) > 0 && abs(hsp) < 8 sprp = eggpawnwalk;
	if abs(hsp) = 8 sprp = eggpawnrun;
}