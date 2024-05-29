;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302BoS_Maxson_ChargePla_00112E46 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE MQ302BoSQuestScript
MQ302BoSQuestScript kmyQuest = GetOwningQuest() as MQ302BoSQuestScript
;END AUTOCAST
;BEGIN CODE
;MQ302.SetStage(700)
(Maxson as TeleportReferenceAlias).TeleportOut()
kmyquest.TeleportFollowers(MQ302DogmeatInstituteTeleportRef, MQ302FollowerInstituteTeleportRef)
Utility.Wait(0.7)
Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, abVerbose=False)
Utility.Wait(4.0)
Game.GetPlayer().Moveto(PlayerRelayMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Maxson Auto Const

Quest Property MQ302 Auto Const

ObjectReference Property LeaderRelayMarker Auto Const

ObjectReference Property PlayerRelayMarker Auto Const

Scene Property MQ302BoS_Maxson_Ingram_Kid Auto Const

ObjectReference Property MQ302DogmeatInstituteTeleportRef Auto Const

ObjectReference Property MQ302FollowerInstituteTeleportRef Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const Mandatory
