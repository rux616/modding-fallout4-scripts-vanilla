;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RR303_1400a_DeaconEscape_0011BC47 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndSceneGhostCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
; Add back your current companion 
Alias_PrydwenCompanion.GetActorRef().AllowCompanion(true)

; Move the companions back into the vertibird
kmyquest.CompanionsShouldSnapIntoVertibird()

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_22_End
Function Fragment_Phase_22_End()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
; Move the companions back into the vertibird
kmyquest.CompanionsShouldExitVertibird()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Vertibird Auto Const

ReferenceAlias Property Alias_PrydwenCompanion Auto Const
