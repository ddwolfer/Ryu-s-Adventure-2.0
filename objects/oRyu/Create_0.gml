//basic variables
//Movements
event_inherited();
groundAccel = 0.25;
groundFric = 0.18;
airAccel = 0.25;
airFric = 0.1;
xVeloMax = 2.5; //5.5
yVeloMax = 10;
jumpHeight = 7;
gravityNormal = 0.35;
xVelo = 0;
yVelo = 0;

//states
idle = 10;
run = 11;
jumpS = 12;
death = 13;
climb = 14;
Faint = 15;

state = idle;
facing = -image_xscale;

xscale = 1;
yscale = 1;

//environment
blockSize = 16;
control = true;

//coyote time
ledgeJumpTime = 6;
ledgeJumpTimer = ledgeJumpTime;

jumpBufferTime = 6
jumpBufferTimer = 0;

coyoteJump = false;
damaged = false;
hasCheese = false;
teleportImage = false;
canDJump = true;
stopGravity = false;
holdClimb = false;

lastSprite = sprite_index;// make sure animation starts from frame 0

deathSound = false;
//light glow
//instance_create_layer(x, y, "Lighting", oRyuLight);


//--------Dialogue Stuff
//reset_dialogue_defaults();
myPortrait			= -1;
myVoice				= -1;
myFont				= font_add("ChineseDialogue.ttf", 17, false, false, 32, 128);;
myName[0]			= "Ryu";
myName[1]			= "Ryu";

myPortraitTalk		= -1;
myPortraitTalk_x	= 26;
myPortraitTalk_y	= 44;
myPortraitIdle		= -1;
