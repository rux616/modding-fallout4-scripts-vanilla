;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:TopicInfos:TIF_DLC06WorkshopParent_010054D8 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE dlc06:dlc06workshopparent
dlc06:dlc06workshopparent kmyQuest = GetOwningQuest() as dlc06:dlc06workshopparent
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartGenericBarberSurgery(akSpeaker.GetDialogueTarget())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
