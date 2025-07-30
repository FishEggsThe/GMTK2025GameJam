event_inherited();

angle = irandom(360);

curve = animcurve_get_channel(AnCv_SpikyEnemyMovement, "curve1");
percent = 0;
increment = 1/60;

var units = [cos(degtorad(angle)), -sin(degtorad(angle))];
var inner = 180 + 30, outer = inner+300 - 50;
startPos = [room_width/2+units[0]*inner, room_height/2+units[1]*inner];
endPos = [room_width/2+units[0]*outer, room_height/2+units[1]*outer];
distances = [endPos[0] - startPos[0], endPos[1] - startPos[1]];