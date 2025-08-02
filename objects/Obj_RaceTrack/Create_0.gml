timeToLapSet = 60*9;
timeToLap = timeToLapSet;
startTimer = !Obj_Control.playGameIntro;
checkpoints = [];
lapsCompleted = 0;
playerScore = 0;
SetupCheckpoints();

getTimeInSeconds = function() {
	return ceil(timeToLap/60);
}

// Faces
faceImageIndex = 0;
spawnFaceTimer = 40;
staring = function() {
	DrawSprite(Spr_RaceTrackFace, 0, x, y);
	var xEyePos = x + 20*lengthdir_x(1,point_direction(x, y, Obj_PlayerShip.x, Obj_PlayerShip.y));
	var yEyePos = y + 20*lengthdir_y(1,point_direction(x, y, Obj_PlayerShip.x, Obj_PlayerShip.y));
	DrawSprite(Spr_RaceTrackEye, 0, xEyePos-56, yEyePos-30);
	DrawSprite(Spr_RaceTrackEye, 0, xEyePos+56, yEyePos-30);

	DrawSprite(Spr_RaceTrackNose, 0, x, y);

}
laughing = function() {
	//faceImageIndex = (faceImageIndex+1) % 2;
	faceImageIndex += 2/(spawnFaceTimer+1);
	DrawSprite(Spr_RaceTrackFaceLaughing, faceImageIndex, x, y);
}

faceState = staring;
frames = sprite_get_number(spr_raceCircle);

if Obj_Control.playGameIntro { StartIntro(); }
else { StartRace(); }