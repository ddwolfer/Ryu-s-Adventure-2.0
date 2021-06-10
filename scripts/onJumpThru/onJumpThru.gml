//////////actually jump through
function onJumpThru() {
	return (place_meeting(x, y + 1, oParentJumpThru ) && !place_meeting(x, y, oParentJumpThru));
}
