speed = random_range(8,16);
angleVar = 0;

var type = choose(1,2,3);
switch(type){
	// white
	case 1:
		image_blend = #ffffff;
		angleVar = 5;
		image_xscale = random_range(0.4,0.8);
		image_yscale = random_range(0.15,0.225);
		speed /= 1.25;
	break
	
	// blue
	case 2:
		image_blend = #0CE6F2;
		angleVar = 45;
		image_xscale = random_range(0.4,1);
		image_yscale = random_range(0.25,0.5);
	break

	// darker blue
	case 3:
		image_blend = #0098DB;
		angleVar = 90;
		image_xscale = random_range(0.9,1.2);
		image_yscale = random_range(0.4,0.75);
	break
}
depth = type;
speed /= type;

// replace all obj_directionguy with (the player's angle + 180)
direction = (Obj_PlayerShip.shipAngle+180)+random_range(angleVar,-angleVar);
image_angle = direction;