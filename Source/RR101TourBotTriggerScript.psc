Scriptname RR101TourBotTriggerScript extends ObjectReference Hidden
{Script for the RR101 Tourbot. Activates him if the player approaches the trail marker and hasn't already interacted with him or the marker.}

Quest property RR101 Auto Const Mandatory
{RR101}

DN131_SwanAliasScript property Swan Auto Const
{Swan's reference alias on DN131.}

RR101TourBotManagerScript property RR101TourBotManager Auto Const Mandatory
{The DefaultDummy managing the Tourbot.}


Event OnTriggerEnter(ObjectReference akActionRef)
	;Ignore enter trigger events if Swan is active.
	if (!Swan.IsActive() && (akActionRef == Game.GetPlayer()) && !(RR101.GetStageDone(120) || RR101.GetStageDone(400)))
		;Debug.Trace("INCREMENT")
		;RR101TourBotManager.UpdateTriggerCount(1)
		Actor aTourBot = pRR101TourBot.GetUniqueActor()
		aTourBot.SetValue(pRR101_TourbotState, 3.0)
		aTourBot.SetUnconscious(False)
		aTourBot.EvaluatePackage()		
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	;Debug.Trace("DECREMENT")
	if ( akActionRef == Game.GetPlayer() )
		;RR101TourBotManager.UpdateTriggerCount(-1)
		Actor aTourBot = pRR101TourBot.GetUniqueActor()
		aTourBot.SetValue(pRR101_TourbotState, 0.0)
		aTourBot.SetUnconscious(False)
		aTourBot.EvaluatePackage()		
	endif
EndEvent

ActorBase Property pRR101TourBot Auto Const
ActorValue Property pRR101_TourbotState Auto Const
