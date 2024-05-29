;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03CoA_DialogueNucleus_0102B592 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_DialogueNucleusScript
DLC03:DLC03CoA_DialogueNucleusScript kmyQuest = GetOwningQuest() as DLC03:DLC03CoA_DialogueNucleusScript
;END AUTOCAST
;BEGIN CODE
;Turn off Ware Root access
kmyquest.bHasWareRoot = false

;Update timer
kmyquest.fCurrentWareRootTime = Utility.GetCurrentGameTime() + kmyquest.fDaysUntilWareRoot

;Give Ware Root
Game.GetPlayer().AddItem(DLC03CoA_WareRoot, 4)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property DLC03CoA_WareRoot Auto Const Mandatory
