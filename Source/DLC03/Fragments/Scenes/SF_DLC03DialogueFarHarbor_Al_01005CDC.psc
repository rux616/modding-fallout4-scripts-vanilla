;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03DialogueFarHarbor_Al_01005CDC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
; You can talk with Allen about the Children
pDLC03AllenCanTalkAboutChildren.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueFarHarborScript
DLC03:DLC03DialogueFarHarborScript kmyQuest = GetOwningQuest() as DLC03:DLC03DialogueFarHarborScript
;END AUTOCAST
;BEGIN CODE
; If the player is being screwed by Allen, 
; remove the over charging
if ( GetOwningQuest().GetStageDone(410) )
 kmyQuest.RemoveAllenMarkUp()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property pDLC03AllenMarkUpPerk Auto Const Mandatory

GlobalVariable Property pDLC03AllenCanTalkAboutChildren Auto Const Mandatory
