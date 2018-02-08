/// send Packets for our client

global.seconds_passed = delta_time/1000000;

if !buildmode{
	cursor_sprite = -1
	if mouse_check_button_pressed(mb_left){
			shooting = true;
			alarm[1] = 1;
	}
}else{
	with (Test){
		var space = place_empty(mouse_x,mouse_y);
	}
	
	var dis = point_distance(object_Character.x,object_Character.y,mouse_x,mouse_y);
	
	if space and dis < buildDistance {
		cursor_sprite = sprBuidlingCheck;
	}else{
		cursor_sprite = sprBuidlingCheck1;
	}
	if mouse_check_button_pressed(mb_right){
		buildmode = false;
	}
	if mouse_check_button_pressed(mb_left){
			if space = true{
				buildmode = false;
				instance_destroy(Test);
					buffer_seek(buffer, buffer_seek_start, 0);
					buffer_write(buffer, buffer_u8, networkEvents.building);
					buffer_write(buffer, buffer_u8, 1); //Building type (building.Generic)
					buffer_write(buffer, buffer_u16, mouse_x);
					buffer_write(buffer, buffer_u16, mouse_y);
					network_send_packet(socket, buffer, buffer_tell(buffer));
			}
	}	
}

if keyboard_check_pressed(ord(1)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"instances_1",objBuilding);
}

if mouse_check_button_released(mb_left){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.shoot); //message ID
		buffer_write(buffer, buffer_bool, 0); //False
		network_send_packet(socket, buffer, buffer_tell(buffer));
		shooting = false;
}


if keyboard_check_pressed(ord("D")){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.d); //message ID
		buffer_write(buffer, buffer_bool, 1); //True
		network_send_packet(socket, buffer, buffer_tell(buffer));
}
if keyboard_check_released(ord("D")){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.d); //message ID
		buffer_write(buffer, buffer_bool, 0); //False
		network_send_packet(socket, buffer, buffer_tell(buffer));
}

if keyboard_check_pressed(ord("W")){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.w); //message ID
		buffer_write(buffer, buffer_bool, 1); //True
		network_send_packet(socket, buffer, buffer_tell(buffer));
}
if keyboard_check_released(ord("W")){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.w); //message ID
		buffer_write(buffer, buffer_bool, 0); //False
		network_send_packet(socket, buffer, buffer_tell(buffer));
}

if keyboard_check_pressed(ord("A")){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.a); //message ID
		buffer_write(buffer, buffer_bool, 1); //True
		network_send_packet(socket, buffer, buffer_tell(buffer));
}
if keyboard_check_released(ord("A")){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.a); //message ID
		buffer_write(buffer, buffer_bool, 0); //False
		network_send_packet(socket, buffer, buffer_tell(buffer));
}

if keyboard_check_pressed(ord("S")){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.s); //message ID
		buffer_write(buffer, buffer_bool, 1); //True
		network_send_packet(socket, buffer, buffer_tell(buffer));
}
if keyboard_check_released(ord("S")){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.s); //message ID
		buffer_write(buffer, buffer_bool, 0); //False
		network_send_packet(socket, buffer, buffer_tell(buffer));
}