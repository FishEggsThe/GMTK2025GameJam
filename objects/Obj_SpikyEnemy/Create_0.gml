event_inherited();


sprite = Spr_Spike;

var angle = point_direction(room_width/2, room_height/2, xLandingPos, yLandingPos)
var units = [cos(degtorad(angle)), -sin(degtorad(angle))];
var inner = 180 + 30, outer = inner + 300 - 65;
startPos = [room_width/2+units[0]*inner, room_height/2+units[1]*inner];
endPos = [room_width/2+units[0]*outer, room_height/2+units[1]*outer];
distances = [endPos[0] - startPos[0], endPos[1] - startPos[1]];

gameCurve = animcurve_get_channel(AnCv_SpikyEnemyMovement, "curve1");

xLandingPos = startPos[0]; yLandingPos = startPos[1];
//var numerator = point_distance(startPos[0], startPos[1], xLandingPos, yLandingPos);
//var denominator = point_distance(startPos[0], startPos[1], endPos[0], endPos[1]);
gamePercent = 0;
//show_debug_message($"{numerator} / {denominator} = {gamePercent}");
gameIncrement = 1/80;