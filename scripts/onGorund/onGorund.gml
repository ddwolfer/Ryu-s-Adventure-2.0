function onGround() {
	return place_meeting(x, y + 1, oParentSolid) || (place_meeting(x, y + 1, oParentJumpThru ) && !place_meeting(x, y, oParentJumpThru));
}
