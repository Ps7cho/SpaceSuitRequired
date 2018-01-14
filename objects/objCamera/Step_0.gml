/// @description

//update camera destination
if (instance_exists(follow)){
	xTo = (follow.x + mouse_x)/2;
	yTo = (follow.y + mouse_y)/2;
	
}

//update object position 
x += (xTo - x) / 25;
y += (yTo - y) / 15;

//dont let camera go outside of the room
x = clamp(x,view_W_half, room_width-view_W_half);
y = clamp(y,view_H_half, room_height-view_H_half);


//update camera view
camera_set_view_pos(camera,x-view_W_half,y-view_H_half);
