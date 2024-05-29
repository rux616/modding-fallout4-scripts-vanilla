Scriptname Inst302QuestScript extends Quest Conditional

Int Property PlayerInCharge Auto Conditional

Int Property B2State Auto Conditional

Int Property F6State Auto Conditional

Int Property Y9State Auto Conditional

Int Property Z3State Auto Conditional

Bool Property DoneWithSynths Auto Conditional

Function UpdateSynthStatus()


;if any synth has been set free, start scene that will lead to combat
	if SynthsFreed > 0
		Inst302Stage60CourserFreedSynth.Start()
	endif


;if all synths have been neutralized, set stage 90
	if B2State==1
		if F6State ==1 
			if Y9State == 1
				if Z3State == 1
					if SynthsKilled < 2
						SetStage(90)
						DoneWithSynths=True
					endif
				endif
			endif
		endif
	endif

;if we've captured 3 but killed 1, still allow success
;	if SynthsReturned == 3 && SynthsKilled == 1
;		SetStage(90)
;	endif

;Run one last check to see if everyone has been dealt with

if SynthsReturned + SynthsKilled + SynthsFreed >= 4
	DoneWithSynths=True
	if IsObjectiveDisplayed(60)
		SetObjectiveCompleted(60)
	endif
	if IsObjectiveDisplayed(110)
		SetObjectiveCompleted(110)
	endif
endif


endFunction

Function TeleportShaun()


;handle moving shaun back into the interior if player bails on Institute
InstituteMapMarker.Disable()
(Shaun.GetReference() as teleportactorscript).TeleportOut()
RegisterForCustomEvent((Shaun.GetReference() as teleportactorscript), "TeleportDone")



EndFunction


Event TeleportActorScript.TeleportDone(TeleportActorScript akSender, Var[] akArgs)

if akSender==Shaun.GetReference()
Shaun.GetReference().Moveto(ShaunInteriorMarker)
Shaun.GetReference().Enable()
Utility.Wait(1.0)
InstKickOut.SetStage(200)
endif
EndEvent

Bool Property BOSInformed Auto Conditional

Bool Property RailroadInformed Auto Conditional

Int Property SynthsKilled Auto Conditional

Int Property WarningGiven Auto Conditional

Int Property SynthsReturned Auto Conditional

Int Property SynthsFreed Auto Conditional
Scene Property Inst302Stage60CourserFreedSynth Auto Const

Int Property F6CapsGiven Auto Conditional

ReferenceAlias Property shaun Auto Const

Quest Property InstKickOut Auto Const

ObjectReference Property ShaunInteriorMarker Auto Const

ObjectReference Property InstituteMapMarker Auto Const Mandatory
