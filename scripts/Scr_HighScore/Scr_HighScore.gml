function InitializeScore(p, n) {
	var s = {
		points: p,
		name: n
	};
	return s;
}

function DrawHighScores() {
	
	var xPos = room_width/2, yInc = room_height/8,
		display = "{0}: {1}";
		DrawText(xPos, yInc, "- High Scores -", 
			fa_center, fa_middle, c_white, 2, 2);
			
	var i = 0, len = array_length(data);
	while(i < numOfScoresShown && i < len) {
		var n = data[i].name, p = data[i].points;
		DrawText(xPos, yInc*(i+2), string(display, n, p), 
				fa_center, fa_middle, c_white, 2, 2);
		i++;
	}
}

function DrawScoreBackground() {
	draw_sprite_ext(Msk_Checkpoint, 0, room_width/2, room_height/2, 25, 20, 0, c_gray, 0.5);
}