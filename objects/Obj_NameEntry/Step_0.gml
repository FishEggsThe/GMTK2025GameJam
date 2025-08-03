var horizontal = InputPressed(INPUT_VERB.RIGHT) - InputPressed(INPUT_VERB.LEFT);
var confirm = InputPressed(INPUT_VERB.ACCEL);

if confirm {
	if currentOption < numOfLetters {
		theBigThree[currentOption]++;
		theBigThree[currentOption] %= allCharacters;
	} else {
		show_message("The score has been sent to the elder loopers");
	}
}

if horizontal != 0 {
	PlaySound(SelectING_2);
	currentOption += horizontal;
	while currentOption >= numOfOptions { currentOption = 0; }
	while currentOption < 0 { currentOption = numOfOptions-1; }
}

