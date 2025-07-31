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
		draw_text(xPos, yInc, "- High Scores -");
			
	var i = 0, len = array_length(data);
	while(i < 5 && i < len) {
		var n = data[i].name, p = data[i].points;
		draw_text(xPos, yInc*(i+2), string(display, n, p));
		i++;
	}
}