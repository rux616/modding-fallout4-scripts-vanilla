;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS13ColetteRevengePaul_0008E9EE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Colette kills Paul if he's not currently loaded
actor paul = Alias_PaulPembroke.GetActorRef()
paul.GetActorBase().SetProtected(false)
paul.GetActorBase().SetEssential(false)
if paul.Is3DLoaded() == false
	paul.kill(alias_Colette.GetActorRef())
else
	Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Colette Auto Const

ReferenceAlias Property Alias_InteriorCenterMarker Auto Const

Faction Property MS13ColetteFaction Auto Const

Faction Property PlayerFaction Auto Const

ReferenceAlias Property Alias_PaulPembroke Auto Const
