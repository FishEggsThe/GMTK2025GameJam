if !startEnemy {
	var increment = 1/60;
	var xDistance = xLandingPos - room_width/2;
	var yDistance = yLandingPos - room_height/2;
	percent = percent + increment;
	if percent >= 1 || percent <= 0 { increment = -increment; }
	var yPosition = 100*animcurve_channel_evaluate(curve, percent);

	x = room_width/2 + (percent * xDistance);
	y = room_height/2 + (percent * yDistance - yPosition);
	
	if percent >= 1 { startEnemy = true; }
	exit;
}