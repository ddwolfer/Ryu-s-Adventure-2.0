//get input 
getInput();

var tempAccel, tempFric

//Movement acceleration
if(onGround){
	tempAccel = groundAccel;
	tempFric = groundFric;
	ledgeJumpTimer = ledgeJumpTime; //coyote time 
	canDJump = true;
	holdClimb = false;     ///climbing
} else{
	tempAccel = airAccel;
	tempFric = airFric;
	ledgeJumpTimer--;  //coyote time 
}

if(control){
	//Handle gravity

	if(!onGround && state!=climb){
		yVelo = approach(yVelo, yVeloMax, gravityNormal);
	}

	if(!onJumpThru()){
		if(left ){
			facing = 1;
			state = run;
			//Apply acceleration left
			if(xVelo > 0) xVelo = approach(xVelo, 0, tempFric);
			xVelo = approach(xVelo, -xVeloMax, tempAccel);
		}else if(right ){
			facing = -1;
			state = run;
			//Apply acceleration right
			if(xVelo < 0) xVelo = approach(xVelo, 0, tempFric);
			xVelo = approach(xVelo, xVeloMax, tempAccel);	
		 }
		//Friction
		if(!right && !left){
			//xVelo = approach(xVelo, 0, tempFric);
			state = idle;
		}
	} else if(onGround){  //Moving Platform
		var tempPlatform = instance_place(x, y + 1, oParentJumpThru);
		if(!right && !left) {
			if(tempPlatform != noone){
				xVelo = tempPlatform.SpeedX * tempPlatform.DirX;
				//yVelo = tempPlatform.SpeedY * tempPlatform.DirY;
			}
			state = idle;
		}
		else if(left){
			facing = 1;
			state = run;
			//Apply acceleration left
			if(xVelo > 0) xVelo = approach(xVelo, 0, tempFric);
			xVelo = approach(xVelo, -xVeloMax, tempAccel);
		}else if(right){
			facing = -1;
			state = run;
			//Apply acceleration right
			if(xVelo < 0) xVelo = approach(xVelo, 0, tempFric);
			xVelo = approach(xVelo, xVeloMax, tempAccel);
		 }
		 yVelo = tempPlatform.SpeedY * tempPlatform.DirY; //handle Y speed of the moving platform
	}
	
	#region //climb Ladder
	if(state == climb){
		if(right) facing = -1;   //for teleport
		else if(left) facing = 1;
	}
	if(place_meeting(x,y,oLadder)){ 
		if(place_meeting(x,y+1,oParentSolid)){  //when Ryu on the ground, stop hold climb
			holdClimb = false;
		}
		if(holdClimb){ //if you still on the ladder, hold the state
			state = climb;
			canDJump = true;           //can double jump after leave ladder
			var tempLadder = instance_place(x,y,oLadder); //Lock RyuX to the center of ladder
			x = tempLadder.x;
			image_speed = 0;
			if(jump && (left || right) ){
				state = jumpS;
				holdClimb = false;
				yVelo = -jumpHeight * 0.75;
			}
		}

		//var tempLadder = instance_place(x,y,oLadder); //Lock RyuX to the center of ladder

		if(up){
			state = climb;
			holdClimb = true;
		    y -= 1;
			image_speed = 0.35;
		}
		else if (down && !place_meeting(x,y+1,oParentSolid)){ //can't down when you on the ground
			state = climb;
			holdClimb = true;
			y += 1;
			image_speed = 0.35;
		}
	}else if (down && place_meeting(x,y+8,oLadder)){ //if have ladder under the JumpTru
		state = climb;
		y = y+12;
		image_speed = 0.35;
	}
	#endregion
	
	#region//Jump
	if(jump){
		jumpBufferTimer = jumpBufferTime;
	}else if (jumpRelease && state!=climb) {  //control jump height
	    if (yVelo < 0)
	        yVelo *= 0.25;
	}
	
	if(!onGround && state!=climb && ledgeJumpTimer <= 0) {  //double jump
		state = jumpS;
		if(jump && canDJump && oRyuController.abilityDJump && !place_meeting(x,y,oLadder)){    //can double jump after collect scroll
			 yVelo = -jumpHeight * (2 / 3);
			 canDJump = false;
			 //instance_create(x , y + 12, oJumpEffect);
			 //audio_play_sound(sdJump, 2, false);
		}
	}//Particles
	//else if (random(100) > 85 && abs(xVelo) > 0.5 && !onMovingPlatform) instance_create(x, y + 8, oParticle);
	#endregion

	#region //squash and stretch
	xscale = approach(xscale, 1, 0.05);
	yscale = approach(yscale, 1, 0.05);
	#endregion
	
	#region //open locker
	if(action && (oRyuController.keyCount > 0) && (place_meeting(x + blockSize, y, oLocker) || place_meeting(x - blockSize, y, oLocker))){
		instance_destroy(oLocker);
		oRyuController.keyCount--;
	}
	#endregion
	
	#region //touch spikes
	if(place_meeting(x, y, oParentHazards) && (!damaged)){
		alarm[11] = 20; //set a timer for the death animation to finish
		state = death;
		audio_play_sound(sdDeath, 3, false);
		control = false;
		damaged = true;
		addScreenShake(6, 10);
	}
	#endregion
	
	#region //out of camera in auto scroll levels
	/*if(instance_exists(oAutoRightCamera)){
		var CameraX = camera_get_view_x(view_camera[0]);
		var CameraY = camera_get_view_y(view_camera[0]);
		var maxCameraX = CameraX + camera_get_view_width(view_camera[0]);
		var maxCameraY = CameraY + camera_get_view_height(view_camera[0]);
		if(x < CameraX){
			alarm[11] = 20; //set a timer for the death animation to finish
			audio_play_sound(sdDeath, 3, false);
			state = death;
			control = false;
		}
		if(y > maxCameraY){
			alarm[11] = 20; //set a timer for the death animation to finish
			audio_play_sound(sdDeath, 3, false);
			state = death;
			control = false;
		}
	}*/
	#endregion
	
	#region //coyote time
	if(jumpBufferTimer > 0){
		coyoteJump = true
	}else{
		coyoteJump = false;
	}
	
	if(coyoteJump){
		if(onGround || ledgeJumpTimer > 0){
			audio_play_sound(sdJump, 3, false);
			yVelo = -jumpHeight;
	        yscale = 1.33;
	        xscale = 0.67;
			ledgeJumpTimer = 0;
			jumpBufferTimer = 0
		}
		jumpBufferTimer--;
	}
	#endregion
	
	#region //Boomerang
	if(action && oRyuController.abilityTP){ //&& !instance_exists(obj_textbox)){  //Can teleport after coolect the scroll
		if(!instance_exists(oTeleport)){
			instance_create_layer(x, y-1, "MainEntities", oTeleport);
		}
		if(instance_exists(oTeleport)){
			var RyutempX = x;
			if(abs(oTeleport.x - RyutempX) > 1){								//fix can't shoot bug
				x = oTeleport.x;
				
				if(place_meeting(oTeleport.x,oTeleport.y+1,oParentSolid)){			//fix foot stuck in wall bug
					y = oTeleport.y-12;
				}else if(place_meeting(oTeleport.x,oTeleport.y-1,oParentSolid)){	//fix head stuck in wall bug
					y = oTeleport.y+12;
				}else{																//normal teleport
					y = oTeleport.y;
				}
				
				instance_destroy(oTeleport);
				//instance_create(x, y, oTeleportEffect);
				//audio_play_sound(sdTeleport, 2, false);
				//holdClimb = false; ///climbing
			}
		}
	}
	#endregion
	
	#region //enemies
	/*if(place_meeting(x, y + 6, oParentEnemies) && yVelo > 0){   //under my feet and velo should be positive
		//var enemy = instance_place(x, y + 6, oParentEnemies);
		//instance_destroy(enemy);
		if(jumpHold || jump || jumpRelease){  //to jump high when stomp on enemy
			yVelo = -jumpHeight
		}else{
			yVelo = -jumpHeight / 2;
		}
	}else if(place_meeting(x, y , oParentEnemies) && yVelo <= 0){
		alarm[11] = 20; //set a timer for the death animation to finish
		audio_play_sound(sdDeath, 3, false);
		state = death;
		control = false;
	}*/
	#endregion


	
}//end of control

//warp transitions
/*var warp = instance_place(x, y, oWarp);
if(warp != noone){
	with(oGame){
		targetRoom = warp.targetRoom;
		if(!warp.instant){
			if(oRyu.up){
				doTransition = true;
				if(oRyu.hasCheese) {
					oRyuController.cheeseCount++;
					oRyu.hasCheese = false;
				}
			}
		}else if(warp.instant){
			doTransition = true;
		}
	}
}*/


//show_debug_message(state);
//show_debug_message(ledgeJumpTimer);

