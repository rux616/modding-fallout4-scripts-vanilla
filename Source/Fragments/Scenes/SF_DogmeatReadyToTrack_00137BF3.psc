;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DogmeatReadyToTrack_00137BF3 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
debug.trace("MQ106inv: Attempt animation when clue is found.")
debug.trace("   			dist 	= "+player.getActorRef().getDistance(dogmeat.getActorRef()))
debug.trace("			heading	= "+player.getActorRef().getHeadingAngle(dogmeat.getActorRef()))
debug.trace("			LoS?	= "+player.getActorRef().HasDetectionLOS(dogmeat.getActorRef()))

if player.getActorRef().getDistance(dogmeat.getActorRef()) < 512
	if (player.getActorRef().getHeadingAngle(dogmeat.getActorRef())) > 0.0 && player.getActorRef().HasDetectionLOS(dogmeat.getActorRef())
		if player.getActorRef().playIdleWithTarget(dogmeatPairedAnim, Dogmeat.getActorRef())
			debug.trace(self + "Dogmeat/Player face-to-face anim SUCCESSFUL")
		Else
		  debug.trace(self + "Dogmeat/Player anim FAILED")
		EndIf
	else
		if player.getActorRef().playIdleWithTarget(dogmeatPairedAnimSidebySide, dogmeat.getActorRef())
	  		debug.trace(self + "Dogmeat/Player side-by-side anim SUCCESSFUL")
		Else
		  debug.trace(self + "Dogmeat/Player anim FAILED")
		EndIf
	endif
else
	debug.trace("Dogmeat too far away; play scene but skip the animation")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
dogmeat.getActorRef().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property dogmeatPairedAnim Auto Const

ReferenceAlias Property Dogmeat Auto Const

ReferenceAlias Property Player Auto Const

Idle Property dogmeatPairedAnimSidebySide Auto Const
