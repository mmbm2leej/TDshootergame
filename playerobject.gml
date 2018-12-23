//CREATE

turn_accel = 1;
newdircorrectionspd = 5;
default_turnspd = 2;
turnspd = default_turnspd;

velocity = 0;
shipfrictioncoeff = 0.98;
topspd = 12;
acceleration = 0.1;
deceleration = 0.4;



//STEP

key_forward = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_brake = keyboard_check(ord("S"));

//moving

if (key_forward) {
	if (direction != image_angle) {
	direction += sin(degtorad(image_angle - direction))*newdircorrectionspd;	
	}
	if (velocity < topspd) {
		velocity += acceleration;
	} else velocity = topspd;
} else {
	if (velocity > 0) {
		velocity -= deceleration;
	} else velocity = 0;
}

if (velocity == 0) {
	if (speed > 0.3) {
		speed *= shipfrictioncoeff;
	} else {
		speed = 0; 
		direction = image_angle;
	}
}
if (speed < topspd) {
	speed += velocity;
} else speed = topspd;

//strafing (commented out when was for turning)
/*
if (key_left) {
		
	
}
*/

//mouse turn
var pointdir = point_direction(id.x,id.y,mouse_x,mouse_y);
if (image_angle != pointdir) {
	image_angle += (sin(degtorad(pointdir - image_angle)) * turnspd);
}

