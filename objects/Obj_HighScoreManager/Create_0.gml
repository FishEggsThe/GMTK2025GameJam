CheckIfDuplicate()

depth = -15;
//numOfHighScores = 0;
//highScores = [];

ifUsing = true;
showScores = false;
numOfScoresShown = 5;

errorLoading = false;
allowScoreReading = true;
allowTimerSet = 60*60;
//alarm[0] = allowTimerSet;

root = "highscores";
listener = FirebaseFirestore(root).Listener();
data = [];

sort_score = function(_a, _b) {
	return _b.points - _a.points;
}

addScoreFirebase = function(p, n) {
	var i = numOfScoresShown-1;
	if numOfScoresShown >= array_length(data) || p > data[i] {
		data = [];
		var doc = json_stringify(InitializeScore(p, n));
		FirebaseFirestore(root).Set(doc);
	}
}

showScoresFirebase = function() {
	showScores = true;
	if allowScoreReading {
		allowScoreReading = false;
		alarm[0] = allowTimerSet;
		data = [];
		FirebaseFirestore(root).Query();
	}
}

hideScores = function() {
	showScores = false;
}