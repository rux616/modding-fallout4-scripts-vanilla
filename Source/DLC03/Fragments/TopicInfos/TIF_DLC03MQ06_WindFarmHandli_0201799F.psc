;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03MQ06_WindFarmHandli_0201799F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06_WindFarmHandlingScript
DLC03:DLC03MQ06_WindFarmHandlingScript kmyQuest = GetOwningQuest() as DLC03:DLC03MQ06_WindFarmHandlingScript
;END AUTOCAST
;BEGIN CODE
kmyquest.iAveryExtortion = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
