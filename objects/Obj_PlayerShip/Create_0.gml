CheckIfDuplicate();

xSpeed = 0;
ySpeed = 0;

shipAngle = 0;
turnSpeed = 4;

acceleration = 0.2;
maxSpeed = 5;
maxShipSpeed = maxSpeed;

dashSpeed = 13;
dashCooldownSet = 60;
dashCooldown = 0;

dead = false;

sprite = Spr_PlayerFish;
regular = function() {
	// Nothing
}
dash = function() {
	var threshold = lerp(maxSpeed, dashSpeed, 0.25);
	if maxShipSpeed <= threshold {
		ChangeAnimationState(2);
	}
}
dashSlow = function() {
	var threshold = lerp(maxSpeed, dashSpeed, 0.05);
	if maxShipSpeed <= threshold { ChangeAnimationState(3); }
}
dashStopped = function() {
	if maxShipSpeed <= maxSpeed+0.01 { ChangeAnimationState(0); }
}
animationState = regular;
bubbleTimerCap = 6;
bubbleTimer = 0;

engineTimerSet = 4;
engineTimer = engineTimerSet;

friedDeathIndex = 0;

moveState = function(){};
moving = function() {
	ReadInputs();
	ApplyInputs();
}

depth = -10