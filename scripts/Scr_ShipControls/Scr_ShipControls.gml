function ReadInputs() {
	var turnSide = keyboard_check(ord("A")) - keyboard_check(ord("D"));
	var accelerateInput = keyboard_check(ord("W"));
	var dashInput = keyboard_check_pressed(vk_space);

	if accelerateInput {
		AddSpeed(acceleration)
		engineTimer--;
		if engineTimer <= 0 {
			engineTimer = engineTimerSet;
			var speedPitch = point_distance(x, y, x+xSpeed, y-ySpeed)/maxSpeed;
			PlaySound(Engine_LOOPLESS_WIP, speedPitch);
		}
		
		bubbleTimer++;
		if bubbleTimer % bubbleTimerCap == 0 {
			bubbleTimer -= bubbleTimerCap;
			var shipBehindRadian = degtorad(shipAngle+180);
			var shipBehindOffset = 18;
			var xPos = x + shipBehindOffset*cos(shipBehindRadian);
			var yPos = y - shipBehindOffset*sin(shipBehindRadian);
			Obj_ParticleManager.bubbles(xPos, yPos);
			if dashCooldown <= 0 {
				Obj_ParticleManager.bubbleDashReady(xPos, yPos);
			}
		}
	}

	if dashInput && dashCooldown <= 0 {
		dashCooldown = dashCooldownSet;
		maxShipSpeed = dashSpeed;
		ChangeAnimationState(1);
		Obj_ParticleManager.fireDash(x, y);
	
		AddSpeed(dashSpeed);
	}

	if turnSide != 0 {
		shipAngle += turnSide*turnSpeed;
		shipAngle %= 360;
	}
}
function ApplyInputs() {
	// Updating values to make sense
	var currSpeed = point_distance(x, y, x+xSpeed, y-ySpeed);
	if currSpeed > maxShipSpeed {
		var reducePercent = maxShipSpeed / currSpeed;
		xSpeed *= reducePercent; ySpeed *= reducePercent
	}

	x = (x + xSpeed);
	y = (y + ySpeed);

	maxShipSpeed = lerp(maxShipSpeed, maxSpeed, 0.1);
	if dashCooldown > 0 {
		dashCooldown--;
		//if dashCooldown <= 0 {
		//	instance_create_layer(Obj_PlayerShip.x, Obj_PlayerShip.y, "Particles", Obj_Flash);
		//}
	}

	var checkpoint = instance_place(x, y, Obj_Checkpoint);
	if checkpoint != noone {
		CheckIfNextCheckpoint(checkpoint);
	}
	animationState();

	// For the Rock enemies
	if animationState == dash || animationState == dashSlow {
		var possibleRockEnemy = instance_place(x, y, Obj_RockEnemy);
		if possibleRockEnemy != noone && possibleRockEnemy.canCollide {
			with possibleRockEnemy { setSprite(true); }
		}
	}

	// If you die
	var possibleEnemy = instance_place(x, y, Obj_Enemy)
	if (possibleEnemy != noone && possibleEnemy.canCollide) || place_meeting(x, y, Obj_RaceTrackWalls) {
		ShipDies();
		if possibleEnemy != noone && possibleEnemy.explodeOnDeath {
			instance_create_layer(possibleEnemy.x, possibleEnemy.y, "Instances", Obj_Explosion);
			instance_destroy(possibleEnemy);
			sprite = Spr_PlayerCooked;
			shipAngle = 0;
		} else {
			PlaySound(splat);
			var noseDist = 25; var noseRadius = 10;
			var xNose = x + noseDist * cos(degtorad(shipAngle));
			var yNose = y - noseDist * sin(degtorad(shipAngle));
			if collision_circle(xNose, yNose, noseRadius, Obj_Enemy, true, true) || 
			   collision_circle(xNose, yNose, noseRadius, Obj_RaceTrackWalls, true, true) {
				sprite = Spr_PlayerCarCrash;
			} else {
				sprite = Spr_PlayerExplode;
				//shipAngle = 0;
			}
		}
	}
}

function AddSpeed(magnitude) {
	xSpeed += magnitude*cos(degtorad(shipAngle));
	ySpeed -= magnitude*sin(degtorad(shipAngle));
}

function ShipDies() {
	if dead { return; } // Just making sure lol
	
	dead = true;
	//sprite = Spr_PlayerExplode;
	ShakeScreen(12);
	PlaySound(Death__1_);
	
	//with Obj_HighScoreManager {
	//	showScores = true;
	//	addScoreFirebase(Obj_RaceTrack.lapsCompleted, Obj_Control.playerName);
	//}
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