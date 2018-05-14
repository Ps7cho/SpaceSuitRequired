/// send Packets for our client


global.seconds_passed = delta_time/1000000;

//stop shooting
if mouse_check_button_released(mb_left){
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, networkEvents.shoot); //message ID
		buffer_write(buffer, buffer_bool, 0); //False
		network_send_packet(socket, buffer, buffer_tell(buffer));
		shooting = false;
}

if !buildmode{
	
	if mouse_check_button_pressed(mb_left){ //Shooting!
			shooting = true;
			alarm[1] = 1;
	}
	
}else{ //Buidling!
	with (Test){
		var checkspace = place_empty(mouse_x,mouse_y);
	}
	
	var dis = point_distance(object_Character.x,object_Character.y,mouse_x,mouse_y);
	
	if mouse_check_button_pressed(mb_right){
		buildmode = false;
		Snap = noone;
	}
	if mouse_check_button_pressed(mb_left){
			if Snap {
				var spot = collision_circle(mouse_x,mouse_y,buildDistance,Snap,false,true)
				if spot and dis < buildDistance {
					buildmode = false;
					Snap = noone;
					layer_destroy_instances("TempBuildings");
				
					buffer_seek(buffer, buffer_seek_start, 0);
					buffer_write(buffer, buffer_u8, networkEvents.building);
					buffer_write(buffer, buffer_u8, buildingID); //Building type (building.Generic)
					buffer_write(buffer, buffer_u8, object_Character.Team);
					buffer_write(buffer, buffer_u16, spot.x);
					buffer_write(buffer, buffer_u16, spot.y);
					
					network_send_packet(socket, buffer, buffer_tell(buffer));
				}
			}else{
				if checkspace = true and dis < buildDistance{
					buildmode = false;
					Snap = noone;
					layer_destroy_instances("TempBuildings");
				
						buffer_seek(buffer, buffer_seek_start, 0);
						buffer_write(buffer, buffer_u8, networkEvents.building);
						buffer_write(buffer, buffer_u8, buildingID); //Building type (building.Generic)
						buffer_write(buffer, buffer_u8, object_Character.Team);
						buffer_write(buffer, buffer_u16, mouse_x);
						buffer_write(buffer, buffer_u16, mouse_y);
					
						network_send_packet(socket, buffer, buffer_tell(buffer));
				}
			}
	}	
}

if keyboard_check_pressed(ord(2)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"TempBuildings",objMiner);
	buildingID = 1;
	sprite = sprMineralExtrctor;
	Snap = objMineral;
}

if keyboard_check_pressed(ord(1)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"TempBuildings",objBase0);
	buildingID = 2;
	sprite = sprBase0;
	Snap = noone;
}

if keyboard_check_pressed(ord(3)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"TempBuildings",objPlasmaProducer);
	buildingID = 6;
	sprite = sprPlasmaProducer;
	Snap = noone;
}

if keyboard_check_pressed(ord(4)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"TempBuildings",objPlasmaSupply);
	buildingID = 7;
	sprite = sprPlazmaSupply;
	Snap = noone;
}

if keyboard_check_pressed(ord(5)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"TempBuildings",objBase3);
	buildingID = 5;
	sprite = sprBase3;
	Snap = noone;
}
scrMovement();



