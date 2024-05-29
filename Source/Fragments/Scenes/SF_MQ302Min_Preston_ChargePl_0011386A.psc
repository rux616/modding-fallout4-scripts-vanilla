;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302Min_Preston_ChargePl_0011386A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE MQ302MinQuestScript
MQ302MinQuestScript kmyQuest = GetOwningQuest() as MQ302MinQuestScript
;END AUTOCAST
;BEGIN CODE
;MQ302.SetStage(700)
(Preston as TeleportReferenceAlias).TeleportOut()
kmyquest.TeleportFollowers(MQ302DogmeatInstituteTeleportRef, MQ302FollowerInstituteTeleportRef)
Utility.Wait(1.0)
Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, abVerbose=False)
Utility.Wait(4.0)
Game.GetPlayer().Moveto(PlayerRelayMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Preston Auto Const

ObjectReference Property PlayerRelayMarker Auto Const

ObjectReference Property LeaderRelayMarker Auto Const

Scene Property MQ302MinPreston_Sturges_Kid Auto Const

Quest Property MQ302 Auto Const

ObjectReference Property MQ302DogmeatInstituteTeleportRef Auto Const

ObjectReference Property MQ302FollowerInstituteTeleportRef Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const Mandatory
