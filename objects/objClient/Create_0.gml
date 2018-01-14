/// create the Client
var type = network_socket_tcp;
var ipaddress = "dev-test.3ragaming.com";
var ipaddres = "104.187.119.7";
var localhost = "192.168.1.65";
var port = 6112;

socket = network_create_socket(type);
isConnected = network_connect(socket, localhost, port);


var size = 1024;
var type = buffer_fixed;
var alignment = 1;
buffer = buffer_create(size, type, alignment);
bufferSmall = buffer_create(256, type, alignment);

clientmap = ds_map_create();

Result = 0;
Ping = 2;
MyID = -1;

globalvar debug ;

debug = true;
alarm[0] = 60;

//network events as enumerators
enum networkEvents {
	ping,
	w,
	d,
	s,
	a,
	position,
	connect,
	disconnect
}