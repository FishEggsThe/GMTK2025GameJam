if !ifUsing { exit; }
if !showScores { exit; }

DrawScoreBackground();
if errorLoading {
	DrawText(room_width/2, room_height/2, "Something went wrong\nshowing the scores...\nsorry", fa_center, fa_middle, c_white, 2, 2);
} else if data == -1 || array_length(data) <= 0 { 
	DrawText(room_width/2, room_height/2, "Fethcing scores...", fa_center, fa_middle, c_white, 2, 2);
} else {
	DrawHighScores();
}

DrawText(room_width, room_height, "Press the DASH button to quit the high scores page", fa_right, fa_bottom, c_white, 2, 2);