Scriptname DLC04:DLC04VassalRewardQuestScript extends Quest Const

ReferenceAlias Property MostRecentVassalWorkshop Auto Const Mandatory
{Reference alias to the most recent vassal workshop}

int Property iVassalRewardTimerLength = 15 Auto Const
{How long before vassal reward timer fires then shuts down}

DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory
{DLC04 Workshop parent quest}

Quest Property DLC04CollectVassalIncomeMiscQuest Auto Const Mandatory
{Vassal income misc quest}

;Local vars
int iVassalRewardTimerID = 1 const

Function StartUp()
	StartTimer(iVassalRewardTimerLength, iVassalRewardTimerID)
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == iVassalRewardTimerID
		;Provide the player with their initial vassal reward...
		(DLC04WorkshopParent as DLC04:DLC04WorkshopParentScript).InitialVassalIncome(MostRecentVassalWorkshop.GetRef() as WorkshopScript)

		;If the Collect Vassal Income quest hasn't fired up, do so now
		if !DLC04CollectVassalIncomeMiscQuest.GetStageDone(10)
  			DLC04CollectVassalIncomeMiscQuest.SetStage(10)
		endif

		;Then call the stage to shut this thing down.
		SetStage(1000)
	endif
EndEvent