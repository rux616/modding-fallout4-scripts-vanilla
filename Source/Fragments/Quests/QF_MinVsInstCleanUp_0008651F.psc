;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinVsInstCleanUp_0008651F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;clean up actors involved in MinVsInst
;fired off in story manager when player leaves Graygarden Homestead

Enrico.GetReference().Moveto(EnricoMarker.GetReference())
Enrico.GetActorReference().SetOutfit(InstituteScientist)
if Wallace.GetReference().IsDisabled() == True
WallaceDead.GetReference().Disable()
Wallace.GetReference().Enable()
endif
Wallace.GetActorReference().SetUnconscious(False)
Wallace.GetActorReference().AddToFaction(InstituteFaction)
Wallace.GetActorReference().SetCrimeFaction(CrimeInstitute)
Wallace.GetReference().MoveTo(WallaceMarker.GetReference())
InstWallaceMoved.SetValue(1)
Wallace.GetActorReference().SetOutfit(InstituteScientist)
Wallace.GetActorReference().EvaluatePackage()

MinVsInst.Stop()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Outfit Property InstituteScientist Auto Const

Faction Property InstituteFaction Auto Const

ReferenceAlias Property Enrico Auto Const

ReferenceAlias Property Wallace Auto Const

ReferenceAlias Property EnricoMarker Auto Const

ReferenceAlias Property WallaceMarker Auto Const

GlobalVariable Property InstWallaceMoved Auto Const

Quest Property MinVsInst Auto Const

ReferenceAlias Property WallaceDead Auto Const

Faction Property CrimeInstitute Auto Const Mandatory
