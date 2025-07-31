if CheckDebug() {
	if keyboard_check_released(ord("O")) {
		var p = irandom(100), n = $"testing{p}"
		show_message($"Adding {n}");
		addScoreFirebase(p, n);
	}

	if keyboard_check_released(ord("P")) && data != -1 && array_length(data) > 0 {
		var doc = FirebaseFirestore(root).Child(data[0].id);
		doc.Delete();
		show_message("Removing");
	}
}