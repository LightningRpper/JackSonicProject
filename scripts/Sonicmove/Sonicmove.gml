// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Sonicmove(){
	key_d = keyboard_check(vk_down);
	key_u = keyboard_check(vk_up);
	key_r = keyboard_check(vk_right);
	key_l = keyboard_check(vk_left);
	key_a = keyboard_check_pressed(vk_space);
	key_ar = keyboard_check_released(vk_space);
	key_c = keyboard_check_pressed(ord("C"));
	key_b = keyboard_check(ord("B"));
	key_v = keyboard_check_pressed(vk_down);
	key_x = keyboard_check_pressed(ord("X"));
	
	//direction action = 0
	//jump action = 1
	//movement action = 2
	//dash pad action = 3
	//dash ring action = 4, spring action = 4.5
	//grinding action = 5
	//skidding action = 6
	//dash ramp action = 7
	//swing bar action = 8
	//swing end action = 9
	//rolling action = -1
	//spin dash action = -2
	//look up action = -3
	//boost action = -4
	//homing attack action = -5, -5.5
	//stomp action = -6
	//light speed dash action = -7
	
	currhsp = 0
	
	//direction
	if action = 0
	{
		if key_l xdir = -1;
		if key_r xdir = 1;
	}
	//movement
	if (action = 0||action = 1)
	{
		if ground{
			if key_r
			{if hsp>=0 {if hsp < hspm hsp+=acc} else hsp+=dcc;}
			if key_l
			{if hsp<=0 {if hsp > -hspm hsp-=acc} else hsp-=dcc;}
			if !key_r && !key_l
			{if hsp > 0 hsp-=frc; if hsp < 0 hsp+=frc; if hsp<=frc && hsp >=-frc hsp=0;}
		}
		else
		{
			if key_r
			{if hsp>=0 {if hsp < hspm hsp+=acc*2};}
			if key_l
			{if hsp<=0 {if hsp > -hspm hsp-=acc*2};}
			if !key_r && !key_l
			{if hsp > 0 hsp-=frc; if hsp < 0 hsp+=frc; if hsp<=frc && hsp >=-frc hsp=0;}
		}
	}
	if action = 2
	{
		if ground{
			if hsp > bfr {hsp-=bfr;if key_l hsp-=bdcc}
			if hsp <-bfr {hsp+=bfr;if key_r hsp+=bdcc}
			if hsp < bfr && hsp > -bfr hsp=0;
		}
		else
		{
			if key_r
			{if hsp>=0 {if hsp < hspm hsp+=acc*2};}
			if key_l
			{if hsp<=0 {if hsp > -hspm hsp-=acc*2};}
		}
	}
	///jump
	if key_a && ground && (action = 0 || action = 2 || action = -1 || action = 5)
	{
		ground = 0;
		vsp = acos*jmp + (-asin*hsp)/1.5;
		hsp = hsp*acos + asin*jmp;
		angle = acos*hsp;
		acos = 1;
		asin = 0;
		action=1;
	}
	if action == 1 && !ground{
		if key_r{
            if hsp >=0 {
                if hsp< currhsp 
                    hsp+=acc/2
            } 
            else 
                hsp+=dcc/2;
		}
		if key_l{
            if hsp<=0{
                if hsp > -currhsp 
                    hsp-=acc/2
            }         
            else 
                hsp-=dcc/2;
        }
        if !key_r && !key_l{
            if hsp > 0 
                hsp -= frc; 
            if hsp < 0 
                hsp += frc;
            if hsp <= frc && hsp >= -frc 
                hsp = 0;
        }
	}
	
	//small jump
	if key_ar && vsp<sjmp && action = 1
	{
		vsp = sjmp;
	}
	
	//air drag
	if vsp < 0 && vsp >= -4
	{
		if abs(hsp) >= 0.125 {hsp=hsp*adrag};
	}
	
	//landing
	if ground && (action = 1)
	{action = 0;}
	
	//rolling and ducking
	if key_d && ground && action = 0
	{
		if abs(hsp) < 1.03125 {hsp = 0; action = -1};
		if abs(hsp) >= 1.03125 {action = 2};
	}
	if action = -1 &&!key_d {action = 0};//unduck
	if action = 2 && abs(hsp) < 0.5 && ground {action = 0};//unroll
	if action = 2 && vsp > 0 && !ground && collision_script_ground(14)//unroll on ground
	{action = 0;}
	
	//looking up
	if key_u && ground && action = 0
	{
		if abs(hsp) < 0.2 {hsp = 0; action = -3; image_i =0};
	}
	if (!key_u||!ground||key_r||key_l) && (action = -3 && image_i>=4) action = 0;
	
	///spin dash
	if sp > 0 {sp = sp-((sp div 1)/265)}
	if sp > 192 sp = 192;
	if action = -2 && key_a {sp+=8;}
	if action = -2 && !key_d {hsp = xdir*16+(xdir*floor(sp)/16);action = 2; sp = 0;}
	if action = -1 && key_a {sp=0;action=-2;image_i=0}
	
	///boost
	
	if key_b && (action = 0 || action = 5) && ground && boostamount > 0 {
		if xdir = 1
		{hsp=32;}
		if xdir = -1
		{hsp=-32;}
		boosting = true;

	}
	if key_b && (action = 1 || action = 5) && !ground && boostamount > 0 {
		if xdir = 1
		{hsp=32;}
		if xdir = -1
		{hsp=-32;}
		boosting = true;
	}
	if boostamount = 0 {
		boosting = false;
	}

	//homing attack
	if (action == 1 || (action == 0 && !ground)){
		canHome = true;
	}
	else {
		canHome = false;
	}
	if canHome && distance_to_object(instance_nearest(x,y,objhomingtarget)) <= 250 && instance_nearest(x,y,objhomingtarget).y > (y-10) && !collision_line(x,y,instance_nearest(x,y,objhomingtarget).x,instance_nearest(x,y,objhomingtarget).y,owall,true,true) && instance_nearest(x,y,objhomingtarget).canHit && ((x<instance_nearest(x,y,objhomingtarget).x && xdir == 1) || (x>instance_nearest(x,y,objhomingtarget).x && xdir == -1)){
		if !instance_exists(objhominglock)
			instance_create_depth(instance_nearest(x,y,objhomingtarget).x,instance_nearest(x,y,objhomingtarget).y,0,objhominglock)
	}
	else if distance_to_object(instance_nearest(x,y,objhomingtarget)) > 250 || ground ||  instance_nearest(x,y,objhomingtarget).y <= (y-10) || (x<instance_nearest(x,y,objhomingtarget).x && xdir == -1) || (x>instance_nearest(x,y,objhomingtarget).x && xdir == 1){
		if instance_exists(objhominglock)
			with(objhominglock){
				instance_destroy();
			}	
	}
	if (action = 1 && djmp && key_ar) || (action == 0 && !ground) || action == 4{
		djmp = false
	}
				
	if instance_exists(objhominglock){
		if key_a && !djmp {
			action = -5;
			vsp = 0;
			hsp = xdir*6;
			move_towards_point(objhominglock.x,objhominglock.y,130)
		}
	}
	if !djmp && ground
		djmp = true
	
	if action = -5 && instance_exists(objhominglock){
		move_towards_point(objhominglock.x,objhominglock.y,130)
	}
	else{
		vspeed = 0
		hspeed = 0
	}
	if action == -5 && (place_meeting(x,y,owall) || ground || place_meeting(x,y,objenemy)){ 
		action = 0;
		hsp = 0;
		vsp = vspm;
	}
	
	///stomp
	if key_d && !ground && (action = 1 || action = 2){
		hsp = 0;
		vsp = vspl;
		key_b = false;
		key_c = false;
		key_a = false;
		key_x = false;
		action = -6;
	}

		
	if action = -6 && ground
	{action = 0;}
		
	//light speed dash
	if distance_to_object(instance_nearest(x,y,oringlightspeed)) <= 20 && key_x
		action = -7;
	if action = -7{
		if instance_exists(oringlightspeed) && distance_to_object(instance_nearest(x,y,oringlightspeed)) <= 50{
			if instance_nearest(x,y,oringlightspeed).x > x
				xdir = 1
			else if instance_nearest(x,y,oringlightspeed).x < x
				xdir = -1
			move_towards_point(instance_nearest(x,y,oringlightspeed).x,instance_nearest(x,y,oringlightspeed).y,20)
			hsp = 0;
			vsp = 0;
			i_angle = point_direction(x,y,instance_nearest(x,y,oringlightspeed).x,instance_nearest(x,y,oringlightspeed).y)
		
		}
		else{
			hsp = xdir*9*cos(i_angle)
			vsp = 9*sin(i_angle)
			action = 0
			hspeed = 0
			vspeed = 0
		}
	}
	
	//dash pad
	if action = 3
	{
		if hsp > 0
			hsp = hspl
		else if hsp < 0
			hsp = -hspl
	}
	
	//reacting to spring and dash ring
	if (action = 4 || action = 4.5){
		if hsp > 0
			xdir = 1;
		else if hsp < 0
			xdir = -1;
		if ground
			action = 0
	}
	
	//rail grinding
	if vsp >= 0
		canGrind = true;
	else
		canGrind = false;

	if canGrind && ground && collision_line(x,y,x+20*asin,y+20*acos,objrail,true,true){
		if action == 2
			action = 0;
		action = 5
	}
	if action == 5{
		if hsp > 0
			xdir = 1;
		else if hsp < 0
			xdir = -1;
		if abs(hsp) < hspm
			hsp += acc*xdir;
		if key_b
			hsp = hspl*xdir;
		hsp += -asin*(dcc/6);
		if !ground || !collision_line(x,y,x+20*asin,y+20*acos,objrail,true,true)
			action = 0;
	}
	
	//skidding
	if action == 0 && ground{
		if (xdir == 1 && key_l && hsp >= 5) || (xdir == -1 && key_r && hsp <= -5){
		action = 6;
		image_i = 0;
		}
	}
	if action = 6{
		if hsp > 1
			hsp -= dcc/4
		if hsp < -1
			hsp += dcc/4
		if hsp > 1 && key_l
			hsp -= dcc/3
		if hsp < -1 && key_r
			hsp += dcc/3
		if (xdir == 1 && key_r && !key_l) || (xdir == -1 && key_l && !key_r)
			action = 0
		if abs(hsp) <= 1 || !ground{
			action = 0
			xdir = -xdir
		}
	}
	//dash ramp
	if action = 7{
		hsp = 12*xdir
		if ground
			action = 0
	}
	
	//swingbar
	if action = 8{
		x = instance_nearest(x,y,oswingbar).x
		y = instance_nearest(x,y,oswingbar).y
		hsp = 0
		vsp = 0
    
		if key_a && (image_i % 15 >= 0 && image_i % 15 < 5)   {
			action = 9
			vsp = -8
			hsp = xdir*10
		}
		else if key_a{
			action = 0
			y += 10
		}
	}
	if action == 9{
		if vsp >= 2 || ground
			action = 0
	}
}