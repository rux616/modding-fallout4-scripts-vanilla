Scriptname V81_00_Intro_PlayerScript extends ReferenceAlias

Ammo Property AmmoFusionCore Auto
Quest Property V81_00_Intro Auto
GlobalVariable Property V81_00_Intro_FusionCoreFound Auto


Event OnAliasInit()
	AddInventoryEventFilter(AmmoFusionCore)
EndEvent

;check if the player has a Fusion Core, swap objectives if he drops them
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If akBaseItem == AmmoFusionCore
		debug.trace(self + " Found Core, send ItemCollected to Quest Script")
		;Run function on quest script to track count
		If !akSourceContainer
			(GetOwningQuest() as V81_00_IntroScript).ItemCollected()
		Else
			(GetOwningQuest() as V81_00_IntroScript).ItemCollected()
		EndIf
	EndIf
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	If akBaseItem == AmmoFusionCore
		;redisplay the objective if the player has no Fusion Core, except if the player just put the fusion core in the power armor
		debug.trace(self + " Dropped Core, send ItemDropped to Quest Script")
		;Run function on quest script to track count
		(GetOwningQuest() as V81_00_IntroScript).ItemDropped()
	EndIf

EndEvent
Scene Property V81_00_Intro_Overseer_Intro Auto Const
