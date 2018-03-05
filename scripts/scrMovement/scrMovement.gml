///scrMovement

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