var buffer = argument[0];
var msgid = buffer_read(buffer, buffer_u8);

switch(msgid){

	//Ping
	case networkEvents.ping:
		var time = buffer_read(buffer, buffer_u32);
		Ping = current_time - time;
	break;
	
	//player location
	case networkEvents.position:
		
		var client = buffer_read(buffer, buffer_u16);
		var xx = buffer_read(buffer, buffer_u16);
		var yy = buffer_read(buffer, buffer_u16);
		
		if(ds_map_exists(clientmap, string(client))){// [note] check if its your position
			var clientObject = clientmap[? string(client)];
			clientObject.tim = 0;
			clientObject.prx = clientObject.x;
			clientObject.pry = clientObject.y;
			clientObject.tox = xx;
			clientObject.toy = yy;
			
			}else{
				var l = instance_create_layer(xx, yy, "Instances_1", object_Character_1);
				clientmap[? string(client)] =l;
			}
	break;
	
	case networkEvents.shoot:
	
		var client = buffer_read(buffer, buffer_u16);
		var xx = buffer_read(buffer, buffer_u16);
		var yy = buffer_read(buffer, buffer_u16);
		var pointx = buffer_read(buffer, buffer_u16);
		var pointy = buffer_read(buffer, buffer_u16);
		var bullet = buffer_read(buffer, buffer_u16);

		
		var move_speed_this_frame = bulletSpeed*global.seconds_passed;

		var slug = instance_create_layer(xx,yy,"Instances_1",objBullet);
		with slug{
			image_angle = point_direction(xx, yy, pointx, pointy);
			move_towards_point(pointx,pointy,move_speed_this_frame)
			ID = client;
			bulletID = bullet;
		}
		
	break;
	
	case networkEvents.hit:
	
		var client = buffer_read(buffer, buffer_u16);
		var Health = buffer_read(buffer, buffer_u16);
		
		var character = clientmap[? string(client)];
		character.Health = Health;		
		character.CharacterID = client;
		
	break;
	
	case networkEvents.bullet:
		
		var bullet = buffer_read(buffer, buffer_u16);
		with objBullet{
			if bulletID = bullet{
				instance_destroy();
			}
		}
		
	break;
	
	case networkEvents.building:
		
		var building = buffer_read(buffer, buffer_u8);
		var x_pos = buffer_read(buffer, buffer_u16);
		var y_pos = buffer_read(buffer, buffer_u16);
		var bldingID = buffer_read(buffer, buffer_u16);
		
		var building = instance_create_layer(x_pos,y_pos,"instances_1",objBuilding);
		building.buildingID = bldingID
	
	break;


	case networkEvents.buildingDestroy:
		
		var bldingID = buffer_read(buffer, buffer_u16);
		with objBuilding {
			if buildingID = bldingID{
				instance_destroy(self);	
			}
		}
	
	break;
	
	case networkEvents.connect:
		var 
		client = buffer_read(buffer, buffer_u16),
		startx = buffer_read(buffer, buffer_u16),
		starty = buffer_read(buffer, buffer_u16);
		
		if MyID = -1 {
			var l = instance_create_layer(startx, starty, "Instances_1", object_Character);
			l.CharacterID = client;
			clientmap[? string(client)] =l;
			MyID = client;
		}else{
				var l = instance_create_layer(startx, starty, "Instances_1", object_Character_1);
				l.CharacterID = client;
				clientmap[? string(client)] =l;
			}
	break;
	
	//Client Disconnect
	case networkEvents.disconnect: 
		var client = buffer_read(buffer, buffer_u16);
		var clientObject = clientmap[? string(client)];
		var l = instance_destroy(clientObject);
		
		clientmap[? string(client)] = l;
	
	break;

}