if CheckIfDuplicate() { exit; }

depth = -15;
//numOfHighScores = 0;
//highScores = [];

ifUsing = false;
showScores = false;

root = dotEnv_get("COLLECTION");
listener = ifUsing ? FirebaseFirestore(root).Listener() : -1;
data = [];

sort_score = function(_a, _b) {
	return _b.points - _a.points;
}

addScoreFirebase = function(p, n) {
	if ifUsing {
		data = [];
		var doc = json_stringify(InitializeScore(p, $"{n}{irandom(100)}"));
		FirebaseFirestore(root).Set(doc);
	}
}