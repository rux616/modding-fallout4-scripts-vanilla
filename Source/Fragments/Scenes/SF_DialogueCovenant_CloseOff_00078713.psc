;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueCovenant_CloseOff_00078713 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
Utility.Wait(1.0)
pMS17ShopDoor.SetOpen(false)
pMS17ShopDoor.Lock()
pMS17ShopDoor.SetFactionOwner(pCovenantFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pMS17ShopDoor Auto Const

ActorBase Property pMS17PennyFitzgerald Auto Const

Faction Property pCovenantFaction Auto Const
