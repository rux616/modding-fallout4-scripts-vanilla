;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst303_0002B4E9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().AddToFaction(InstituteFaction)
InstituteMapMarker.AddToMap(true)

(DialogueInstitute as DialogueInstituteQuestScript).AlanGreeted=1
(DialogueInstitute as DialogueInstituteQuestScript).AllieGreeted=1
(DialogueInstitute as DialogueInstituteQuestScript).ClaytonGreeted=1
(DialogueInstitute as DialogueInstituteQuestScript).MadisonGreeted=1
(DialogueInstitute as DialogueInstituteQuestScript).JustinGreeted=1


;Move Directorate Actors to the boardroom

Allie.GetReference().Moveto(BoardroomMarker2)
Allie.GetActorReference().EvaluatePackage()
Clayton.GetReference().MoveTo(BoardroomMarker2)
Clayton.GetActorReference().EvaluatePackage()
;Make sure Doctor Li hasn't been poached by BoS
if BoS203.GetStageDone(255) == 0
Madison.GetReference().MoveTo(BoardroomMarker1)
Madison.GetActorReference().EvaluatePackage()
else
Evan.GetReference().MoveTo(BoardroomMarker1)
Evan.GetActorReference().EvaluatePackage()
endif

DirectorChair.GetReference().BlockActivation()

;Finally check if Justin has been removed in InstM02
If InstM02.GetStageDone(1800) == 0
Justin.GetReference().Moveto(BoardroomMarker1)
Justin.GetActorReference().EvaluatePackage()
else
Alana.GetReference().MoveTo(BoardroomMarker1)
Alana.GetActorReference().EvaluatePackage()
endif
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Inst303DirectoratePreSceneLoop.Start()

; re-enable encounters near CIT where Father was talking to player during Inst302
CITNearbyEncountersMarker.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;if for any reason pre-scene loop has stopped, kick-start the directorate meeting

if Inst303DirectoratePreSceneLoop.IsPlaying() == False
Inst303DirectorateOpeningScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
DirectorChair.GetReference().BlockActivation(False)

;update stage for kid synth conversations
DialogueInstituteShaunKid.SetStage(30)

; Update Global for Radio News
;RadioDCInst303Ready.SetValue((GameDaysPassed.GetValue() + 1))

;reward xp
;Game.RewardPlayerXP(XPFactionFinal.GetValue() as int)

;Run whichever quest comes next

if InstMassFusion.GetStage() < 300
if InstMassFusion.GetStageDone(5) == 0
InstMassFusion.SetStage(10)
endif
else
MinVsInst.SetStage(10)
endif

Inst303Post.Start()
CompleteAllObjectives()

;start InstM02 only if RR quest hasn't been completed

if RR102.GetStageDone(800) == False
     InstM02.Start()
     RR102.SetStage(1050)
endif

InstM03Starter.Start()

Game.AddAchievement(10)

;Make X6-88 available as a companion
(CompanionX6_88Ref as Actor).SetAvailableToBeCompanion()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property InstM03 Auto Const

ReferenceAlias Property Allie Auto Const

ReferenceAlias Property Evan Auto Const

ReferenceAlias Property Madison Auto Const

ReferenceAlias Property Justin Auto Const

Quest Property BoS203 Auto Const

ObjectReference Property BoardroomMarker1 Auto Const

ObjectReference Property BoardroomMarker2 Auto Const

ReferenceAlias Property Clayton Auto Const

Quest Property InstM02 Auto Const

ReferenceAlias Property Alana Auto Const

Scene Property Inst303DirectoratePreSceneLoop Auto Const

Faction Property InstituteFaction Auto Const

Quest Property pRR201 Auto Const

ObjectReference Property InstituteMapMarker Auto Const

Quest Property InstMassFusion Auto Const

Quest Property MinVsInst Auto Const

Quest Property DialogueInstitute Auto Const

Scene Property Inst303DirectorateOpeningScene Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Quest Property RR102 Auto Const

Quest Property InstM03Starter Auto Const

Quest Property DialogueInstituteShaunKid Auto Const

ObjectReference Property CompanionX6_88Ref Auto Const

ReferenceAlias Property shaun Auto Const

GlobalVariable Property RadioDCInst303Ready Auto Const

GlobalVariable Property GameDaysPassed Auto Const

ObjectReference Property CITNearbyEncountersMarker Auto Const

ReferenceAlias Property DirectorChair Auto Const

Quest Property Inst303Post Auto Const Mandatory
