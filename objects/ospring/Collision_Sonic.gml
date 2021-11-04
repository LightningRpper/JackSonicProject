/// @description Insert description here
// You can write your code in this editor
if activate{
	Sonic.angle = 0
	if Sonic.action = -5{
		vspeed = 0
		hspeed = 0
		with (objhominglock)
			instance_destroy()
	}
	Sonic.action = 4
	Sonic.ground = false
	Sonic.image_i = 0;
	Sonic.x = x + 16*cos(degtorad(image_angle))
	Sonic.y = y - 16*sin(degtorad(image_angle))
	activate = false
	Sonic.hsp = cos(degtorad(image_angle))*force_power
	Sonic.vsp = -sin(degtorad(image_angle))*force_power
	if image_angle < 90 && image_angle > 270
		Sonic.xdir = 1
	else if image_angle > 90 && image_angle < 270
		Sonic.xdir = -1
	image_speed = 0.75
}