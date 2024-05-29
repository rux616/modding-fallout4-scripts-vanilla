;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN133_000AE9A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE DN133QuestScript
Quest __temp = self as Quest
DN133QuestScript kmyQuest = __temp as DN133QuestScript
;END AUTOCAST
;BEGIN CODE
;Put any set up scripting needed here
kMyQuest.RegisterMirelurks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DN133QuestScript
Quest __temp = self as Quest
DN133QuestScript kmyQuest = __temp as DN133QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CleanUpMirelurkClutter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DN133QuestScript
Quest __temp = self as Quest
DN133QuestScript kmyQuest = __temp as DN133QuestScript
;END AUTOCAST
;BEGIN CODE
;Broken out in case we need to track all the mirelurks

;If Min02 is in progress tell it the courtyard is cleared
If Min02.GetStageDone(50)
	Min02.SetStage(250)
Endif

;If Wall Mirelurks are already dead, tell the quest that all regular mirelurks are dead
if GetStageDone(120)
	SetStage(200)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;If Courtyard Mirelurks are already dead, tell the quest that all regular mirelurks are dead
if GetStageDone(100)
	SetStage(200)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Tell us when all the normal mirelurks are dead
;if GetStageDone(500)
;	SetStage(900) ; castle battle is over
;endif
;kmyQuest.CheckForQuestShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
if Min03.IsRunning() == false ; skip for quickstarting min03...
	MirelurkQueenRoar.Play(alias_MirelurkQueen.GetReference())
	Game.ShakeCamera(akSource = None, afStrength = 0.2, afDuration = 1.3)
	Game.ShakeController(0.3, 0.3, afDuration = 1.3)
	DN133Queen_MusicDread.Activate(DN133Queen_MusicDread)
endif
if Min02.GetStageDone(50)
	Min02.SetStage(290)
	;Start the scene to get the announcer in position
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Mirelurk Queen Released
if Min03.IsRunning() == false ; skip for quickstarting min03...
	MirelurkQueenRoar.Play(alias_MirelurkQueen.GetReference())
	Game.ShakeCamera(akSource = None, afStrength = 0.7, afDuration = 1.3)
	Game.ShakeController(0.7, 0.7, afDuration = 1.3)
endif
DN133Queen_MusicStinger.Activate(DN133Queen_MusicStinger)
if Min02.GetStageDone(50)
	Min02.SetStage(300)
	;Min02 will call back to release the queen
else
	utility.wait(3.0)
	SetStage(401) ;Release Queen
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
Alias_MirelurkQueen.GetReference().Activate(Alias_MirelurkQueen.GetReference())
DN133_QueenInitialTravel.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DN133QuestScript
Quest __temp = self as Quest
DN133QuestScript kmyQuest = __temp as DN133QuestScript
;END AUTOCAST
;BEGIN CODE
;If Minutemen Take over the castle is running, set the stage to notify that the queen is dead
if Min02.GetStageDone(50)
	Min02.SetStage(400)
endif

; if Preston is here, set flag (for Min02 intro)
actor companion = Alias_Companion.GetActorRef()
if companion.GetActorBase() == PrestonGarvey
	kmyQuest.PrestonHelpedClearCastle = true
endif

Alias_FastTravelMarker.GetReference().Moveto(Alias_CourtyardMoveMarker.GetReference())
kmyQuest.CheckForQuestShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE DN133QuestScript
Quest __temp = self as Quest
DN133QuestScript kmyQuest = __temp as DN133QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartMirelurkCleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE DN133QuestScript
Quest __temp = self as Quest
DN133QuestScript kmyQuest = __temp as DN133QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckForQuestShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN AUTOCAST TYPE DN133QuestScript
Quest __temp = self as Quest
DN133QuestScript kmyQuest = __temp as DN133QuestScript
;END AUTOCAST
;BEGIN CODE
DN133_SentrybotScene.Start()
if Min03.GetStage() < 450
	kmyQuest.SentryKilledWithoutRonnie = true
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0671_Item_00
Function Fragment_Stage_0671_Item_00()
;BEGIN CODE
Alias_Sentrybot.GetRef().Activate(Alias_Sentrybot.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0675_Item_00
Function Fragment_Stage_0675_Item_00()
;BEGIN CODE
Alias_Sentrybot.getActorRef().AddToFaction(RobotFaction)
Alias_Sentrybot.getReference().SetValue(Aggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE DN133QuestScript
Quest __temp = self as Quest
DN133QuestScript kmyQuest = __temp as DN133QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckForQuestShutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;Quest End
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Do whatever clean up we need to here, probably disabling mirelurk clutter
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_MirelurkQueen Auto Const

Quest Property Min02 Auto Const

sound Property MirelurkQueenRoar Auto Const

RefCollectionAlias Property Alias_Mirelurks Auto Const

Quest Property Min03 Auto Const

Scene Property DN133_QueenInitialTravel Auto Const

ReferenceAlias Property Alias_SentryBot Auto Const

Faction Property RobotFaction Auto Const

ActorValue Property Aggression Auto Const

Scene Property DN133_SentryBotScene Auto Const

ReferenceAlias Property Alias_Companion Auto Const

ActorBase Property PrestonGarvey Auto Const

ReferenceAlias Property Alias_CourtyardMoveMarker Auto Const

ReferenceAlias Property Alias_FastTravelMarker Auto Const

ObjectReference Property DN133Queen_MusicDread Auto Const

ObjectReference Property DN133Queen_MusicStinger Auto Const
