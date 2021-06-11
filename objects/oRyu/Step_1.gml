var onGroundPrev = onGround;

event_inherited();

if(onGround && !onGroundPrev){
	repeat(4){
		instance_create(x + random_range(-8, 8), y + 15 + random_range(-2, 2), oParticle);
	}
	var randomSound = irandom_range(0, 2);
	if(randomSound == 0) audio_play_sound(sdFootStep1, 1, false);
	else if(randomSound == 1) audio_play_sound(sdFootStep2, 1, false);
	else if(randomSound == 2) audio_play_sound(sdFootStep3, 1, false);
	xscale = 1.33;
	yscale = 0.85;
}