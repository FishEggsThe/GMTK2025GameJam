if CheckIfDuplicate() { exit; }

depth = -15;
//numOfHighScores = 0;
//highScores = [];

ifUsing = false;
showScores = true;
numOfScoresShown = 5;

root = "highscores";
listener = ifUsing ? FirebaseFirestore(root).Listener() : -1;
data = [];

sort_score = function(_a, _b) {
	return _b.points - _a.points;
}

addScoreFirebase = function(p, n) {
	var i = min(array_length(data), numOfScoresShown-1);
	if p > data[i] {
		data = [];
		var doc = json_stringify(InitializeScore(p, n));
		FirebaseFirestore(root).Set(doc);
	}
}