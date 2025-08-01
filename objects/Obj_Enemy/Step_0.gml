if !startEnemy {
	var increment = 1/60;
	var xDistance = xLandingPos - xStartingPos;
	var yDistance = yLandingPos - yStartingPos;
	percent = percent + increment;
	if percent >= 1 || percent <= 0 { increment = -increment; }
	var yPosition = 100*animcurve_channel_evaluate(curve, percent);

	x = xStartingPos + (percent * xDistance);
	y = yStartingPos + (percent * yDistance - yPosition);
	
	if percent >= 1 {
		startEnemy = true;
		canCollide = true;
	}
	exit;
}