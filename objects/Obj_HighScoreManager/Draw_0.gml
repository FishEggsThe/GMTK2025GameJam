if !ifUsing { exit; }
if !showScores { exit; }

if data == -1 || array_length(data) <= 0 { 
	DrawText(room_width/2, room_height/2, "Fethcing scores...", fa_center, fa_middle, c_white, 2, 2);
	exit; 
} else {
	DrawHighScores();
}