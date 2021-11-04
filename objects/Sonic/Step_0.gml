/// @description Insert description here
// You can write your code in this editor
physics();

if !stageClear
    Sonicmove()
else
{
    action = 0;
    xdir = 1;
    if abs(hsp) < 9
    hsp += acc;
}

if collision_circle(x,y,17,triggerbackground,true,false)
{
	xlayer = 0;
}

if collision_circle(x,y,17,triggerforeground,true,false)
{
	xlayer = 1;
}

if collision_circle(x,y,17,triggerswitch,true,false)
{
	if hsp>0 && ground xlayer=0;
	if hsp<0 && ground xlayer=1;
}

if boostamount > 100
	boostamount = 100;
if boostamount < 0
	boostamount = 0;
	
if !canMove
	exit
	
if alarm0 > 0 {
	alarm0 -= 1
	if alarm0 == 1
		grv = 0.21875
}

if alarm1 > 0 {
	alarm1 -= 1
	if alarm1 == 1
		action = 0
}


if alarm2 > 0
{
    alarm2 -= 1
    if alarm2 == 1
    {
        action = 0
		hsp = 0
        vsp = 0
        grv = 0.21875;
    }
}


if hitInvincible > 0 
{
    hitInvincible -= 1
    if hitInvincible == 1
        canHit = true
}