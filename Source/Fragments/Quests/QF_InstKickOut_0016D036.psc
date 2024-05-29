;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstKickOut_0016D036 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE InstKickOutQuestScript
Quest __temp = self as Quest
InstKickOutQuestScript kmyQuest = __temp as InstKickOutQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.KickOut(Game.GetPlayer().GetCurrentLocation())

;Strip X6 out of Com quest alias to remove essential, then set Protected
Alias_InstKickoutX6.GetActorRef().SetEssential(False)
Alias_InstKickoutX6.GetActorRef().SetProtected(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE InstKickOutQuestScript
Quest __temp = self as Quest
InstKickOutQuestScript kmyQuest = __temp as InstKickOutQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE InstKickOutQuestScript
Quest __temp = self as Quest
InstKickOutQuestScript kmyQuest = __temp as InstKickOutQuestScript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(10)
SetObjectiveCompleted(10)
else
SetObjectiveCompleted(20)
endif
;move shaun back to the concourse if he's not there
if Shaun.GetActorReference().IsDead()==False
if Shaun.GetReference().GetCurrentLocation() != InstituteConcourseLocation
Shaun.GetReference().MoveTo(MQ207ShaunWaitMarker)
endif
endif


Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, abVerbose=False)
Utility.Wait(4.0)
Game.GetPlayer().MoveTo(InstKickOutExteriorMarker.GetReference())
InstituteMapMarker.Disable()
(MQ00 as MQ00Script).MQFactionKickoutPlayer(4)
Game.GetPlayer().RemoveFromFaction(InstituteFaction)
InstituteTeleportEffects.Stop()
kmyquest.ControlToggle(1)
;SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE InstKickOutQuestScript
Quest __temp = self as Quest
InstKickOutQuestScript kmyQuest = __temp as InstKickOutQuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
;for safety
kmyquest.ControlToggle(1)
InstituteTeleportEffects.Stop()
InstituteMapMarker.Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property InstKickOutExteriorMarker Auto Const

Faction Property InstituteFaction Auto Const

ObjectReference Property InstituteMapMarker Auto Const

Quest Property BoS203 Auto Const

Quest Property MQ00 Auto Const

Quest Property InstituteTeleportEffects Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const Mandatory

ReferenceAlias Property Alias_InstKickoutX6 Auto Const Mandatory

ObjectReference Property MQ207ShaunWaitMarker Auto Const Mandatory

Cell Property InstituteConcourse Auto Const Mandatory

ReferenceAlias Property shaun Auto Const

Location Property InstituteConcourseLocation Auto Const Mandatory
