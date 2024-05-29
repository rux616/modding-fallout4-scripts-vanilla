;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CIS_RacialComments_Hancoc_00183D6B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE CIS_RacialComments_DialogCountScript
CIS_RacialComments_DialogCountScript kmyQuest = GetOwningQuest() as CIS_RacialComments_DialogCountScript
;END AUTOCAST
;BEGIN CODE
if pHancock.GetRef().GetCurrentLocation() != pGoodneighbor
  pHancockRacialCount.SetValue(pHancockRacialCount.GetValue() + 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pHancock Auto Const

Location Property pGoodneighbor Auto Const

GlobalVariable Property pHancockRacialCount Auto Const
