event_inherited();

var angle = irandom_range(0, 270) - 45;

var units = [cos(degtorad(angle)), -sin(degtorad(angle))];
var inner = 180 + 30, outer = inner + 300 - 50;
var radiusPos = random_range(inner, outer);

x = room_width/2+units[0]*radiusPos;
y = room_height/2+units[1]*radiusPos;