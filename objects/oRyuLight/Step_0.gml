/// @description 
if(instance_exists(oRyu)){
	xVelo = oRyu.xVelo;
	yVelo = oRyu.yVelo;
	x =oRyu.x;
	y =oRyu.y;
}else{
	instance_destroy(self)
}

x += xVelo;
y += yVelo;