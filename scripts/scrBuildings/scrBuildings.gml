//scrBuidlings();

if keyboard_check_pressed(ord(1)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"Buildings",objBuilding);
	buildingID = 1;
}

if keyboard_check_pressed(ord(2)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"Buildings",objBase0);
	buildingID = 2;
}

if keyboard_check_pressed(ord(3)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"Buildings",objBase1);
	buildingID = 3;
}

if keyboard_check_pressed(ord(4)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"Buildings",objBase2);
	buildingID = 4;
}

if keyboard_check_pressed(ord(5)){
	buildmode = true;
	Test = instance_create_layer(-10,-10,"Buildings",objBase3);
	buildingID = 5;
}