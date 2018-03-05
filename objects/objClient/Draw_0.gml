/// @description Cursor Sprites

if !buildmode{
	sprite = -1;
	
}else{ //Buidling!
	if Snap {
		var dis = point_distance(object_Character.x,object_Character.y,mouse_x,mouse_y);
		
		var spot =  collision_circle(mouse_x,mouse_y,buildDistance/2,Snap,false,true)
		if spot and dis < buildDistance{
			draw_sprite_ext(sprite,0,spot.x,spot.y,1,1,0,-1,0.5)
		}else{
			draw_sprite_ext(sprite,0,mouse_x,mouse_y,1,1,0,c_red,0.5)
		}
	}else{
		with (Test){
			var checkspace = place_empty(mouse_x,mouse_y);
		}
	
		var dis = point_distance(object_Character.x,object_Character.y,mouse_x,mouse_y);
	
		if checkspace and dis < buildDistance {
			draw_sprite_ext(sprite,0,mouse_x,mouse_y,1,1,0,-1,0.5)
		}else{
			draw_sprite_ext(sprite,0,mouse_x,mouse_y,1,1,0,c_red,0.5)
		}
	}
}