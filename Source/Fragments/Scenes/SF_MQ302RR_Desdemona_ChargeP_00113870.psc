;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302RR_Desdemona_ChargeP_00113870 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE mq302rrquestscript
mq302rrquestscript kmyQuest = GetOwningQuest() as mq302rrquestscript
;END AUTOCAST
;BEGIN CODE
;MQ302.SetStage(700)
(Desdemona as TeleportReferenceAlias).TeleportOut()
kmyquest.TeleportFollowers(MQ302DogmeatInstituteTeleportRef, MQ302FollowerInstituteTeleportRef)
Utility.Wait(1.0)
Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, abVerbose=False)
Utility.Wait(4.0)
Game.GetPlayer().Moveto(PlayerRelayMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Desdemona Auto Const

ObjectReference Property LeaderRelayMarker Auto Const

ObjectReference Property PlayerRelayMarker Auto Const

Quest Property MQ302 Auto Const

Scene Property MQ302RR_Desdemona_Tom_Kid Auto Const

ObjectReference Property MQ302DogmeatInstituteTeleportRef Auto Const

ObjectReference Property MQ302FollowerInstituteTeleportRef Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const Mandatory
