/// @description Insert description here
// You can write your code in this editor
physics();

if canHit
{
    if !collision_line(x,y,x,y+(sprite_height/2)+1,owall,true,true)
    {
        y += 1
    }

    if act == 2
    {
        hspeed = image_xscale*2
        sprite_index = eggpawnrun
    }
    else 
    {
        hspeed = 0 
        sprite_index = eggpawn
    }
    if !collision_point(x+image_xscale*sprite_width/2,y+17,owall,true,true) || collision_point(x+image_xscale*sprite_width,y,owall,true,true)
    {
        act = 1
        alarm[1] = 120
    }
}