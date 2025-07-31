var intTime = ceil(timeToLap/60);
var frames = sprite_get_number(spr_raceCircle);

draw_sprite(spr_raceCircle, frames-min(intTime+1, frames), x, y);
draw_sprite(spr_raceCircleScreen, 0, x, y);

//for(var i = 0; i < array_length(checkpoints); i++) {
//	var checkpoint = checkpoints[i];
//	draw_text(checkpoint.x, checkpoint.y, i);
//}

draw_text(0, 0, "Score: " + string(lapsCompleted));
draw_text(0, 20, "Time: " + string(intTime));