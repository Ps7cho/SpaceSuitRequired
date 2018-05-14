/// @description move

var base = noone;

with (target){
	if 	self.Team = other.Team {
		var base = id;	
	}
}
if (base != noone){
	move_towards_point(base.x,base.y, Speed);
	image_index = floor(point_direction(x,y,base.x,base.y)/22.5); 
}else{
	move_towards_point(x,y,0);
}
