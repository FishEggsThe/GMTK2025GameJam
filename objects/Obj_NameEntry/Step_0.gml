var horizontal = InputPressed(INPUT_VERB.RIGHT) - InputPressed(INPUT_VERB.LEFT);
var changeLetter = InputPressed(INPUT_VERB.UP) - InputPressed(INPUT_VERB.DOWN);
var confirm = InputPressed(INPUT_VERB.DASH);

if changeLetter != 0 {
	if currentOption < numOfLetters {
		theBigThree[currentOption] += changeLetter;
		while theBigThree[currentOption] >= allCharacters { theBigThree[currentOption] = 0; }
		while theBigThree[currentOption] < 0 { theBigThree[currentOption] = allCharacters-1; }
	}
}

if horizontal != 0 {
	PlaySound(SelectING_2);
	currentOption += horizontal;
	while currentOption >= numOfOptions { currentOption = 0; }
	while currentOption < 0 { currentOption = numOfOptions-1; }
}

if confirm {
	if currentOption >= numOfLetters {
		var pScore = Obj_RaceTrack.playerScore;
		var allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		var name = string_char_at(allowedCharacters, theBigThree[0]+1);
		name += string_char_at(allowedCharacters, theBigThree[1]+1);
		name += string_char_at(allowedCharacters, theBigThree[2]+1);
		show_message($"{name} with score {pScore}");
		with Obj_HighScoreManager {
			//addScoreFirebase(pScore, name);
			allowScoreReading = true;
			showScoresFirebase();
		}
	}
}

