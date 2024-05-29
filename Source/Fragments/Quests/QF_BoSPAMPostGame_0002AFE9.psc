;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSPAMPostGame_0002AFE9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;PAM Post Quest Maintenance
RRKickoutPAM.Clear()
RRDialoguePAM.Clear()
Alias_BoSPAMPost.GetActorRef().RemoveFromFaction(RailroadFaction)
Alias_BoSPAMPost.GetActorRef().AddToFaction(BrotherhoodofSteelFaction)
Alias_BoSPAMPost.GetActorRef().MoveTo(BoSPAMPostGameMarker)
Alias_BoSPAMPost.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoSPAMPost Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

ReferenceAlias Property RRKickoutPAM Auto Const

ReferenceAlias Property RRDialoguePAM Auto Const

Faction Property RailroadFaction Auto Const

ObjectReference Property BoSPAMPostGameMarker Auto Const
