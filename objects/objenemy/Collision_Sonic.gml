/// @description Insert description here
// You can write your code in this editor
if Sonic.sprp == Sonicroll or Sonic.sprp == Sonicspindash or Sonic.sprp == Sonicboost or Sonic.sprp == Sonicstomp
{
	//instance_destroy();
	
	if Sonic.action == -5{
		
		other.image_i = 2;
		canHit = false;
		hspeed = Sonic.xdir*Sonic.hspeed*cos(degtorad(point_direction(Sonic.x,Sonic.y,x,y)))*0.5;
		vspeed = Sonic.vspeed*sin(-degtorad(point_direction(Sonic.x,Sonic.y,x,y)))*0.5;
		Sonic.hsp = 0;
		Sonic.vsp = -6.5;
		alarm[0] = 30;
	
	}
	else{
		Sonic.vsp = -Sonic.vsp
		instance_destroy()
	}
	if instance_exists(objhominglock){
		with(objhominglock){
			instance_destroy()
		}
	}
}
//else if action = -5{
//	if canHit{
//		canHit = false;
//		y -= 10;
//		//if abs(Sonic.hsp) >= 4
//		//	shake_camera(15)
//		if Sonic.ground{
//			hspeed = other.hsp;
//			vspeed = -2.5
//		}
//		else{
//          hspeed = other.hsp*cos(degtorad(point_direction(Sonic.x,Sonic.y,x,y-3)))*1.5;
//            vspeed = -other.vsp*sin(degtorad(point_direction(Sonic.x,Sonic.y,x,y-3)))*1.5;
//		}
//		alarm[0] = 30;
//	}
//}
else if Sonic.action == 2{
	instance_destroy();
}
	
	//if Sonic.sprp == Sonicroll && Sonic.vsp > 0{
	//	Sonic.vsp = -Sonic.vsp;
	//}
else
{
	//hurtplayer
}