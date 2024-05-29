;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01Lair_MBattle_1130_Se_0100282C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE DLC01:DLC01LairQuestScript
DLC01:DLC01LairQuestScript kmyQuest = GetOwningQuest() as DLC01:DLC01LairQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.StartSparksInteract()
Mechanist.GetActorRef().PlayIdle(MechanistCommandSendingRobots)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Mechanist Auto Const

Idle Property MechanistCommandSendingRobots Auto Const Mandatory
