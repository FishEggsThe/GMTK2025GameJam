function AddSpeed(magnitude) {
	xSpeed += magnitude*cos(degtorad(shipAngle));
	ySpeed -= magnitude*sin(degtorad(shipAngle));
}

function ShipDies() {
	dead = true;
	sprite = Spr_PlayerExplode;
	shipAngle = 0;
}

function ChangeAnimationState(index) {
	switch(index) {
		case 1:
			animationState = dash;
			sprite = Spr_PlayerDash;
			break;
		case 2:
			animationState = dashSlow;
			sprite = Spr_PlayerDash_Unstretched;
			break;
		case 3:
			animationState = dashStopped;
			sprite = Spr_PlayerUnDash;
			break;
		default:
			animationState = regular;
			sprite = Spr_PlayerFish;
	}
}