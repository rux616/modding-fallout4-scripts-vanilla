;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CIS_ChatWithNPC_Codsworth_00075E20 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
Location CodsworthLoc = pCodsworth.GetRef().GetCurrentLocation()
if CodsworthLoc == pFarm01Location || CodsworthLoc == pFarm02Location || CodsworthLoc == pFarm03Location || CodsworthLoc == pFarm04Location || CodsworthLoc == pFarm05Location || CodsworthLoc == pFarm06Location

  pLineCount_Farms.SetValue(pLineCount_Farms.GetValue() + 1)

elseif CodsworthLoc == pBunkerHillLocation

  pLineCount_BHill.SetValue(pLineCount_BHill.GetValue() + 1)

elseif CodsworthLoc == pDiamondCityLocation

  pLineCount_DCity.SetValue(pLineCount_DCity.GetValue() + 1)

elseif CodsworthLoc == pGoodneighborLocation

  pLineCount_GNeighbor.SetValue(pLineCount_GNeighbor.GetValue() + 1)

elseif CodsworthLoc == pVault81Location

  pLineCount_Vault81.SetValue(pLineCount_Vault81.GetValue() + 1)

endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property pBunkerHillLocation Auto Const

Location Property pDiamondCityLocation Auto Const

Location Property pFarm01Location Auto Const

Location Property pFarm02Location Auto Const

Location Property pFarm03Location Auto Const

Location Property pFarm04Location Auto Const

Location Property pFarm05Location Auto Const

Location Property pFarm06Location Auto Const

Location Property pGoodneighborLocation Auto Const

GlobalVariable Property pLineCount_BHill Auto Const

GlobalVariable Property pLineCount_DCity Auto Const

GlobalVariable Property pLineCount_Farms Auto Const

GlobalVariable Property pLineCount_GNeighbor Auto Const

GlobalVariable Property pLineCount_Vault81 Auto Const

ReferenceAlias Property pCodsworth Auto Const

Location Property pVault81Location Auto Const
