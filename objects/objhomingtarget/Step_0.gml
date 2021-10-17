/// @description Insert description here
// You can write your code in this editor
vspeed = 0;
hspeed = 0;
if instance_exists(objhominglock)
    with(objhominglock)
    {
        instance_destroy()
    }