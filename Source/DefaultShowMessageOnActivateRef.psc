scriptName DefaultShowMessageOnActivateRef extends ObjectReference Default Const
{Show the selected message when this REFERENCE is activate.}

Group Required_Properties
	Message Property MessageToShow Auto Const
	{The message to show when I'm activated.}
EndGroup

Group Optional_Properties
	Quest Property MyQuest Auto Const
	{The quest who's stage we will check to see if the message should show or not.
	ALSO, the quest we will set stages on if a specific button is checked.}

	Int Property Button0StageToSet Auto Const
	{Stage you want to set when Button 0 is clicked.}

	Int Property Button1StageToSet Auto Const
	{Stage you want to set when Button 1 is clicked.}

	Int Property Button2StageToSet Auto Const
	{Stage you want to set when Button 2 is clicked.}

	Int Property Button3StageToSet Auto Const
	{Stage you want to set when Button 3 is clicked.}

	Int Property StageToCheck Auto Const
	{The stage we will check to see if the message should show or not.}

	Bool Property ShowIfStageIsSet = FALSE Auto Const
	{If FALSE (DEFAULT): Message will only show until the stage is NOT set.
	If TRUE: Message will only show if stage IS set.}

EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup


Event OnActivate(ObjectReference akActionRef)

	int iButton

	if (MessageToShow)
		if MyQuest && StageToCheck

				; If stage IS set, and SHOULD be...
			if (MyQuest.GetStageDone(StageToCheck)) && ShowIfStageIsSet
				DefaultScriptFunctions.DefaultScriptTrace(self + ": Stage" + StageToCheck + " is set on quest " + MyQuest + ", showing message, " + MessageToShow, ShowTraces)
				iButton = MessageToShow.Show()
				; If stage IS'NT set, and SHOULDN'T be...
			elseif (!MyQuest.GetStageDone(StageToCheck)) && !ShowIfStageIsSet
				DefaultScriptFunctions.DefaultScriptTrace(self + ": Stage" + StageToCheck + " is NOT set on quest " + MyQuest + ", showing message, " + MessageToShow, ShowTraces)
				iButton = MessageToShow.Show()
				; If stage IS set and SHOULDN'T be...
			elseif (MyQuest.GetStageDone(StageToCheck)) && !ShowIfStageIsSet
				DefaultScriptFunctions.DefaultScriptTrace(self + ": Stage" + StageToCheck + " is set on quest " + MyQuest + ", and SHOULDN'T be, NOT showing message " + MessageToShow, ShowTraces)
				; If stage ISN'T set and SHOULD be...
			elseif (!MyQuest.GetStageDone(StageToCheck)) && ShowIfStageIsSet
				DefaultScriptFunctions.DefaultScriptTrace(self + ": Stage" + StageToCheck + " is NOT set on quest " + MyQuest + ", and SHOULDN be, NOT showing message " + MessageToShow, ShowTraces)
			endif

		else
			DefaultScriptFunctions.DefaultScriptTrace(self + ": Showing message " + MessageToShow, ShowTraces)
			iButton = MessageToShow.Show()
		endif
	else
		DefaultScriptFunctions.DefaultScriptTrace(self + "ERROR: There is no message to show!", ShowTraces)
	endif

	if (MyQuest)
		if (iButton == 0)
			DefaultScriptFunctions.DefaultScriptTrace(self + ": Button #" + iButton + " was pressed, setting stage " + Button0StageToSet + " on quest " + MyQuest, ShowTraces)
			myQuest.SetStage(Button0StageToSet)
		elseif (iButton == 1)
			DefaultScriptFunctions.DefaultScriptTrace(self + ": Button #" + iButton + " was pressed, setting stage " + Button1StageToSet + " on quest " + MyQuest, ShowTraces)
			myQuest.SetStage(Button1StageToSet)
		elseif (iButton == 2)
			DefaultScriptFunctions.DefaultScriptTrace(self + ": Button #" + iButton + " was pressed, setting stage " + Button2StageToSet + " on quest " + MyQuest, ShowTraces)
			myQuest.SetStage(Button2StageToSet)
		elseif (iButton == 3)
			DefaultScriptFunctions.DefaultScriptTrace(self + ": Button #" + iButton + " was pressed, setting stage " + Button3StageToSet + " on quest " + MyQuest, ShowTraces)
			myQuest.SetStage(Button3StageToSet)
		endif
	endif

EndEvent

