;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CIS_RacialComments_Valent_010604D1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE CIS_RacialComments_DialogCountScript
CIS_RacialComments_DialogCountScript kmyQuest = GetOwningQuest() as CIS_RacialComments_DialogCountScript
;END AUTOCAST
;BEGIN CODE
if pNick.GetRef().GetCurrentLocation() != pGoodneighbor \
&& \
pNick.GetRef().GetCurrentLocation() != pDiamondCity
  kmyQuest.iDialogueCount += 1
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pNick Auto Const

Location Property pGoodneighbor Auto Const

Location Property pDiamondCity Auto Const
