;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:VRWorkshops:PRKF_VRWorkshopShared_PerkOp_0100003F Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
If(akTargetRef.GetLinkedRef(LinkKeyword))
	akTargetRef.GetLinkedRef(LinkKeyword).Activate(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkKeyword Auto Const Mandatory
