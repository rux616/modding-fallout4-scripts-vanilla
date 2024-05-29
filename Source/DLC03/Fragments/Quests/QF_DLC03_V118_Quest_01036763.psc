;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_Quest_01036763 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
debug.Trace("V118 Quest has started")
kmyQuest.DoInit()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
if !DLC03_V118_Intro.GetStageDone(1000)
	DLC03_V118_Intro.SetStage(1000)
endif
DLC03_V118_Quest_IntroMurderScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ReturnDoorLockState()
;Start the individual intro scenes
DLC03_V118_QuestIntroGildaKeith.Start()
DLC03_V118_QuestIntroJuliannaBert.Start()
DLC03_V118_QuestIntroSantiago.Start()
DLC03_V118_QuestIntroTravelBarbara.Start()

DLC03_V118_MiscObjectives.SetStage(210)

SetObjectiveDisplayed(0)    ;Question receptionist about murders
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(0)    ;Search Ezra's crime scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
DLC03_V118_ClueTracker.SetStage(5)

SetObjectiveCompleted(0) 
SetObjectiveDisplayed(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0351_Item_00
Function Fragment_Stage_0351_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(105)

If GetStageDone(352)
	SetObjectiveCompleted(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0352_Item_00
Function Fragment_Stage_0352_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(106)
SetObjectiveDisplayed(3)

If GetStageDone(351)
	SetObjectiveCompleted(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0353_Item_00
Function Fragment_Stage_0353_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(107)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetObjectiveCompleted(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
;Initial crime scene clues found
SetObjectiveCompleted(3)
if !GetStageDone(390)
	SetObjectiveDisplayed(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has discussed finding
SetObjectiveCompleted(5)

If IsObjectiveDisplayed(3) && !IsObjectiveCompleted(3)
	SetObjectiveCompleted(3)
endif

;Nudge player to explore the rest
SetObjectiveDisplayed(7)     ;Find and accuse killer
SetObjectiveDisplayed(10)     ;Investigate Keith

kmyQuest.SetClueTrackerStage(74)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0391_Item_00
Function Fragment_Stage_0391_Item_00()
;BEGIN CODE
;Back from the Bat Connection

;If the player knows about the Voice Mod && that Bert is afraid of Julianna
if DLC03_V118_ClueTracker.GetStageDone(50) && GetStageDone(833)
	;Time to confront Julianna
	SetObjectiveDisplayed(27)

	;Clear the investigate Julianna objective if it is active
	if IsObjectiveDisplayed(21)
		SetObjectiveCompleted(21)
	endif
	
	if IsObjectiveDisplayed(20) && !isObjectiveCompleted(20)
		SetObjectiveCompleted(20) 
	endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0392_Item_00
Function Fragment_Stage_0392_Item_00()
;BEGIN CODE
if !IsObjectiveDisplayed(15)
	SetObjectiveDisplayed(15)     ;Investigate Santiago
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0394_Item_00
Function Fragment_Stage_0394_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(25) && !IsObjectiveCompleted(25)
	SetObjectiveCompleted(25)
endif

If isObjectiveDisplayed(20)
	SetObjectiveCompleted(20)
EndIf
SetObjectiveDisplayed(21)

kMyQuest.PlayerOnPathToJulianna = false
kMyQuest.InvestigateRiggs = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0411_Item_00
Function Fragment_Stage_0411_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(403)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0417_Item_00
Function Fragment_Stage_0417_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
if !IsObjectiveDisplayed(20) && !IsObjectiveDisplayed(21)
	SetObjectiveDisplayed(20)     ;Investigate Riggs
endif

kmyQuest.SetClueTrackerStage(801)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0419_Item_00
Function Fragment_Stage_0419_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(605)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(405)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0431_Item_00
Function Fragment_Stage_0431_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(402)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetUpConfrontationFight(Alias_Santiago)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0465_Item_00
Function Fragment_Stage_0465_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartConfrontationFight(Alias_Santiago, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
if GetStageDone(465)

Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
;If Gilda is in a scene when their intro scene has ended it is because the player has talked to her
;	So play Keiths walk away line
if Alias_Gilda.GetActorRef().IsInScene()
	DLC03_V118_QuestIntroGildaKeithExitK.Start()
endif

;If Keithis in a scene when their intro scene has ended it is because the player has talked to him
;	So play Gilda's walk away line
if Alias_Keith.GetActorRef().IsInScene()
	DLC03_V118_QuestIntroGildaKeithExitG.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0526_Item_00
Function Fragment_Stage_0526_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(501)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0534_Item_00
Function Fragment_Stage_0534_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(802)

If !DLC03_V118_ClueTracker.GetStageDone(80) && !IsObjectiveDisplayed(25) && !IsObjectiveCompleted(25)
	SetObjectiveDisplayed(25)
endif

kMyQuest.PlayerOnPathToJulianna = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0538_Item_00
Function Fragment_Stage_0538_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
if !IsObjectiveDisplayed(15)
	SetObjectiveDisplayed(15)     ;Investigate Santiago
endif

kmyQuest.SetClueTrackerStage(410)
kmyQuest.SetClueTrackerStage(411)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0548_Item_00
Function Fragment_Stage_0548_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.Date()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetUpConfrontationFight(Alias_Gilda)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0565_Item_00
Function Fragment_Stage_0565_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartConfrontationFight(Alias_Gilda, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0612_Item_00
Function Fragment_Stage_0612_Item_00()
;BEGIN CODE
if !IsObjectiveDisplayed(15)
	SetObjectiveDisplayed(15)     ;Investigate Santiago
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0613_Item_00
Function Fragment_Stage_0613_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0616_Item_00
Function Fragment_Stage_0616_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(501)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0617_Item_00
Function Fragment_Stage_0617_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(603)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0622_Item_00
Function Fragment_Stage_0622_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(501)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0624_Item_00
Function Fragment_Stage_0624_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
if !IsObjectiveDisplayed(15)
	SetObjectiveDisplayed(15)     ;Investigate Santiago
endif

kmyQuest.SetClueTrackerStage(411)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0626_Item_00
Function Fragment_Stage_0626_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(702)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0627_Item_00
Function Fragment_Stage_0627_Item_00()
;BEGIN CODE
;Found out Keith was in love with Ezra, clearing him
if isObjectiveDisplayed(10) && !isObjectiveCompleted(10)
	SetObjectiveCompleted(10)
endif

;if !isObjectiveDisplayed(15)

;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetUpConfrontationFight(Alias_Keith)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0665_Item_00
Function Fragment_Stage_0665_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartConfrontationFight(Alias_Keith, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0722_Item_00
Function Fragment_Stage_0722_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(803)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0734_Item_00
Function Fragment_Stage_0734_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
DLC03DialogueV118_EzraReveal.Start()
;kmyQuest.SetUpConfrontationFight(Alias_Julianna)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0765_Item_00
Function Fragment_Stage_0765_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartConfrontationFight(Alias_Julianna, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0812_Item_00
Function Fragment_Stage_0812_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(50)

;If the player knows about the Bat Connection && that he is afraid of Julianna
if DLC03_V118_ClueTracker.GetStageDone(74) && GetStageDone(833)
	;Time to confront Julianna
	SetObjectiveDisplayed(27)

	;Clear the investigate Julianna objective if it is active
	if IsObjectiveDisplayed(21)
		SetObjectiveCompleted(21)
	endif


;If you have Don't know about the bat, but DO know about the voice mod
elseif	GetStageDone(834)
	;If Investigate Riggs objective is active, clear it
	if IsObjectiveDisplayed(20) && !isObjectiveCompleted(20)
		SetObjectiveCompleted(20) 
	endif
	
	;If Investigate Julianna is NOT active make it so
	if !IsObjectiveDisplayed(21)
		SetObjectiveDisplayed(21)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0815_Item_00
Function Fragment_Stage_0815_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(49)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(705)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(502)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0831_Item_00
Function Fragment_Stage_0831_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(49)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0832_Item_00
Function Fragment_Stage_0832_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(804)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0833_Item_00
Function Fragment_Stage_0833_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(804)

;If the player knows about the Bat Connection && About the voice modulator
if DLC03_V118_ClueTracker.GetStageDone(74) && DLC03_V118_ClueTracker.GetStageDone(50) 
	;Time to confront Julianna
	SetObjectiveDisplayed(27)

	;Clear the investigate Julianna objective if it is active
	if IsObjectiveDisplayed(21)
		SetObjectiveCompleted(21)
	endif



else
	;If Investigate Riggs objective is active, clear it
	if IsObjectiveDisplayed(20) && !isObjectiveCompleted(20)
		SetObjectiveCompleted(20) 
	endif
	
	;If Investigate Julianna is NOT active make it so
	if !IsObjectiveDisplayed(21)
		SetObjectiveDisplayed(21)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_QuestScript kmyQuest = __temp as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(802)

If !DLC03_V118_ClueTracker.GetStageDone(80) && !IsObjectiveDisplayed(25) && !IsObjectiveCompleted(25)
	SetObjectiveDisplayed(25)
endif

kMyQuest.PlayerOnPathToJulianna = true
kMyQuest.InvestigateRiggs = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0870_Item_00
Function Fragment_Stage_0870_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(0) && !IsObjectiveCompleted(0)
	SetObjectiveCompleted(0)
Endif

if IsObjectiveDisplayed(3) && !IsObjectiveCompleted(3)
	SetObjectiveCompleted(3)
Endif

if IsObjectiveDisplayed(5) && !IsObjectiveCompleted(5)
	SetObjectiveCompleted(5)
Endif

if IsObjectiveDisplayed(7) && !IsObjectiveCompleted(7)
	SetObjectiveCompleted(7)
Endif

if IsObjectiveDisplayed(10) && !IsObjectiveCompleted(10)
	SetObjectiveCompleted(10)
Endif

if IsObjectiveDisplayed(15) && !IsObjectiveCompleted(15)
	SetObjectiveCompleted(15)
Endif

if IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20)
	SetObjectiveCompleted(20)
Endif

if IsObjectiveDisplayed(21) && !IsObjectiveCompleted(21)
	SetObjectiveCompleted(21)
Endif

if IsObjectiveDisplayed(25) && !IsObjectiveCompleted(25)
	SetObjectiveCompleted(25)
Endif

if IsObjectiveDisplayed(27) && !IsObjectiveCompleted(27)
	SetObjectiveCompleted(27)
Endif

if IsObjectiveDisplayed(30) && !IsObjectiveCompleted(30)
	SetObjectiveCompleted(30)
Endif

SetObjectiveDisplayed(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0880_Item_00
Function Fragment_Stage_0880_Item_00()
;BEGIN CODE
DLC03DialogueV118.SetStage(910)
DLC03DialogueV118.SetStage(950)

SetObjectiveCompleted(35)
SetObjectiveDisplayed(50)
if IsObjectiveDisplayed(0) && !isObjectiveCompleted(0)
SetObjectiveCompleted(0) 
endif

if IsObjectiveDisplayed(3) && !isObjectiveCompleted(3)
SetObjectiveCompleted(3) 
endif

if IsObjectiveDisplayed(5) && !isObjectiveCompleted(5)
SetObjectiveCompleted(5) 
endif

if IsObjectiveDisplayed(7) && !isObjectiveCompleted(7)
SetObjectiveCompleted(7) 
endif

if IsObjectiveDisplayed(10) && !isObjectiveCompleted(10)
SetObjectiveCompleted(10) 
endif

if IsObjectiveDisplayed(15) && !isObjectiveCompleted(15)
SetObjectiveCompleted(15) 
endif

if IsObjectiveDisplayed(20) && !isObjectiveCompleted(20)
SetObjectiveCompleted(20) 
endif

if IsObjectiveDisplayed(21) && !IsObjectiveCompleted(21)
SetObjectiveCompleted(21)
Endif

if IsObjectiveDisplayed(25) && !isObjectiveCompleted(25)
SetObjectiveCompleted(25)
endif



if IsObjectiveDisplayed(27) && !isObjectiveCompleted(27)
SetObjectiveCompleted(27)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30)

if IsObjectiveDisplayed(0) && !isObjectiveCompleted(0)
SetObjectiveCompleted(0) 
endif

if IsObjectiveDisplayed(3) && !isObjectiveCompleted(3)
SetObjectiveCompleted(3) 
endif

if IsObjectiveDisplayed(5) && !isObjectiveCompleted(5)
SetObjectiveCompleted(5) 
endif

if IsObjectiveDisplayed(7) && !isObjectiveCompleted(7)
SetObjectiveCompleted(7) 
endif

if IsObjectiveDisplayed(10) && !isObjectiveCompleted(10)
SetObjectiveCompleted(10) 
endif

if IsObjectiveDisplayed(15) && !isObjectiveCompleted(15)
SetObjectiveCompleted(15) 
endif

if IsObjectiveDisplayed(20) && !isObjectiveCompleted(20)
SetObjectiveCompleted(20) 
endif

if IsObjectiveDisplayed(21) && !IsObjectiveCompleted(21)
SetObjectiveCompleted(21)
Endif

if IsObjectiveDisplayed(25) && !isObjectiveCompleted(25)
SetObjectiveCompleted(25)
endif



if IsObjectiveDisplayed(27) && !isObjectiveCompleted(27)
SetObjectiveCompleted(27)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(0) && !isObjectiveCompleted(0)
SetObjectiveCompleted(0) 
endif

if IsObjectiveDisplayed(3) && !isObjectiveCompleted(3)
SetObjectiveCompleted(3) 
endif

if IsObjectiveDisplayed(5) && !isObjectiveCompleted(5)
SetObjectiveCompleted(5) 
endif

if IsObjectiveDisplayed(7) && !isObjectiveCompleted(7)
SetObjectiveCompleted(7) 
endif

if IsObjectiveDisplayed(10) && !isObjectiveCompleted(10)
SetObjectiveCompleted(10) 
endif

if IsObjectiveDisplayed(15) && !isObjectiveCompleted(15)
SetObjectiveCompleted(15) 
endif

if IsObjectiveDisplayed(20) && !isObjectiveCompleted(20)
SetObjectiveCompleted(20) 
endif

if IsObjectiveDisplayed(21) && !IsObjectiveCompleted(21)
SetObjectiveCompleted(21)
Endif

if IsObjectiveDisplayed(25) && !isObjectiveCompleted(25)
SetObjectiveCompleted(25)
endif


if IsObjectiveDisplayed(27) && !isObjectiveCompleted(27)
SetObjectiveCompleted(27)
endif

if IsObjectiveDisplayed(30)
	SetObjectiveCompleted(30)
endif

if IsObjectiveDisplayed(35)
	SetObjectiveDisplayed(35, false)
endif
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(50)
	SetObjectiveCompleted(50)
endif
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC03_V118_Quest_IntroMurderScene Auto Const Mandatory

Scene Property DLC03_V118_QuestIntroGildaKeith Auto Const Mandatory

Scene Property DLC03_V118_QuestIntroJuliannaBert Auto Const Mandatory

Scene Property DLC03_V118_QuestIntroSantiago Auto Const Mandatory

Quest Property DLC03_V118_ClueTracker Auto Const Mandatory

Scene Property DLC03_V118_QuestIntroTravelBarbara Auto Const Mandatory

ReferenceAlias Property Alias_Santiago Auto Const Mandatory

ReferenceAlias Property Alias_Julianna Auto Const Mandatory

ReferenceAlias Property Alias_Gilda Auto Const Mandatory

ReferenceAlias Property Alias_Bert Auto Const Mandatory

ReferenceAlias Property Alias_Keith Auto Const Mandatory

Quest Property DLC03DialogueV118 Auto Const Mandatory

Quest Property DLC03_V118_MiscObjectives Auto Const Mandatory

Scene Property DLC03_V118_QuestIntroGildaKeithExitK Auto Const Mandatory

Scene Property DLC03_V118_QuestIntroGildaKeithExitG Auto Const Mandatory

Scene Property DLC03DialogueV118_EzraReveal Auto Const Mandatory

Quest Property DLC03_V118_Intro Auto Const Mandatory
