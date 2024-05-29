;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN092_EntryCombatScene_0001D80A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
Debug.trace("DN092 - Entry Scene Started & Holding")
preston.getReference().moveto(prestonSnipeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE DN092QuestScript
DN092QuestScript kmyQuest = GetOwningQuest() as DN092QuestScript
;END AUTOCAST
;BEGIN CODE
Debug.trace("DN092 - Entry Scene Player is inside, Holding for stage 11")
;raiderA.getActorReference().moveTo(raiderA.getActorReference().getLinkedRef(pLinkCustom02))
;raiderB.getActorReference().moveTo(raiderB.getActorReference().getLinkedRef(pLinkCustom02))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property raiderA Auto Const

ReferenceAlias Property raiderB Auto Const

Keyword Property pLinkCustom02 Auto Const

ReferenceAlias Property Preston Auto Const

ObjectReference Property prestonSnipeMarker Auto Const

ObjectReference Property MQ03PrestonMarker1 Auto Const
