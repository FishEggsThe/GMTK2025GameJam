if canRestart {
	if InputPressed(INPUT_VERB.RESTART) {
		room_goto(Rm_Game);
		exit;
	}
}

if dead {
	friedDeathIndex = (friedDeathIndex + 8/60) % 4;
	exit;
}

moveState();
