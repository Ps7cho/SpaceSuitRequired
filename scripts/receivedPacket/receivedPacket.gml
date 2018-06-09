var buffer = argument[0];
var msgid = buffer_read(buffer, buffer_u8);

switch(msgid){

	//Ping
	case networkEvents.ping:
		var time = buffer_read(buffer, buffer_u32);
		Ping = current_time - time;
	break;
	
	
	

	//player location
	case networkEvents.input:
		
		var client = buffer_read(buffer, buffer_u16);
		var key = buffer_read(buffer, buffer_u8);
		var pressed = buffer_read(buffer, buffer_bool);
		
		if(ds_map_exists(clientmap, string(client))){
			var clientObject = clientmap[? string(client)];
				with clientObject {
					movement_inputs[key] = pressed;
				}

			
			}else{
				var l = instance_create_layer(xx, yy, "Instances_1", object_Character_1);
				clientmap[? string(client)] =l;
			}
	break;
	
	case networkEvents.position:
		
		var client = buffer_read(buffer, buffer_u16);
		var xx = buffer_read(buffer, buffer_u16);
		var yy = buffer_read(buffer, buffer_u16);
		var distance = buffer_read(buffer, buffer_u8);

		if(ds_map_exists(clientmap, string(client))){
			var clientObject = clientmap[? string(client)];
			
			with clientObject{
				if distance_to_point(xx,yy) > distance{ // server determines the distance 
					object_Character.x = xx;
					object_Character.y = yy;
					//increase_distance();
				}
			}
			
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
		
		var buildingType = buffer_read(buffer, buffer_u8); //Building type (building.Generic)
		var x_pos = buffer_read(buffer, buffer_u16);
		var y_pos = buffer_read(buffer, buffer_u16);
		var bldingID = buffer_read(buffer, buffer_u16);
		var team = buffer_read(buffer, buffer_s8);
		var credits = buffer_read(buffer, buffer_u16);
		
		blding = scrBuildingPicker(buildingType); //find the type of building that was placed
		
		if buildingType > 100 {
			var resource = instance_create_layer(x_pos,y_pos,"Resources",blding);
			resource.buildingID = bldingID
		}
		var building = instance_create_layer(x_pos,y_pos,"Buildings",blding);
		building.buildingID = bldingID
		building.Team = team;
		
		if object_Character.Team = team {
			objClient.Credits = credits;	
		}
	
	break;


	case networkEvents.buildingDestroy:
		
		var bldingID = buffer_read(buffer, buffer_u16);
		with objBuilding {
			if buildingID = bldingID{
				instance_destroy(self);	
			}
		}
	
	break;
	
	case networkEvents.robot:
		
		var xx = buffer_read(buffer, buffer_u16);
		var yy = buffer_read(buffer, buffer_u16);
		var team = buffer_read(buffer, buffer_s8);
		var target = buffer_read(buffer, buffer_s8);
		var ID = buffer_read(buffer, buffer_u16);
		var create = buffer_read(buffer, buffer_s8);
		
		if create = 1{	//create
			robot = instance_create_layer(xx,yy,"Robots",objRobot);
			robot.target = instance_nearest(robot.x,robot.y,scrBuildingPicker(target));
			if instance_exists(scrBuildingPicker(target)){
				robot.image_index = floor(point_direction(xx,yy,robot.target.x,robot.target.y)/22.5); 
			}
			robot.ID = ID; 
			robot.Team = team;
		}else if create = 0{	//update
			//Update Postion (but we aren't doing that with robots)
		}else if create = -1 {	//destroy
			with objRobot{
				if self.ID = ID
				instance_destroy();
			}
		}
	
	break;
	
	case networkEvents.credits:
		
		var team = buffer_read(buffer, buffer_s8);
		var credits = buffer_read(buffer, buffer_u16);
		
		if object_Character.Team = team {
			objClient.Credits = credits;	
		}	
	break;

	
	case networkEvents.connect:
		var 
		client = buffer_read(buffer, buffer_u16),
		startx = buffer_read(buffer, buffer_u16),
		starty = buffer_read(buffer, buffer_u16),
		team = buffer_read(buffer, buffer_u8),
		credits = buffer_read(buffer, buffer_u16);
		
		if MyID = -1 {
			var l = instance_create_layer(startx, starty, "Instances_1", object_Character);
			l.CharacterID = client;
			l.Team = team;
			objClient.Credits = credits;
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