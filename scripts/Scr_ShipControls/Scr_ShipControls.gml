function AddSpeed(magnitude) {
	xSpeed += magnitude*cos(degtorad(shipAngle));
	ySpeed -= magnitude*sin(degtorad(shipAngle));
}

function ShipDies() {
	if dead { return; } // Just making sure lol
	
	dead = true;
	sprite = Spr_PlayerExplode;
	shipAngle = 0;
	ShakeScreen(12);
	PlaySound(Death__1_);
	
	with Obj_HighScoreManager {
		showScores = true;
		addScoreFirebase(Obj_RaceTrack.lapsCompleted, Obj_Control.playerName);
	}
}

function ChangeAnimationState(index) {
	switch(index) {
		case 1:
			animationState = dash;
			sprite = Spr_PlayerDash2;
			PlaySound(Dash_Fish2);
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
			PlaySound(Dash_Recharge__2_);
			animationState = regular;
			sprite = Spr_PlayerFish;
	}
}