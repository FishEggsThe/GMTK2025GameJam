var positions = [[room_width/5, room_height/2],
				 [room_width/2, room_height/5],
				 [room_width*4/5, room_height/2],
				 [room_width/2, room_height*4/5]]

var allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890+";

DrawScoreBackground();
DrawSpriteText("New\nHigh\nScore", room_width/2, room_height/2, 1, fa_center, fa_middle);
for(var i = 0; i < numOfOptions; i++) {
	var selected = currentOption == i;
	if i < numOfLetters {
		var char = string_char_at(allowedCharacters, theBigThree[i]+1);
		DrawSpriteText(char, positions[i][0], positions[i][1], 2, fa_center, fa_middle, selected);
		if selected
			DrawSprite(Spr_NoDogsSelect, 0, positions[i][0], positions[i][1], 2, 2);
	} else {
		DrawSpriteText("Submit", positions[i][0], positions[i][1], 2, fa_center, fa_middle, selected);
	}
}