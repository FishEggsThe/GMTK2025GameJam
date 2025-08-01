if !CheckDebug() { exit; }
//// BUBBLE
//
//// this one spawns tied to the speed
//for(var i = -2; i < 1; i++){
//	if(i != 0){
//		with(instance_create_layer(mouse_x,mouse_y,"Particles",Obj_TrailBubble)){
//			direction += i*60 + 90;
//		}
//	}
//}
//
//// this one spawns at a fixed rate
//with(instance_create_layer(mouse_x,mouse_y,"Particles",Obj_TrailBubble)){
//	image_index = 1;
//}

part_particles_create(global.partSystem,mouse_x,mouse_y,global.partTrailDust,2);