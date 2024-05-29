Scriptname MS17InterrogationChairScript extends ReferenceAlias Conditional

Event OnActivate(ObjectReference akActivator)
	Actor aPlayer = Game.GetPlayer()

	Debug.Trace("Inside script")

	If ( akActivator == aPlayer )

		Debug.Trace(GetOwningQuest().GetStageDone(175)+","+GetOwningQuest().GetStageDone(140)+","+aPlayer.IsInCombat()+","+aPlayer.IsInPowerArmor())

		; If you haven't taken the SAFE test (175)
		;    and if Swanson is waiting for you to sit down (140)
		If ( !GetOwningQuest().GetStageDone(175) && GetOwningQuest().GetStageDone(140) )
			; And the player isn't in combat or in power armor
			if ( !aPlayer.IsInCombat() && !aPlayer.IsInPowerArmor() )
				GetOwningQuest().SetStage(150)
			endif
		EndIf
	EndIf
EndEvent

