;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN015_000284BC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set up initial faction relations
DN015_DirectorFaction.setEnemy(playerFaction, true, true) ;Set to neutral
DN015_RobotFaction.setEnemy(playerFaction, true, true) ;Set to friend
DN015_RobotFaction.setEnemy(DN015_DirectorFaction, true, true) ;Set to neutral
DN015_RobotFaction.setEnemy(DN015_GhoulResearcherFaction, true, true) ;Set to neutral
DN015_RobotFaction.setAlly(DN015_TurretOfficeFaction) ;Set to Ally
DN015_RobotFaction.setAlly(DN015_TurretResearchFaction) ;Set to Ally
CambridgePolymerLabsReservation.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DN015QuestScript
Quest __temp = self as Quest
DN015QuestScript kmyQuest = __temp as DN015QuestScript
;END AUTOCAST
;BEGIN CODE
if !IsObjectiveCompleted(0) && !IsObjectiveCompleted(10)
kmyQuest.ForceExitObjectiveShown()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DN015QuestScript
Quest __temp = self as Quest
DN015QuestScript kmyQuest = __temp as DN015QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Robot.GetActorRef().EvaluatePackage()
kMyQuest.ActivateCleanRoomDoor(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE DN015QuestScript
Quest __temp = self as Quest
DN015QuestScript kmyQuest = __temp as DN015QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ActivateCleanRoomDoor(ShouldBeOpen = false)
DN015_CleanRoomSequence.Start()
DN015_MusicDread.Activate(DN015_MusicDread)
if alias_Robot.getActorRef().isDead()
	alias_RobotBackup.GetRef().enable()
	alias_Robot.ForceRefTo(alias_RobotBackup.getActorRef())
	DN015_BackupRobotDoor.SetOpen()
endif

if DN015_RobotOrientation.IsPlaying()
	DN015_RobotOrientation.Stop()
Endif

alias_ArmorPrototype.ForceRefTo(ExternalArmorAlias.GetReference())
;Ghost the robot so you can't blow them up remotely
alias_Robot.GetActorRef().SetGhost(true)

objectReference myCompanion = Alias_Companion.GetReference()
objectReference myDogmeat = Alias_Dogmeat.GetReference()

if myCompanion && myCompanion.GetParentCell() == CambridgePolymerLabs01
	myCompanion.MoveTo(DN015_FollowerMoveMarker)
endif

if myDogmeat  && myDogmeat.GetParentCell() == CambridgePolymerLabs01
	myDogmeat .MoveTo(DN015_FollowerMoveMarker)
endif

Utility.Wait(3.0)
SetObjectiveDisplayed(0)
SetObjectiveDisplayed(10)

kmyQuest.StartExitObjectiveTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DN015QuestScript
Quest __temp = self as Quest
DN015QuestScript kmyQuest = __temp as DN015QuestScript
;END AUTOCAST
;BEGIN CODE
;Game.GetPlayer().addItem(alias_ArmorPrototype.getReference())

SetObjectiveDisplayed(0, true, true)
if !IsObjectiveCompleted(10)
	SetObjectiveDisplayed(10, false)
Endif
kmyQuest.StopObjectiveTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE DN015QuestScript
Quest __temp = self as Quest
DN015QuestScript kmyQuest = __temp as DN015QuestScript
;END AUTOCAST
;BEGIN CODE
;Player has "hacked" their way out. Robots turn hostile.



DN015_RobotFaction.SetEnemy(PlayerFaction, 0, 0)
DN015_TurretOfficeFaction.SetEnemy(PlayerFaction, 0, 0)
DN015_TurretResearchFaction.SetEnemy(PlayerFaction, 0, 0)
kMyQuest.HackCleanRoomDoor()
DN015_MusicReveal.Activate(DN015_MusicReveal)

SetObjectiveCompleted(10)
kmyQuest.StopObjectiveTimer()

Actor CurrentRobot = alias_Robot.GetActorRef()
CurrentRobot.SetGhost(false)
CurrentRobot.SetValue(Aggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
alias_Robot.GetActorRef().SetGhost(false)

alias_ArmorPrototype.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DN015QuestScript
Quest __temp = self as Quest
DN015QuestScript kmyQuest = __temp as DN015QuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.ClearCleanroomOverride()
alias_Robot.GetActorRef().SetGhost(false)
If IsObjectiveDisplayed(10)
	SetObjectiveDisplayed(10, false)
Endif
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
DN015_DirectorFaction.setEnemy(PlayerFaction)
Alias_Director.getActorRef().setValue(Aggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
game.GetPlayer().AddItem(LL_PrewarMoney_Reward_Large)
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_Robot.getActorRef().SetProtected(false)
Alias_Robot.getActorRef().kill()
;Game.AwardPlayerXP(XPMiscQuest)
FailAllObjectives()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Container Auto Const

ReferenceAlias Property Alias_ArmorPrototype Auto Const

ObjectReference Property DN015_BlastHoleEnabler Auto Const

ReferenceAlias Property Alias_Director Auto Const

Faction Property DN015_DirectorFaction Auto Const

Faction Property PlayerFaction Auto Const

ReferenceAlias Property Alias_Robot Auto Const

Faction Property DN015_TurretOfficeFaction Auto Const

Faction Property DN015_TurretResearchFaction Auto Const

Faction Property DN015_RobotFaction Auto Const

Faction Property DN015_GhoulResearcherFaction Auto Const

Scene Property DN015_CleanRoomSequence Auto Const

ReferenceAlias Property Alias_RobotBackup Auto Const

ObjectReference Property DN015_BackupRobotDoor Auto Const

ReferenceAlias Property Alias_PZTActivator Auto Const

ReferenceAlias Property Alias_PZTSample Auto Const

ReferenceAlias Property Alias_GoldActivator Auto Const

ReferenceAlias Property Alias_GoldSample Auto Const

ReferenceAlias Property Alias_LiHActivator Auto Const

ReferenceAlias Property Alias_LiHSample Auto Const

ReferenceAlias Property Alias_IsotopeActivator Auto Const

ReferenceAlias Property Alias_IsotopeSample Auto Const

ReferenceAlias Property Alias_RiggedWeaponFuelActivator Auto Const

ReferenceAlias Property Alias_CompoundSample Auto Const

ReferenceAlias Property Alias_CentrifugeOutputActivator Auto Const

ReferenceAlias Property Alias_NanoweaveSample Auto Const

ReferenceAlias Property Alias_ExtruderOutputActivator Auto Const

ActorValue Property Aggression Auto Const

ObjectReference Property DN015_FollowerMoveMarker Auto Const

ReferenceAlias Property Alias_Companion Auto Const

ReferenceAlias Property Alias_Dogmeat Auto Const

ObjectReference Property DN015_MusicDread Auto Const

ObjectReference Property DN015_MusicReveal Auto Const

LeveledItem Property LL_PrewarMoney_Reward_Large Auto Const Mandatory

LocationAlias Property CambridgePolymerLabsReservation Auto Const

ReferenceAlias Property ExternalArmorAlias Auto Const

Cell Property CambridgePolymerLabs01 Auto Const Mandatory

Scene Property DN015_RobotOrientation Auto Const Mandatory
