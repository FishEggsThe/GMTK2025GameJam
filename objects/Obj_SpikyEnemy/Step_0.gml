event_inherited();

if !startEnemy { exit; }
gamePercent = gamePercent + gameIncrement;
if gamePercent >= 1 || gamePercent <= 0 { gameIncrement = -gameIncrement; }
var position = animcurve_channel_evaluate(gameCurve, gamePercent);

x = startPos[0] + (distances[0] * position);
y = startPos[1] + (distances[1] * position);

spriteImageIndex = (spriteImageIndex+6/60) % 6;