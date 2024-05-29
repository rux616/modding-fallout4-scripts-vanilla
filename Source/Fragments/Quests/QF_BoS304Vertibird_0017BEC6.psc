;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS304Vertibird_0017BEC6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Store Actors
Actor Pilot = Alias_BoS304VBPilot.GetActorRef()
Actor Gunner =Alias_BoS304VBGunner.GetActorRef()

Pilot.Enable()
Pilot.IgnoreFriendlyHits()
Pilot.EvaluatePackage()

Gunner.Enable()
Gunner.IgnoreFriendlyHits()
Gunner.EvaluatePackage()

Alias_BoS304VB.getActorRef().IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Store Actors
Actor Pilot = Alias_BoS304VBPilot.GetActorRef()
Actor Gunner =Alias_BoS304VBGunner.GetActorRef()

Pilot.Enable()
Pilot.IgnoreFriendlyHits()
Pilot.EvaluatePackage()

Gunner.Enable()
Gunner.IgnoreFriendlyHits()
Gunner.EvaluatePackage()

Alias_BoS304VB.getActorRef().IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;set by stage 1000 of DNPrime_BoS304 quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoS304VBPilot Auto Const

ReferenceAlias Property Alias_BoS304VBGunner Auto Const

ReferenceAlias Property Alias_BoS304VB Auto Const Mandatory
