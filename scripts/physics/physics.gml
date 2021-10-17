// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function physics(){
	if (hsp>hspl) hsp=hspl;
	if (hsp<-hspl) hsp=-hspl;
	if (vsp>vspl) vsp=vspl;
	
	if hsp > 0
	{
		for(i=0;i<hsp && !collision_script_right(16);i+=1)
		{
			x+=acos;
			y-=asin;
		}
	}
	
	if hsp < 0
	{
		for(i=0;i>hsp && !collision_script_left(16);i-=1)
		{
			x-=acos;
			y+=asin;
		}
	}
	
	if vsp > 0
	{
		for(i=0;i<vsp && !collision_script_bottom(16);i+=1)
		{
			y+=1;
		}
	}
	
	if vsp < 0
	{
		for(i=0;i>vsp && !collision_script_top(16);i-=1)
		{
			y-=1;
		}
	}
	
	//running into wall
	while (collision_script_right(16))
	{
		x-=acos;
		y+=asin;
	}
	while (collision_script_left(16))
	{
		x+=acos;
		y+=asin;
	}
	//landing
	if vsp>=0 && !ground && collision_script_bottom(16) && (collision_script_left_line(16) || collision_script_right_line(16))
	{
		angle = find_angle(angle,10,16);
		acos = cos(degtorad(angle));
		asin = sin(degtorad(angle));
		vsp=0;
		ground = true;
	}
	
	if ground{
		while collision_script_main(16)
		{x-=asin; y-=acos;}
		while (collision_script_ground(16) && ! collision_script_main(16))
		{x+=asin; y+=acos;}
	}
	
	if vsp>=0 && !ground && collision_script_bottom(16) && collision_script_ground(16) && action = -6 && place_meeting(x,y,objstompable)
	{
			vsp = vsp;
			ground = false;
	}
	
	
	//into the air
	if !collision_script_left_line(16) || !collision_script_right_line(16) && ground
	{
		ground = false;
	}
	
	//gravity
	if !ground vsp+=vfr;
	
	//angle speed
	if angle > 70 && angle < 290 && abs(hsp) < 2.5
	{
		angle = 0;
		vsp = -(asin*hsp);
		hsp = (acos*hsp);
		ground = 0;
	}
	
	//slope factor
	if action = 0 slp = 0.125;
	if action = 2 {if sign(hsp) = sign(asin) slp=0.078125; if sign(hsp) != sign(asin) slp = 0.3125;}
	if action >=0 hsp-=slp*asin;
	
	if ground && collision_script_left_line(16) && collision_script_right_line(16)
	{
		angle=find_angle(angle,16,24);
	}
	else
	{
		angle = 0;
	}
	acos = cos(degtorad(angle));
	asin = sin(degtorad(angle));
}