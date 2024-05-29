;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03FarHarborFF03c_01048683 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborFF03cScript
DLC03:DLC03FarHarborFF03cScript kmyQuest = GetOwningQuest() as DLC03:DLC03FarHarborFF03cScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.bAskedAboutHealth = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
