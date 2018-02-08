/// create the Client
var type = network_socket_tcp;
var ipaddress = "dev-test.3ragaming.com";
var ipaddres = "104.187.119.7";
var localhost = "192.168.1.65";
var port = 6112;

socket = network_create_socket(type);
isConnected = network_connect(socket, ipaddres, port);


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


//network events as enumerators
enum networkEvents {
	ping,
	w,
	d,
	s,
	a,
	shoot,
	hit,
	bullet,
	position,
	building,
	connect,
	disconnect
}