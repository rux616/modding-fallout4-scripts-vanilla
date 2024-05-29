Scriptname BoS201QuestScript extends Quest

ReferenceAlias Property BoS201Danse Auto Const
ReferenceAlias Property BoS201Vertibird Auto Const
ReferenceAlias Property BoS201VertibirdPilot Auto Const
ReferenceAlias Property BoS201Kells Auto Const
Quest Property BoS200 Auto Const
Quest Property BoS201 Auto Const
Quest Property BoS000 Auto Const
Quest Property BoS101 Auto Const
InputEnableLayer Property EnableLayer Auto
Keyword Property pAttachSlot1 Auto
Keyword Property pAttachSlot2 Auto

Function SilenceCombat()

	BoS201Danse.GetActorRef().StopCombatAlarm()
	BoS201Vertibird.GetActorRef().StopCombatAlarm()
	BoS201VertibirdPilot.GetActorRef().StopCombatAlarm()
	BoS201Kells.GetActorRef().StopCombatAlarm()
	Game.GetPlayer().StopCombatAlarm()

endFunction

Function FlyoverStuff()

	if BoS200.GetStageDone(200) == 1 && BoS200.GetStageDone(10) == 1
		SetStage(10)
	elseif BoS200.GetStageDone(200) == 0 && BoS200.GetStageDone(10) == 1
		SetStage(10)
	elseif BoS200.GetStageDone(200) == 0 && BoS200.GetStageDone(10) == 0 && BoS101.GetStageDone(10) == 1
		;Do nothing BoS101 in progress - QT already on ArcJet content
	elseif BoS200.GetStageDone(200) == 0 && BoS200.GetStageDone(10) == 0 && BoS101.GetStageDone(10) == 0
		BoS000.SetStage(10)
	endif

endFunction

Function DanseKeyOn()

	debug.trace("Swapping Danse Keywords for BoS201")
	BoS201Danse.GetActorRef().RemoveKeyword(pAttachSlot1)
	BoS201Danse.GetActorRef().AddKeyword(pAttachSlot2)

endFunction

Function DanseKeyOff()

	debug.trace("Restoring Danse Keywords for BoS201 end")
	BoS201Danse.GetActorRef().RemoveKeyword(pAttachSlot2)
	BoS201Danse.GetActorRef().AddKeyword(pAttachSlot1)

endFunction