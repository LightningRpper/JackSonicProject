/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprp,image_i,x,y,xdir,1,angle,c_white,1);
if image_i > 998 image_i = 0;
if frame >= 1 {frame = 0; image_i+=1}

//stand
if hsp=0 && ground && action = 0
{
	sprp = Sonicstand; last_action=0; image_speed = 0.2; frame += 0.20;
}
if (hsp!=0 || !ground) && action = 0
{
	if last_action = 0 image_i = 0;
	last_action = 1;
	frame+= 1/max(8-(abs(hsp)),1);
	if abs(hsp) < 6 sprp = Sonicstart; frame += 1/max(16-(abs(hsp)),1);
	if abs(hsp) >= 6 && abs(hsp) < 16 sprp = Sonicrunning; frame += 1/max(23-(abs(hsp)),1);
	if abs(hsp) >= 16 sprp = Sonicsprint; frame += 1/max(24-(abs(hsp)),1);
	if key_b {
		sprp = Sonicboost; frame += 1/max(24-(abs(hsp)),1);
		if xdir = 1{
		draw_sprite_ext(Boost,0,x,y,1,1,angle,c_white,1)}
		if xdir = -1 {
		draw_sprite_ext(Boost,0,x,y,-1,1,angle,c_white,1)}
	}
}

///jump roll
if action = 1 || action = 2
{
	frame += 1/max(5-abs(hsp),1);
	sprp=Sonicroll; frame += 0.25;
	if key_b {
		sprp = Sonicroll; image_i = 0; frame += 0.25;
		if xdir = 1{
		draw_sprite_ext(Boost,0,x,y,1,1,angle,c_white,1)}
		if xdir = -1 {
		draw_sprite_ext(Boost,0,x,y,-1,1,angle,c_white,1)}
	}
}
///ducking
if action=-1
{
	sprp=Soniclookdown; frame += 0.25;
	if image_i ==3
		image_i = 3;
}
///looking up
if action=-3
{
	sprp=Soniclookup; frame += 0.25;
	if image_i == 3
		image_i = 3;
}

///spin dash
if action =-2
{
	frame += 0.5;
	if key_a image_i = 0
	sprp = Sonicspindash;
}

//homing attack
if action == -5
{
	frame += 1;
	sprp = Sonicroll;
}

//stomp
if key_d && !ground && (action = 1 || action = -6)
{
	sprp = Sonicstomp; frame += 0.5;
	
}

//light speed dash
if action = -7 || action = 4{
	sprp = Soniclightspeeddash; frame += 0.5;
}

//free fall
if action = 0 && !ground{
	sprp = Sonicfreefall; frame += 0.5;
	if image_i >= 7{
		image_i = 5
	}
}

//dashpad
if action = 3{
	sprp = Sonicsprint;
	frame += 1/max(2-(abs(hsp)),1);
}

//grinding
if action = 5 && collision_line(x,y,x+25*asin,y+25*acos,objrail,true,true) && ground{
	if abs(hsp) < 8.5
        sprp = Sonicgrinding
    else
        sprp = Sonicgrindingfast
	if key_b && xdir = 1
		draw_sprite_ext(Boost,0,x,y,1,1,angle,c_white,1)
	if key_b && xdir = -1
		draw_sprite_ext(Boost,0,x,y,-1,1,angle,c_white,1)
    frame += 0.5;
}
