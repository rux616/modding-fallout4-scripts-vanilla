;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_RRM02GloryFollowsPackage_000D0129 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
; Make Glory a full follower for this section
akActor.GetActorBase().SetEssential(TRUE)
akActor.AddToFaction(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Change
Function Fragment_Change(Actor akActor)
;BEGIN CODE
; Make Glory normal again
akActor.GetActorBase().SetEssential(FALSE)
akActor.RemoveFromFaction(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property pPlayerFaction Auto Const
