;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CIS_RacialComments_Valent_00183D6C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE CIS_RacialComments_DialogCountScript
CIS_RacialComments_DialogCountScript kmyQuest = GetOwningQuest() as CIS_RacialComments_DialogCountScript
;END AUTOCAST
;BEGIN CODE
if pNick.GetRef().GetCurrentLocation() != pGoodneighbor \
&& \
pNick.GetRef().GetCurrentLocation() != pDiamondCity
  pRacialCommentCount_Nick.SetValue(pRacialCommentCount_Nick.GetValue() + 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pNick Auto Const

Location Property pGoodneighbor Auto Const

Location Property pDiamondCity Auto Const

GlobalVariable Property pRacialCommentCount_Nick Auto Const
