// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collision_script_ground(){
	mask = argument0;
	multiply = 2.5;
	radius = 9
	if collision_circle(x-asin*(mask*1.5),y+acos*(mask*1.5),3,owall,true,true) return true;
	if xlayer = 0 && collision_circle(x-asin*(mask*1.5),y+acos*(mask*1.5),3,obwall,true,true) return true;
	if xlayer = 1 && collision_circle(x-asin*(mask*1.5),y+acos*(mask*1.5),3,ofwall,true,true) return true;
	if collision_circle(x-asin*(mask*1.5),y+acos*(mask*1.5),3,objstompable,true,true) return true;
	if canGrind && collision_circle(x-asin*(mask*multiply),y+acos*(mask*multiply),radius,objrail,true,true) return true;
	return false;
}