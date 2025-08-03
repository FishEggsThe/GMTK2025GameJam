var drawScore = "";
if !Obj_Control.playGameIntro && !Obj_MainMenu.currentMenu.extendMenu {
	drawScore = string(playerScore);
	if highScoreReached { drawScore = "+" + drawScore; }
} else {
	drawScore = $"{Obj_Control.playerScore}";
}
DrawSpriteText(drawScore, room_width, room_height, 2, fa_right, fa_bottom, true);