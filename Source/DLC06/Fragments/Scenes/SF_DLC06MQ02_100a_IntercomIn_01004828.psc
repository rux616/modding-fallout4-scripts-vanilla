;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Scenes:SF_DLC06MQ02_100a_IntercomIn_01004828 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
; If you aren't in Vault 88 - progress the quest
if ( Game.GetPlayer().GetCurrentLocation() != pDLC06Vault88Location )
  GetOwningQuest().SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property pDLC06Vault88Location Auto Const Mandatory
