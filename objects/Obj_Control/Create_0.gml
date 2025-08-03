CheckIfDuplicate();

playerNameCode = [0, 0, 0];
playerName = "AAA";
playerScore = 0;
playGameIntro = true;

singleButton = false;

inGhostGauntlet = false;

directory = working_directory;
saveFileName = "savedatadonottouch.txt"
//fileName = directory + saveFileName
fileName = saveFileName
//show_message(fileName);


setScore = function() {
	try {
		var file;
		file = file_text_open_write(fileName);
		file_text_write_string(file, string(playerScore));
		file_text_close(file);
	} catch(_exception) {
		show_debug_message("oh well, so sad, don't care");
		playerScore = "0";
	}
}

getScore = function() {
	try {
		if !file_exists(fileName) {
			setScore();
		}
	
		var file;
		file = file_text_open_read(fileName);
		var savedScore = file_text_read_string(file);
		playerScore = real(savedScore);
		file_text_close(file);
	} catch(_exception) {
		show_debug_message("oh well, so sad, don't care");
		playerScore = "0";
	}
}