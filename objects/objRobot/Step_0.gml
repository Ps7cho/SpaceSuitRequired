/// @description move

var base = noone;

with (target){
	if 	self.Team = other.Team {
		var base = id;	
	}
}
if (base != noone){
	move_towards_point(base.x,base.y, Speed);
}else{
	move_towards_point(x,y,0);
}
