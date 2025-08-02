if CheckDebug() {
	DrawText(0, 0, $"Obj_Control: {instance_number(Obj_Control)}", fa_left, fa_top);
	DrawText(0, 30, $"Obj_Camera: {instance_number(Obj_Camera)}", fa_left, fa_top);
	DrawText(0, 60, $"Obj_Debug: {instance_number(Obj_Debug)}", fa_left, fa_top);
	DrawText(0, 90, $"Obj_HighScoreManager: {instance_number(Obj_HighScoreManager)}", fa_left, fa_top);
	DrawText(0, 120, $"Obj_AudioPlayer: {instance_number(Obj_AudioPlayer)}", fa_left, fa_top);
	DrawText(0, 150, $"Obj_AudioPlayer: {instance_number(Obj_MainMenu)}", fa_left, fa_top);
}