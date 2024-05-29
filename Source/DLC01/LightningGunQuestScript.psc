Scriptname DLC01:LightningGunQuestScript extends Quest const

int property gunDoneStage = 200 auto const

Event OnTimerGameTime(int aiTimerID)
    SetStage(gunDoneStage)
EndEvent
