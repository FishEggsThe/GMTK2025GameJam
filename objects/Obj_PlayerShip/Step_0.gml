if dead { exit; }

// Checking inputs
var turnSide = keyboard_check(ord("A")) - keyboard_check(ord("D"));
var accelerate = keyboard_check(ord("W"));
var dash = keyboard_check_pressed(vk_space);

if accelerate {
	AddSpeed(acceleration)
}

if dash && dashCooldown <= 0 {
	dashCooldown = dashCooldownSet;
	maxShipSpeed = dashSpeed;
	
	AddSpeed(dashSpeed);
}

if turnSide != 0 {
	shipAngle += turnSide*turnSpeed;
	shipAngle %= 360;
}

// Updating values to make sense
var currSpeed = point_distance(x, y, x+xSpeed, y-ySpeed);
if currSpeed > maxShipSpeed {
	var reducePercent = maxShipSpeed / currSpeed;
	xSpeed *= reducePercent; ySpeed *= reducePercent
}

x = (x + xSpeed);
y = (y + ySpeed);
LoopAroundScreen();

maxShipSpeed = lerp(maxShipSpeed, maxSpeed, 0.1);
if dashCooldown > 0 { dashCooldown--;}

var checkpoint = instance_place(x, y, Obj_Checkpoint);
if checkpoint != noone {
	CheckIfNextCheckpoint(checkpoint);
}

// For the Rock enemies
if dashCooldown > 0 {
	var possibleRockEnemy = instance_place(x, y, Obj_RockEnemy);
	if possibleRockEnemy != noone {
		with possibleRockEnemy { instance_destroy(); }
	}
}

// If you die
if place_meeting(x, y, Obj_Enemy) || place_meeting(x, y, Obj_RaceTrackWalls) {
	ShipDies();
}