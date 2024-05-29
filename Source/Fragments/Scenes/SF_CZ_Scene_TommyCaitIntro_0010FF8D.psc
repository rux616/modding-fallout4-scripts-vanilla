;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CZ_Scene_TommyCaitIntro_0010FF8D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Cait.GetActorRef().AddtoFaction(HasBeenCompanion)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE CZScript
CZScript kmyQuest = GetOwningQuest() as CZScript
;END AUTOCAST
;BEGIN CODE
(kmyquest.Tommy.GetActorReference() as BroadcastSpeakerActorScript).ToggleSpeakers(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Cait Auto Const

Faction Property HasBeenCompanion Auto Const
