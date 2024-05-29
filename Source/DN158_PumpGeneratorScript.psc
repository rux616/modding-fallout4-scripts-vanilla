Scriptname DN158_PumpGeneratorScript extends ObjectReference Const

GlobalVariable Property DN158_YangtzeFlooding Auto Const

GlobalVariable Property DN158_YangtzePumpingInProgress Auto Const


Ammo Property AmmoFusionCore Auto Const

Message Property DN158_YangtzeFusionCoreRequiredMessage Auto Const

Keyword Property LinkCustom01 Auto Const

DN158_MovableWaterScript Property DN158_Water01 Auto Const
DN158_MovableWaterScript Property DN158_Water02 Auto Const
DN158_MovableWaterScript Property DN158_Water03 Auto Const
Quest Property MS02 Auto Const

Event OnLoad()
	if DN158_YangtzePumpingInProgress.GetValue() == 1
		PlayAnimation("Reset")		;;;;;;;;;;;;;
	else
		PlayAnimation("StopEffect")
		;RegisterForRemoteEvent(GetLinkedRef(), "OnActivate")
	endif
EndEvent

;/
Event onUnload()
	UnRegisterForRemoteEvent(GetLinkedRef(), "OnActivate")
EndEvent
/;

;/
Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	Debug.Trace(Self + ": Has received OnActivate From >> " + akSender + " <<  >> " + akActionRef)
	if akSender == GetLinkedRef() && akActionRef == Game.GetPlayer()
		if Game.GetPlayer().GetItemCount(AmmoFusionCore) > 0
			UnRegisterForRemoteEvent(GetLinkedRef(), "OnActivate")
			game.GetPlayer().RemoveItem(AmmoFusionCore, 1)
			GetLinkedRef(LinkCustom01).EnableNoWait()
			UnRegisterForRemoteEvent(GetLinkedRef(), "OnActivate")
			PlayAnimation("Reset")
			MoveMyWater()
			GetLinkedRef().Disable()
		else
			DN158_YangtzeFusionCoreRequiredMessage.Show()
		endif
	endif
EndEvent
/;
Event OnActivate(ObjectReference akActionRef)
	MoveMyWater()
EndEvent

Function MoveMyWater()
		DN158_YangtzePumpingInProgress.SetValue(1)
		PlayAnimation("Reset")
		DN158_Water01.SetWaterStage(0)
		DN158_Water02.SetWaterStage(0)
		DN158_Water03.SetWaterStage(0)
		StartTimer(0.1, 1)
		StartTimer(0.1, 2)
		StartTimer(0.1, 3)
		if MS02.IsObjectiveDisplayed(250) && MS02.IsRunning()
			MS02.SetObjectiveCompleted(250)
		endif
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == 1
		DN158_Water01.BeginWaterStageTranslation()
	elseif aiTimerID == 2
		DN158_Water02.BeginWaterStageTranslation()
	elseif aiTimerID == 3
		DN158_Water03.BeginWaterStageTranslation()
	endif
EndEvent