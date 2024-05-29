;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04RaidSelectQuest_001a_0102E814 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
;Reset Shank being sent to workshop
kmyquest.bShankHasWorkshopTarget = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
Actor ShankREF = Shank.GetActorRef()
Location ShankWorkshopTarget = DLC04WorkshopParent.AddActorToWorkshopPlayerChoice(ShankREF, true, true)

if ShankWorkshopTarget != none
  kmyquest.bShankHasWorkshopTarget = true
  debug.trace(self + " Shank reeval package")
  ShankRef.EvaluatePackage(true)

  ;If we're at the happiness section of the quest, 
  if DLC04MQ04.GetStageDone(270) && !DLC04MQ04.GetStageDone(300)
    (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).StartHappinessObjectiveUpdateTimer(1.0)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory

ReferenceAlias Property Shank Auto Const Mandatory

RefCollectionAlias Property GoHomeActors Auto Const Mandatory

Quest Property DLC04MQ04 Auto Const Mandatory
