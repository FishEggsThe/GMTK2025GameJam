function AddSpeed(magnitude) {
	xSpeed += magnitude*cos(degtorad(shipAngle));
	ySpeed -= magnitude*sin(degtorad(shipAngle));
}

function ShipDies() {
	dead = true;
	sprite = Spr_PlayerExplode;
	shipAngle = 0;
}