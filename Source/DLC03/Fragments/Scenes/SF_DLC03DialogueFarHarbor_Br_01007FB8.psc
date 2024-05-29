;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03DialogueFarHarbor_Br_01007FB8 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
; If the player is being screwed by Allen, remove the overcharging
if ( GetOwningQuest().GetStageDone(410) )
 Game.GetPlayer().RemovePerk(pDLC03AllenMarkUpPerk)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property pDLC03AllenMarkUpPerk Auto Const Mandatory
