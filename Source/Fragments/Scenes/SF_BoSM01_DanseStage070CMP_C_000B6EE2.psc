;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSM01_DanseStage070CMP_C_000B6EE2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE bosm01questscript
bosm01questscript kmyQuest = GetOwningQuest() as bosm01questscript
;END AUTOCAST
;BEGIN CODE
kMyQuest.BeginDanseScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE bosm01questscript
bosm01questscript kmyQuest = GetOwningQuest() as bosm01questscript
;END AUTOCAST
;BEGIN CODE
kMyQuest.EndDanseScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
;Move the Forcegreet marker to Danse and EVP.
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
BoSM01_CMPDanseWaitMarker.MoveTo(Danse)
Danse.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoSPaladinDanse Auto Const

ObjectReference Property BoSM01_CMPDanseWaitMarker Auto Const

ReferenceAlias Property Alias_Companion Auto Const
