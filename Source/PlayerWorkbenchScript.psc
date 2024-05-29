Scriptname PlayerWorkbenchScript extends ReferenceAlias

String HammerAnimEvent = "HammersAnvil"
String SewingAnimEvent = "StartsSewing"

Keyword Property WorkbenchPlayerGruntTopic Auto
Keyword Property WorkbenchPlayerHumWhistleTopic Auto

Auto State PlayerNotInWorkbench
	;when the player starts using a workbench, listen for animation event and play associated player topic
	Event OnPlayerUseWorkBench(ObjectReference akWorkBench)
		gotoState("PlayerInWorkbench")
		RegisterForAnimationEvent(Game.GetPlayer(), HammerAnimEvent)
		RegisterForAnimationEvent(Game.GetPlayer(), SewingAnimEvent)
	EndEvent
EndState

State PlayerInWorkbench
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		If (akSource == Game.GetPlayer()) && (asEventName == HammerAnimEvent)
			Game.GetPlayer().SayCustom(WorkbenchPlayerGruntTopic)
		EndIf

		If (akSource == Game.GetPlayer()) && (asEventNAme == WorkbenchPlayerHumWhistleTopic)
			Game.GetPlayer().SayCustom(WorkbenchPlayerHumWhistleTopic)
		EndIf
	EndEvent

	;when the player leaves the workbench, unregister and wait for him to enter another workbench
	Event OnGetUp(ObjectReference akFurniture)
		gotoState("PlayerNotInWorkbench")
		UnRegisterForAnimationEvent(Game.GetPlayer(), HammerAnimEvent)
		UnRegisterForAnimationEvent(Game.GetPlayer(), SewingAnimEvent)
	EndEvent
EndState 