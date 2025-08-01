/////////////////////////////////////////////////////////
//                                                     //
//  READ THE COMMENTS I LEAVE!  IT'S RELEVANT STUFF!!  //
//                                                     //
//    -Ian                                       :P    //
//                                                     //
/////////////////////////////////////////////////////////
// you can feel free to get rid of some later if you want
// and if you ever have question, feel free to ask me :3
// like, actually, ask me.


// PARTICLE SYSTEM STUFF

// make the "Particles" layers on rooms that use such particles
global.partSystem = part_system_create_layer("Particles",true);

// another system in case you want to prioritize certain effects over others:
//  global.partSystemAlt = part_system_create_layer("ParticlesAlt",true);

// one thing to note is that the "true" makes sure you can use the global variable at any time, basically


// PARTICLE STUFF

// just setting up particle types
global.partConfettiR = part_type_create();
global.partConfettiL = part_type_create();
global.partTrailDust = part_type_create();
global.partTrailGhost = part_type_create();

// confetti stuff
// confetti that goes to the right
part_type_direction(global.partConfettiR,45,90,0,0);
part_type_orientation(global.partConfettiR,0,359,-2,0,0);
part_type_size(global.partConfettiR,0.5,1,-0.01,0);
part_type_speed(global.partConfettiR,3,8,-0.05,0);
part_type_gravity(global.partConfettiR,0.15,-90);
part_type_sprite(global.partConfettiR,Spr_Confetti,false,false,true);
// confetti that goes to the left
part_type_direction(global.partConfettiL,135,90,0,0);
part_type_orientation(global.partConfettiL,0,359,2,0,0);
part_type_size(global.partConfettiL,0.5,1,-0.01,0);
part_type_speed(global.partConfettiL,3,8,-0.05,0);
part_type_gravity(global.partConfettiL,0.15,-90);
part_type_sprite(global.partConfettiL,Spr_Confetti,false,false,true);

// the dust enemy's trail
part_type_size(global.partTrailDust,0.8,1.2,-0.01,0);
part_type_direction(global.partTrailDust,0,359,0,45);
part_type_speed(global.partTrailDust,0.5,0.5,0,0);
part_type_sprite(global.partTrailDust,Spr_DustMite,false,false,true);

// the ghost enemy's trail
part_type_size(global.partTrailGhost,1,1,-0.034,0);
part_type_sprite(global.partTrailGhost,Spr_Circle,false,false,false);

bubblesParticles = function(_x, _y) {
	for(var i = -2; i < 1; i++){
		if(i != 0){
			with(instance_create_layer(_x,_y,"Particles",Obj_TrailBubble)){
				direction += i*60 + 90;
			}
		}
	}

	//// this one spawns at a fixed rate
	with(instance_create_layer(_x,_y,"Particles",Obj_TrailBubble)){
		image_index = 1;
	}
}
fireParticles = function(_x, _y) {
	instance_create_layer(_x,_y,"Particles",Obj_FireDash)
}