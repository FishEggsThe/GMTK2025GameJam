event_inherited();

repairState = function(){};
repair = function() {
	repairTime--;
	if repairTime < repairTimeSet*0.15 {
		setShake()
		if playRockReformSound && repairTime <= rockReformSoundLength {
			PlaySound(kcor_nmad_siht_etah_I);
			playRockReformSound = false;
		}
			
	} if repairTime <= 0 { setSprite(false); }
}

sprite = Spr_Rock;
setSprite = function(isBroken) {
	broken = isBroken;
	if isBroken {
		playRockReformSound = true;
		repairState = repair;
		repairTime = repairTimeSet;
		sprite = Spr_RockBreak;
		canCollide = false;
		ShakeScreen(9);
		PlaySound(I_hate_this_damn_rock_the_sequel);
	} else {
		repairState = function(){};
		sprite = Spr_Rock;
		canCollide = true;
		setShake(0);
	}
}

broken = false;
repairTimeSet = 60*16;
repairTime = 0;
playRockReformSound = false;
rockReformSoundLength = audio_sound_length(kcor_nmad_siht_etah_I) * 60 - 10;


//var angle = GetSpawnAngle();
//var units = [cos(degtorad(angle)), -sin(degtorad(angle))];
//var inner = 180 + 30, outer = inner + 300 - 50;
//var radiusPos = random_range(inner, outer);

//x = room_width/2+units[0]*radiusPos;
//y = room_height/2+units[1]*radiusPos;

depth = 120;