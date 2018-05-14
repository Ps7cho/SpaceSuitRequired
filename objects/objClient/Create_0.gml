/// create the Client
var type = network_socket_tcp;
var ipaddress = "dev-test.3ragaming.com";
var ipaddres = "76.187.20.162";
var localhost = "192.168.1.65";
var port = 6112;

socket = network_create_socket(type);
isConnected = network_connect(socket, localhost, port);


var size = 256;
var type = buffer_fixed;
var alignment = 1;
buffer = buffer_create(size, type, alignment);
bufferLarge = buffer_create(1024, type, alignment);

clientmap = ds_map_create();

Result = 0;
Ping = 2;
MyID = -1;

globalvar debug ;
debug = true;

//Game Variables
alarm[0] = 60;
shooting = false;
bulletSpeed = 4000;
buildmode = false;
buildDistance = 800;

Credits = -1;


//network events as enumerators
enum networkEvents {
	ping,
	input,
	shoot,
	hit,
	bullet,
	position,
	building,
	buildingDestroy,
	robot,
	credits,
	connect,
	disconnect
}
enum inputs {
	d = 0,
	w = 1,
	a = 2,
	s = 3
}
