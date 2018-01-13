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
			clientObject.x = lerp(x, xx, 1);
			clientObject.y = lerp(y, yy, 1);
			}else{
				var l = instance_create_layer(xx, yy, "Instances_1", object_Character_1);
				clientmap[? string(client)] =l;
			}
	break;
	
	
	case networkEvents.connect:
		var 
		client = buffer_read(buffer, buffer_u16),
		startx = buffer_read(buffer, buffer_u16),
		starty = buffer_read(buffer, buffer_u16),
		
		if MyID = -1 {
			var l = instance_create_layer(startx, starty, "Instances_1", object_Character);
			l.CharacterID = client;
			clientmap[? string(client)] =l;
			MyID = client;
		}else{
				var l = instance_create_layer(startx, starty, "Instances_1", object_Character_1);
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