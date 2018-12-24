targetx = mouse_x;
targety = mouse_y;
targdir = point_direction(id.x,id.y,targetx,targety);
if (image_angle != targdir) {
	image_angle += sin(degtorad(targdir - image_angle));	
	
}
