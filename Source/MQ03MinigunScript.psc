Scriptname MQ03MinigunScript extends ObjectReference  

Message Property MQ03MinigunNeedStr Auto
Weapon Property Minigun Auto
Ammo Property Ammo5mm Auto
Int Property MQ03MinigunStrengthMin = 8 Auto
ActorValue Property Strength Auto
Sound Property ITMSpecialMinigunVertibirdMountUp Auto
Sound Property ITMSpecialMinigunVertibirdMountFail Auto
Quest Property MQ102 Auto
LeveledItem Property MQ102_LL_Minigun Auto

; //updated by Phil 9/17
INT PROPERTY ammoCount AUTO

auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			;prevent activate spam
			gotostate("hasBeenTriggered")
			;test if player strength is too low
			If Game.GetPlayer().GetValue(Strength) < MQ03MinigunStrengthMin
				;allow player to activate object again
				gotostate("waitingForPlayer")
				;explain why player failed
				MQ03MinigunNeedStr.Show()
				ITMSpecialMinigunVertibirdMountFail.Play(Self)
			Else
				ITMSpecialMinigunVertibirdMountUp.Play(Self)
				self.Disable()	
				Game.GetPlayer().AddItem(MQ102_LL_Minigun, 1, abSilent=True)
				Game.GetPlayer().AddItem(Ammo5mm, ammoCount, abSilent=True)
				Game.GetPlayer().EquipItem(Minigun, abSilent=True)
				If MQ102.IsRunning()
					MQ102.SetStage(115)									
				EndIf
			EndIf
		EndIf
	EndEvent
EndState



STATE hasBeenTriggered
	; this is an empty state.
endSTATE
