var horizontal = InputPressed(INPUT_VERB.RIGHT) - InputPressed(INPUT_VERB.LEFT);
var confirm = InputPressed(INPUT_VERB.ACCEL);

if confirm {
	if currentOption < numOfLetters {
		theBigThree[currentOption]++;
		theBigThree[currentOption] %= allCharacters;
	} else {
		var pScore = Obj_RaceTrack.playerScore;
		var allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		var name = string_char_at(allowedCharacters, theBigThree[0]+1);
		name += string_char_at(allowedCharacters, theBigThree[1]+1);
		name += string_char_at(allowedCharacters, theBigThree[2]+1);
		show_message($"{name} with score {pScore}");
		//Obj_HighScoreManager.addScoreFirebase(pScore, name);
	}
}

if horizontal != 0 {
	PlaySound(SelectING_2);
	currentOption += horizontal;
	while currentOption >= numOfOptions { currentOption = 0; }
	while currentOption < 0 { currentOption = numOfOptions-1; }
}

