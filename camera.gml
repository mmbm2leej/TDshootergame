//CREATE

cam = camera_create();

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(960,540,1,10000);

camera_set_view_mat(cam,vm);
camera_set_proj_mat(cam,pm);

view_camera[0] = cam;

follow = obj_ship;
xTo = x;
yTo = y;

default_zoom_width = 960;
default_zoom_height = 540;
viewWidth = default_zoom_width;
viewHeight = default_zoom_height;



//STEP

x += (xTo - x)/1.1;
y += (yTo - y)/1.1;

if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}

var targetviewWidth = default_zoom_width * (1 + (obj_ship.speed/obj_ship.topspd));	
var targetviewHeight = default_zoom_height * (1 + (obj_ship.speed/obj_ship.topspd));
viewWidth += (targetviewWidth - viewWidth)/40;
viewHeight += (targetviewHeight - viewHeight)/40;
	

camera_set_view_size(cam,viewWidth,viewHeight);
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(cam,vm);
