if dead {
	friedDeathIndex = (friedDeathIndex + 8/60) % 4;
	exit;
}

moveState();
