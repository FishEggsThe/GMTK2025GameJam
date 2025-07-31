var intTime = ceil(timeToLap/60);
var frames = sprite_get_number(spr_raceCircle);
var normalizedTimer = 0.99+(frames-1)*timeToLap/timeToLapSet;

draw_sprite(spr_raceCircle, normalizedTimer, x, y);

draw_sprite(Spr_RaceTrackFace, 0, x, y);

var xEyePos = x + 10*lengthdir_x(2,point_direction(x, y, Obj_PlayerShip.x, Obj_PlayerShip.y));
var yEyePos = y + 10*lengthdir_y(2,point_direction(x, y, Obj_PlayerShip.x, Obj_PlayerShip.y));
DrawSprite(Spr_RaceTrackEye, 0, xEyePos-56, yEyePos-30);
DrawSprite(Spr_RaceTrackEye, 0, xEyePos+56, yEyePos-30);

DrawSprite(Spr_RaceTrackNose, 0, x, y);

DrawSprite(spr_raceCircleScreen, 0, x, y);

//for(var i = 0; i < array_length(checkpoints); i++) {
//	var checkpoint = checkpoints[i];
//	draw_text(checkpoint.x, checkpoint.y, i);
//}

DrawText(0, 0, "Score: " + string(lapsCompleted), fa_left, fa_top);
DrawText(0, 20, "Time: " + string(intTime), fa_left, fa_top);