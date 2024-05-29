Scriptname MQ104QuestScript extends Quest Conditional

;How did the player say he found Nick?
;1 = Ellie sent me, 2 = Luck, 3 = Didn't answer
Int Property Nick_Talk01 Auto Conditional

;What did the player tell Nick that he's after?
;1 = Shaun, 2 = Revenge, 3 = Evasive, 4 = Missing person
Int Property Nick_Talk_Shaun Auto Conditional

;Did Nick tell the player about the memory den?
;1 = yes
Int Property Nick_Talk_MemoryDen Auto Conditional

;Did the player pass the speech challenge about the memory den?
;1 = yes
Int Property Nick_SP_MemoryDen Auto Conditional

;How does the Player resolve the conflict with Skinny Malone?
;0 = Attack both of them, 1 = Convince Darla to Leave, 2 = Convince Darla to Turn, 3 = Convince Skinny to Back down, 4 = Convince Skinny to throw out Darla
Int Property Malone_Var01 Auto Conditional

;Does Skinny Malone count to ten before attacking?
Int Property Malone_CountDown Auto Conditional

;Does Darla return home?
;0 = No, 1 = Yes
Int Property Darla_Home01 Auto Conditional

;Vault114 Quest Target Tracker
Int Property var_114QT Auto Conditional

InputEnableLayer Property myEnableLayer Auto Hidden

ReferenceAlias Property Nick Auto
ObjectReference Property MQ104NickLightsOn Auto

Function UpdateVault114QT(int TriggerNumber)
	If var_114QT < TriggerNumber
		var_114QT = TriggerNumber
	EndIf
EndFunction


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if akSource == Nick.GetActorRef() && asEventName == "cigLight"
		;lights on
		MQ104NickLightsOn.Disable()
		UnRegisterForAnimationEvent(Nick.GetActorRef(), "cigLight")
	EndIf
EndEvent