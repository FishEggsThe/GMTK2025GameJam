image_speed = 0;
// multiply this 
speed = random_range(4,8);
var angleVar = 0;
switch(image_index){
	// smal bble
	case 0:
		angleVar = 11.25;
	break
	
	// biiggg bubble
	case 1:
	break
}
// replace all obj_directionguy with (the player's angle + 180)
direction = (Obj_PlayerShip.shipAngle+180)+random_range(angleVar,-angleVar);
image_angle = direction;