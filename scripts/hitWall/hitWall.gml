function hitWall() {
	return place_meeting(x + 1, y, oParentSolid) || place_meeting(x - 1, y, oParentSolid)
}
