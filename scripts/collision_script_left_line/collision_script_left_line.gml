// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collision_script_left_line(){
	mask = argument0;
	line = floor(mask*2.5);
	
	if collision_line(x-(acos*mask) + (asin*mask), y+(asin*mask)+(acos*mask), x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),owall,true,true) return true;
	if xlayer = 0 && collision_line(x-(acos*mask) + (asin*mask), y+(asin*mask)+(acos*mask), x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),obwall,true,true) return true;
	if xlayer = 1 && collision_line(x-(acos*mask) + (asin*mask), y+(asin*mask)+(acos*mask), x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),ofwall,true,true) return true;
	if collision_line(x-(acos*mask) + (asin*mask), y+(asin*mask)+(acos*mask), x-(asin*mask)+(acos*mask),y+(asin*mask)+(acos*line),objstompable,true,true) return true;
	if canGrind && collision_line(x-(acos*mask)+(asin*mask),y+(asin*mask)+(acos*mask),x-(acos*mask)+(asin*line),y+(asin*mask)+(acos*line),objrail,true,true) return true;
	return false;
}