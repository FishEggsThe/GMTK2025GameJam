var intTime = getTimeInSeconds();
var normalizedTimer = 0.99+(frames-1)*timeToLap/timeToLapSet;

var alpha = CheckDebug() ? 0.5 : 1;
DrawSprite(spr_raceCircle, normalizedTimer, x, y, 1, 1, 0, c_white, alpha);



faceState();
DrawSprite(spr_raceCircleScreen, 0, x, y, 1, 1, 0, c_white, alpha);

//for(var i = 0; i < array_length(checkpoints); i++) {
//	var checkpoint = checkpoints[i];
//	draw_text(checkpoint.x, checkpoint.y, i);
//}

DrawText(0, 0, "Score: " + string(playerScore), fa_left, fa_top, c_white, 2, 2);
DrawText(0, 20, "Laps: " + string(lapsCompleted), fa_left, fa_top, c_white, 2, 2);