Scriptname tpBulletPressSCRIPT extends ObjectReference

MESSAGE PROPERTY bulletMakerMSG AUTO
INT PROPERTY ammoChoice AUTO HIDDEN

EVENT onACTIVATE(OBJECTREFERENCE akActionRef)

	ammoChoice = bulletMakerMSG.Show()

ENDEVENT