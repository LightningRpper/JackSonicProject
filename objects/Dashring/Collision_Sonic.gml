/// @description Insert description here
// You can write your code in this editor
if activate{
	activate = false;
	if image_angle == 0 || image_angle == 180{
		other.grv = 0;
		other.alarm0 = alarm_amount;
		other.action = 4
	}
	other.ground = false;
	other.image_i = 0;
	other.x = x
	other.y = y
	other.hsp = cos(degtorad(image_angle))*force_power
    other.vsp = -sin(degtorad(image_angle))*force_power
    if image_angle < 90 && (image_angle > 270 || image_angle > -90)
        other.xdir = 1
    else if image_angle > 90 && (image_angle < 270 || image_angle < -90)
        other.xdir = -1
	effect = instance_create_depth(x,y,0,Dashringactivate)
    effect.image_angle = image_angle
}