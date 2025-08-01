timeToLapSet = 60*9;
timeToLap = timeToLapSet;
startTimer = !Obj_Control.playGameIntro;
checkpoints = [];
lapsCompleted = 0;
SetupCheckpoints();

// Faces
staring = function() {
	var xEyePos = x + 20*lengthdir_x(1,point_direction(x, y, Obj_PlayerShip.x, Obj_PlayerShip.y));
	var yEyePos = y + 20*clamp(lengthdir_y(1,point_direction(x, y, Obj_PlayerShip.x, Obj_PlayerShip.y)), -1, 0.2);
	DrawSprite(Spr_RaceTrackEye, 0, xEyePos-56, yEyePos-30);
	DrawSprite(Spr_RaceTrackEye, 0, xEyePos+56, yEyePos-30);

	DrawSprite(Spr_RaceTrackNose, 0, x, y);

}
laughing = function() {
	
}

faceState = staring;

if Obj_Control.playGameIntro { StartIntro(); }
else { StartRace(); }