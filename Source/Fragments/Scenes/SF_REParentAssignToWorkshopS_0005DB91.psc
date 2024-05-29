;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_REParentAssignToWorkshopS_0005DB91 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE reparentscript
reparentscript kmyQuest = GetOwningQuest() as reparentscript
;END AUTOCAST
;BEGIN CODE
; clear alias
kmyQuest.AddToWorkshopAssignableAlias(NONE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE reparentscript
reparentscript kmyQuest = GetOwningQuest() as reparentscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ShowWorkshopAssignmentMenu()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
