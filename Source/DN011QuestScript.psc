Scriptname DN011QuestScript extends Quest Hidden

ObjectReference Property SubwayIntercom Auto

ObjectReference Property EntranceIntercom Auto

Scene Property DN011EntranceScene Auto Const
Faction Property DN011SecurityFaction Auto Const

Quest Property DN011 Auto Const

int TimeUntilFirstGroupStopsSpawning = 1

int TimeUntilSecondGroupStopsSpawning = 2

Function StartFirstSpawnTimer()
	StartTimer(50, TimeUntilFirstGroupStopsSpawning)
EndFunction

Function StartSecondSpawnTimer()
	StartTimer(50, TimeUntilSecondGroupStopsSpawning)
EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == TimeUntilFirstGroupStopsSpawning
    	DN011.SetStage(700)
    endif

    if aiTimerID == TimeUntilSecondGroupStopsSpawning
    	DN011.SetStage(900)
    endif
EndEvent