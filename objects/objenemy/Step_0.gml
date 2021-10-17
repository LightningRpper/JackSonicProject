/// @description Insert description here
// You can write your code in this editor
if !canHit
{
    if hspeed >= 0
        image_angle += 45
    else 
        image_angle -= 45
    if collision_circle(x,y-5,8,owall,true,true)
        instance_destroy()
}