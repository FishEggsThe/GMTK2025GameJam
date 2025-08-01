event_inherited();

sprite = spr_tank_temp;

canShoot = true;
mineBank = [];
totalMines = 2;

var angle = point_direction(room_width/2, room_height/2, xLandingPos, yLandingPos);
var units = [cos(degtorad(angle)), -sin(degtorad(angle))];
var inner = 180 + 30, outer = inner + 300 + 10;
	
xLandingPos = room_width/2+units[0]*outer;
yLandingPos = room_height/2+units[1]*outer;

animateShooting = false;