Scriptname DN015QuestScript extends Quest Conditional

Int Property PlayerJob Auto Conditional
ObjectReference Property DN015_CleanRoomDoorRef auto Const
ObjectReference Property Dn015_CleanRoomInteriorTerminal Auto Const
RefCollectionAlias Property Defenses Auto Const
ActorValue Property Aggression Auto Const

Function ActivateCleanRoomDoor(bool ShouldBeOpen = true)
	DN015_CleanRoomDoorRef.SetOpen(ShouldBeOpen)
endFunction


Function HackCleanRoomDoor(bool ShouldBeOpen = true)
	DN015_CleanRoomDoorRef.SetOpen(ShouldBeOpen)
	SetStage(115)
	Defenses.SetValue(Aggression, 2)
endFunction

Function ClearCleanRoomOverride()
	ActivateCleanRoomDoor(true)
	SetStage(115)
EndFunction


Function GiveApparel(string job)
	if job == "sales"
		game.Getplayer().AddItem(DN015_LItemJobSales)
	elseif job == "lab"
		game.Getplayer().AddItem(DN015_LItemJobLab)
	elseif job == "security"
		game.Getplayer().AddItem(DN015_LItemJobSecurity)
	elseif job == "janitor"
		game.Getplayer().AddItem(DN015_LItemJobJanitor)
	endif
EndFunction

LeveledItem Property DN015_LItemJobSales Auto Const
LeveledItem Property DN015_LItemJobLab Auto Const
LeveledItem Property DN015_LItemJobSecurity Auto Const
LeveledItem Property DN015_LItemJobJanitor Auto Const


bool property HasIsotopeContainmentPassword = false auto conditional
bool property HasIsotopeConsoleBeenUnlocked = false auto conditional
bool property HasIsotopeContainmentBeenUnlocked = false auto conditional

Float Property ExitObjectiveTimer = 600.0 Auto
{Timer for how long before showing objective to exit}
GlobalVariable Property DN015_ExitObjectiveOn Auto Const

Function StartExitObjectiveTimer()
	StartTimer(ExitObjectiveTimer, 100)
EndFunction

Function StopObjectiveTimer()
	CancelTimer(100)
EndFunction

Function ForceExitObjectiveShown()
	CancelTimer(100)
	DN015_ExitObjectiveOn.SetValue(1)
	SetActive()
	SetObjectiveDisplayed(10, true)
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == 100
		DN015_ExitObjectiveOn.SetValue(1)
		SetObjectiveDisplayed(10, true)
	endif
EndEvent