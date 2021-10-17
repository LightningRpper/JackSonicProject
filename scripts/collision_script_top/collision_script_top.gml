// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collision_script_top(){
	mask = argument0;
	
	if collision_circle(x-asin*mask,y-acos*mask,3,owall,true,true) return true;
	if xlayer = 0 && collision_circle(x-asin*mask,y-acos*mask,3,obwall,true,true) return true;
	if xlayer = 1 && collision_circle(x-asin*mask,y-acos*mask,3,ofwall,true,true) return true;
	if collision_circle(x-asin*mask,y-acos*mask,3,objstompable,true,true) return true;
	return false;
}