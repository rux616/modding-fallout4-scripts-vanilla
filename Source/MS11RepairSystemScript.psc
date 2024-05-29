Scriptname MS11RepairSystemScript extends ObjectReference

Int ButtonPressed = 0
Quest Property pMyQuest  Auto
Message Property pMessageDisplay  Auto
Message Property pMessageDisplayFixed  Auto
Message Property pMessageDisplaySabotaged  Auto
Int Property pCoreStage  Auto
Int Property pFixedStage  Auto
Int Property pStageButton1  Auto
Int Property pStageButton2  Auto
Int Property pStageButton3  Auto
Int Property pStageButton4  Auto
Int Property pSabotageStateToCheck  Auto
Bool Property bCanSabotage  Auto

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == Game.GetPlayer()
		
		if ( pMyQuest.GetStageDone(pCoreStage) )   	; Have you unlocked this mission?
			;pMyQuest.SetStage(pCoreStage)

			if ( !pMyQuest.GetStageDone(pFixedStage) )		; If the system isn't fixed
				; Display the repair system message
				ButtonPressed = pMessageDisplay.Show()
				If ButtonPressed == 0
					pMyQuest.SetStage(pStageButton1)
				ElseIf ButtonPressed == 1
					pMyQuest.SetStage(pStageButton2)
				ElseIf ButtonPressed == 2
					pMyQuest.SetStage(pStageButton3)
				ElseIf ButtonPressed == 3
					pMyQuest.SetStage(pStageButton4)
				EndIf
			Else
				if ( bCanSabotage && (pMyQuest.GetStageDone(pSabotageStateToCheck)) )
					; So if this is the part that can be sabotaged check to see if the component has been sabotaged
					pMessageDisplaySabotaged.Show()
				Else
					; This is the case where the system is fixed
					pMessageDisplayFixed.Show()
				EndIf
			EndIf	
		EndIf
	EndIf

EndEvent