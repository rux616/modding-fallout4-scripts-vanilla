Scriptname abDeathclawClawsSCRIPT extends ActiveMagicEffect



EVENT OnDying(ACTOR akKiller)
	actor target = self.GetTargetActor()

	target.Dismember("Torso", TRUE, TRUE, TRUE)
	; target.Dismember("Head1", TRUE, TRUE)
	; target.Dismember("Eye", TRUE, TRUE)
	; target.Dismember("LookAt", TRUE, TRUE)
	; target.Dismember("Fly Grab", TRUE, TRUE)
	; target.Dismember("Head2", TRUE, TRUE)
	; target.Dismember("LeftArm1", TRUE, TRUE)
	; target.Dismember("LeftArm2", TRUE, TRUE)
	; target.Dismember("RightArm1", TRUE, TRUE)
	; target.Dismember("RightArm2", TRUE, TRUE)
	; target.Dismember("LeftLeg1", TRUE, TRUE)
	; target.Dismember("LeftLeg2", TRUE, TRUE)
	; target.Dismember("LeftLeg3", TRUE, TRUE)
	; target.Dismember("RightLeg1", TRUE, TRUE)
	; target.Dismember("RightLeg2", TRUE, TRUE)
	; target.Dismember("RightLeg3", TRUE, TRUE)
	; target.Dismember("Brain", TRUE, TRUE)
	; target.Dismember("Weapon", TRUE, TRUE)
	; target.Dismember("Root", TRUE, TRUE)
	; target.Dismember("COM", TRUE, TRUE)
	; target.Dismember("Pelvis", TRUE, TRUE)
	; target.Dismember("Camera", TRUE, TRUE)
	; target.Dismember("Offset Root", TRUE, TRUE)
	; target.Dismember("Left Foot", TRUE, TRUE)
	; target.Dismember("Right Foot", TRUE, TRUE)
	
;	utility.wait(5)

;	target.disable()

ENDEVENT