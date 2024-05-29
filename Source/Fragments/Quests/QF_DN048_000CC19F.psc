;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN048_000CC19F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Enable the exterior super mutants if the player doesn't trigger alarm
DN048_EnableExt.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;unlock the doors to open up the layout and let the supermutants in
DN048_CircuitBreaker.Activate(DN048_CircuitBreaker)
DN048_Klaxon.Enable()
pDN048FrontLock.Unlock()
pDN048BackLock.Unlock()

;Enable the supermutants
pDN048EnableMarker.Enable()

;Disable exterior supermutants
DN048_EnableExt.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DN048_PlayerSpeech.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pDN048FrontLock Auto Const

ObjectReference Property pDN048BackLock Auto Const

ObjectReference Property pDN048EnableMarker Auto Const

Scene Property DN048_PlayerSpeech Auto Const

ObjectReference Property DN048_CircuitBreaker Auto Const

ObjectReference Property DN048_Klaxon Auto Const

ObjectReference Property DN048_EnableExt Auto Const Mandatory
