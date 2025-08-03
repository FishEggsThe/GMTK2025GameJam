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

DrawSpriteText(string(playerScore), room_width, room_height, 2, fa_right, fa_bottom, true);