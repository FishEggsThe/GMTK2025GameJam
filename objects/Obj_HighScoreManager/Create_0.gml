if CheckIfDuplicate() { exit; }

depth = -15;
//numOfHighScores = 0;
//highScores = [];

ifUsing = true;
showScores = true;

root = dotEnv_get("COLLECTION");
listener = ifUsing ? FirebaseFirestore(root).Listener() : -1;
data = [];

sort_score = function(_a, _b) {
	return _b.points - _a.points;
}

addScoreFirebase = function(p, n) {
	data = [];
	var doc = json_stringify(InitializeScore(p, n));
	FirebaseFirestore(root).Set(doc);
}