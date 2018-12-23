//CREATE

topspd = 10;
turn_accel = 1;
newdircorrectionspd = 3;
default_turnspd = 2;
turnspd = default_turnspd;
idleturning = false;
idlemoving = false;

velocity = 0;
shipfrictioncoeff = 0.98;
acceleration = 0.1;
deceleration = 0.4;

state = ENEMYSTATE.idle;
myhealthmax = 12;
myhealth = myhealthmax;
mydamage = 2;

idletimermax = 300;
idletimer = idletimermax;

//RANGES
idlerange = 50;
chaserange = 20;
newangle = 0;
speedmult = 1;



//STEP

#region state switcher

if (myhealth > (0.2 * myhealthmax)) {
	if (distance_to_object(obj_ship) > idlerange) {
		state = ENEMYSTATE.idle;
	} else if (distance_to_object(obj_ship) > chaserange) {
		state = ENEMYSTATE.chase;
	} else state = ENEMYSTATE.combat;
} else state = ENEMYSTATE.flee;

#endregion

#region idle state
//When state is idle
if (state = ENEMYSTATE.idle) {
	
	if ((!idleturning) && (!idlemoving)) {
	idletimer--;
	}
	
	if (idletimer < 0) {
		velocity = 0;
		if (speed > 0) {
			var myidlechoice = choose(0,2);
		} else {
			var myidlechoice = choose(0,1,2);
		}
		if ((myidlechoice == 0) && (!idleturning)) {
			newangle = abs(random(359)-image_angle);
			idleturning = true;
		} else if ((myidlechoice == 1) && (!idlemoving)) {
			speedmult = choose(0.1,0.2,0.4);
			idlemoving = true;
		}
	}
	
	if (idleturning) {
		var anglediff = (newangle - image_angle);
		if (anglediff > 5) {
			image_angle += (sin(degtorad(anglediff)));
			turnspd += turn_accel;
		} else {
			idletimer = idletimermax;
			turnspd = default_turnspd;
			idleturning = false;
		}
	}
	
	if (idlemoving) {
		if (velocity < (speedmult * topspd)) {
			velocity += acceleration;
		} else {
			velocity = speedmult * topspd;
			idletimer = idletimermax;
			idlemoving = false;
		}
	}
}

#endregion

#region chase state


#endregion

#region combat state


#endregion

#region flee state



#endregion

#region Collision by player shot



#endregion

#region These happen regardless of state

//translating velocity into speed
if ((velocity > 0) && (speed < velocity)) {
	speed += velocity;
} else speed = velocity;
	


//apply friction when not actively moving
if (velocity < speed) {
	speed *= shipfrictioncoeff;
} else speed = velocity;

//direction correction
if (direction != image_angle) {
	direction += (sin(degtorad(image_angle - direction)) * turnspd);
}

#endregion
