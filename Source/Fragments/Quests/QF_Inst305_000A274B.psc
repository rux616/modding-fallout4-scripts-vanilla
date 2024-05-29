;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst305_000A274B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().AddtoFaction(InstituteFaction)
InstituteMapMarker.AddToMap(True)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE Inst305QuestScript
Quest __temp = self as Quest
Inst305QuestScript kmyQuest = __temp as Inst305QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)
kmyquest.Inst305Layer = InputEnableLayer.Create()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(30)
Game.GetPlayer().AddItem(Inst305Note)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
radioEquipmentMarker.enable()
alias_radiopartsCrate.getReference().enable()
DirectorChair.SetActorOwner(NONE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

;Allow player to access reactor cell
Alias_ReactorAccessMarker.GetReference().Disable()

;move everybody to their places for scene
shaun.GetReference().MoveTo(Inst305ReactorFatherMarker)
AlanBinet.GetReference().MoveTo(BinetSpeechMarker.GetReference())
AllieFilmore.GetReference().Moveto(FilmoreSpeechMarker.GetReference())
If (LawrenceHiggs.GetActorReference()).IsDead() == False
If InstM03.IsRunning()==False
LawrenceHiggs.GetReference().MoveTo(HiggsSpeechMarker.GetReference())
endif
endif
if InstM03.IsRunning() ==False
NewtonOberly.GetReference().MoveTo(OberlySpeechMarker.GetReference())
endif
RosalindOrman.GetReference().MoveTo(OrmanSpeechMarker.GetReference())
EnricoThompson.GetReference().MoveTo(ThompsonSpeechMarker.GetReference())
DeanVolkert.GetReference().MoveTo(VolkertSpeechMarker.GetReference())

; hide the activation markers @ D.City radio equipment
utility.wait(5.0)
radioEquipmentMarker.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
Inst305FatherSpeechScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
MUSReward.Add()
;enable Diamond City Radio broadcasts
RadioDCInstBroadcast.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Inst305Stage90DirectorateScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; For Ferret - "Underground Undercover" hook for this event
; * Messenger appears to let the player know that Z1-14 wants to contact him
if ( RR201.IsRunning() )
  RR201.SetStage(1000)
endif


;Update Global for Radio News
RadioDCInst305Ready.SetValue((GameDaysPassed.GetValue() + 1))

Game.AddAchievement(11)

Inst303Post.Stop()
Inst305Post.Start()
Inst306.SetStage(10)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Inst305ReactorOnlineAV)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE Inst305QuestScript
Quest __temp = self as Quest
Inst305QuestScript kmyQuest = __temp as Inst305QuestScript
;END AUTOCAST
;BEGIN CODE
actor player = game.getPlayer()
player.removeItem(alias_radioparts_0_dials.getReference(), 1, TRUE)
player.removeItem(alias_radioparts_1_Tubes.getReference(), 1, TRUE)
player.removeItem(alias_radioparts_2_Buttons.getReference(), 1, TRUE)
kmyquest.ControlEnable()
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property Inst305Note Auto Const

ReferenceAlias Property ReactorElevatorRef Auto Const

Faction Property InstituteFaction Auto Const

ReferenceAlias Property AlanBinet Auto Const

ReferenceAlias Property RosalindOrman Auto Const

ReferenceAlias Property AllieFilmore Auto Const

ReferenceAlias Property LawrenceHiggs Auto Const

ReferenceAlias Property NewtonOberly Auto Const

ReferenceAlias Property EnricoThompson Auto Const

ReferenceAlias Property BinetSpeechMarker Auto Const

ReferenceAlias Property FilmoreSpeechMarker Auto Const

ReferenceAlias Property ThompsonSpeechMarker Auto Const

ReferenceAlias Property HiggsSpeechMarker Auto Const

ReferenceAlias Property OberlySpeechMarker Auto Const

ReferenceAlias Property OrmanSpeechMarker Auto Const

ReferenceAlias Property DeanVolkert Auto Const

ReferenceAlias Property VolkertSpeechMarker Auto Const

Scene Property Inst305FatherSpeechScene Auto Const

ObjectReference Property InstituteMapMarker Auto Const

Scene Property Inst305Stage90DirectorateScene Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCInst305Ready Auto Const

Quest Property Inst306 Auto Const

ObjectReference Property RadioEquipmentMarker Auto Const

ReferenceAlias Property Alias_RadioPartsCrate Auto Const

Quest Property InstM03 Auto Const

ReferenceAlias Property Alias_ReactorAccessMarker Auto Const

ReferenceAlias Property shaun Auto Const

ObjectReference Property Inst305ReactorFatherMarker Auto Const

ObjectReference Property DirectorChair Auto Const

MusicType Property MUSReward Auto Const

Quest Property RR201 Auto Const

GlobalVariable Property RadioDCInstBroadcast Auto Const Mandatory

ReferenceAlias Property Alias_RadioParts_0_Dials Auto Const Mandatory

ReferenceAlias Property Alias_RadioParts_1_Tubes Auto Const Mandatory

ReferenceAlias Property Alias_RadioParts_2_Buttons Auto Const Mandatory

ActorValue Property COMQC_Inst305ReactorOnlineAV Auto Const

Quest Property Inst305Post Auto Const Mandatory

Quest Property Inst303Post Auto Const Mandatory
