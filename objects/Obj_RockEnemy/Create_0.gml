event_inherited();

repairState = function(){};
repair = function() {
	repairTime--;
	if repairTime <= 0 {
		setSprite(false);
	}
}

sprite = spr_rock_temp;
setSprite = function(isBroken) {
	broken = isBroken;
	if isBroken {
		repairState = repair;
		repairTime = repairTimeSet;
		sprite = spr_rockBreak_temp;
		canCollide = false;
		ShakeScreen(9);
		PlaySound(Rock);
	} else {
		repairState = function(){};
		sprite = spr_rock_temp;
		canCollide = false;
	}
}

broken = false;
repairTimeSet = 60*16;
repairTime = 0;

var angle = GetSpawnAngle();
var units = [cos(degtorad(angle)), -sin(degtorad(angle))];
var inner = 180 + 30, outer = inner + 300 - 50;
var radiusPos = random_range(inner, outer);

x = room_width/2+units[0]*radiusPos;
y = room_height/2+units[1]*radiusPos;

depth = 10;