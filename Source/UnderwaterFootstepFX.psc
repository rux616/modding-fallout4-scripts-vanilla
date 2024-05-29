Scriptname UnderwaterFootstepFX extends Actor Const

VisualEffect Property pFootStepSiltE Auto Const


Event OnLoad()
	if Is3dLoaded()

    		pFootStepSiltE.play(self)

    endIf
EndEvent