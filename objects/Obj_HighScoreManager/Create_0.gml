CheckIfDuplicate()

depth = -15;
//numOfHighScores = 0;
//highScores = [];

ifUsing = true;
showScores = false;
numOfScoresShown = 5;

errorLoading = false;
allowScoreReading = false;
allowTimerSet = 10*60;
alarm[0] = allowTimerSet;

root = "highscores";
listener = ifUsing ? FirebaseFirestore(root).Listener() : -1;
data = [];

sort_score = function(_a, _b) {
	return _b.points - _a.points;
}

addScoreFirebase = function(p, n) {
	var i = numOfScoresShown-1;
	var conditionA = numOfScoresShown >= array_length(data);
	var conditionB = p > data[min( i, array_length(data)-1 )].points; // DOT POINTS!!!! ADD DOT POINTS!!!!!!!!!!!!!!!!!!!!!!!!
	
	//show_message($"{conditionA} or {conditionB} is {conditionA || conditionB}")
	if conditionA || conditionB {
		//show_message($"{p} vs. {data[(min( i, array_length(data)-1 ))]}")
		data = [];
		var doc = json_stringify(InitializeScore(p, n));
		FirebaseFirestore(root).Set(doc);
	}
}

showScoresFirebase = function(forceRead = false) {
	showScores = true;
	if allowScoreReading || forceRead {
		allowScoreReading = false;
		alarm[0] = allowTimerSet;
		data = [];
		FirebaseFirestore(root).Query();
	}
}

hideScores = function() {
	showScores = false;
}