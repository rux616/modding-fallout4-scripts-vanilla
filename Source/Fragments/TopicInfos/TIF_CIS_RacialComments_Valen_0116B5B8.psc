;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CIS_RacialComments_Valen_0116B5B8 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE CIS_RacialComments_DialogCountScript
CIS_RacialComments_DialogCountScript kmyQuest = GetOwningQuest() as CIS_RacialComments_DialogCountScript
;END AUTOCAST
;BEGIN CODE
kmyquest.iBrotherhoodDialogueCounter = 2
RacialCommentCount_Nick_MostRecent_BoS.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property RacialCommentCount_Nick_MostRecent_BoS Auto Const
