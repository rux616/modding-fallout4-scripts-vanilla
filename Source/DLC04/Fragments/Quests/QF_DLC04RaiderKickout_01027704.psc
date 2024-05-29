;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RaiderKickout_01027704 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;This is applied during DLC04MQ01, right before Colter fight ends
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
if Alias_DLC04KONisha.GetActorRef().IsDead() == 0
SetObjectiveDisplayed(10)
endif
if Alias_DLC04KOMags.GetActorRef().IsDead() == 0
SetObjectiveDisplayed(20)
endif
if Alias_DLC04KOWilliam.GetActorRef().IsDead() == 0
SetObjectiveDisplayed(30)
endif
if Alias_DLC04KOMason.GetActorRef().IsDead() == 0
SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_01
Function Fragment_Stage_0015_Item_01()
;BEGIN CODE
if Alias_DLC04KONisha.GetActorRef().IsDead() == 0
SetObjectiveDisplayed(10)
endif
if Alias_DLC04KOMags.GetActorRef().IsDead() == 0
SetObjectiveDisplayed(20)
endif
if Alias_DLC04KOWilliam.GetActorRef().IsDead() == 0
SetObjectiveDisplayed(30)
endif
if Alias_DLC04KOMason.GetActorRef().IsDead() == 0
SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KOQuestScript
Quest __temp = self as Quest
DLC04:DLC04KOQuestScript kmyQuest = __temp as DLC04:DLC04KOQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DLC04SendKickOut()
if Alias_DLC04KONisha.GetActorRef().IsDead() == false
	SetObjectiveDisplayed(10)
endif
if Alias_DLC04KOMags.GetActorRef().IsDead() == false
 	SetObjectiveDisplayed(20)
endif
if Alias_DLC04KOWilliam.GetActorRef().IsDead() == false
 	SetObjectiveDisplayed(30)
endif
if Alias_DLC04KOMason.GetActorRef().IsDead() == false
 	SetObjectiveDisplayed(40)
endif

; Set stage in DLC04PackFights that will set the animals to be reasonable enemies.
DLC04PackFights.SetStage(75)

; Disable Captives and Prisoners in Fizztop and Bradberton Amphitheater.
If Alias_DLC04KoPlayer.GetActorRef().IsInLocation(DLC04FizztopMountainLocation) == 0
     DLC04DisciplesFizztopDisablePrisonersRef.Disable()
EndIf
If Alias_DLC04KOPlayer.GetActorRef().IsInLocation(DLC04BradbertonAmphitheaterLocation) == 0
     DLC04PackAmphitheaterDisableCaptivesRef.Disable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KOQuestScript
Quest __temp = self as Quest
DLC04:DLC04KOQuestScript kmyQuest = __temp as DLC04:DLC04KOQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10,1)
kmyQuest.DLC04CountBoss()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KOQuestScript
Quest __temp = self as Quest
DLC04:DLC04KOQuestScript kmyQuest = __temp as DLC04:DLC04KOQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20,1)
kmyQuest.DLC04CountBoss()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KOQuestScript
Quest __temp = self as Quest
DLC04:DLC04KOQuestScript kmyQuest = __temp as DLC04:DLC04KOQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30,1)
kmyQuest.DLC04CountBoss()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KOQuestScript
Quest __temp = self as Quest
DLC04:DLC04KOQuestScript kmyQuest = __temp as DLC04:DLC04KOQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40,1)
kmyQuest.DLC04CountBoss()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DLC04KONisha Auto Const Mandatory

ReferenceAlias Property Alias_DLC04KOMags Auto Const Mandatory

ReferenceAlias Property Alias_DLC04KOWilliam Auto Const Mandatory

ReferenceAlias Property Alias_DLC04KOMason Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

Quest Property DLC04PackFights Auto Const Mandatory

ObjectReference Property DLC04PackAmphitheaterDisableCaptivesRef Auto Const Mandatory

ObjectReference Property DLC04DisciplesFizztopDisablePrisonersRef Auto Const Mandatory

Location Property DLC04BradbertonAmphitheaterLocation Auto Const Mandatory

Location Property DLC04FizztopMountainLocation Auto Const Mandatory

ReferenceAlias Property Alias_DLC04KOPlayer Auto Const Mandatory
