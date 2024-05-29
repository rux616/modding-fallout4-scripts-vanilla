;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CIS_ChatWithNPC_Piper_Sce_0018310F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
Location PiperLoc = pPiper.GetRef().GetCurrentLocation()

if PiperLoc == pFarm01Location || PiperLoc == pFarm02Location || PiperLoc == pFarm03Location || PiperLoc == pFarm04Location || PiperLoc == pFarm05Location || PiperLoc == pFarm06Location

  pLineCount_Farms.SetValue(pLineCount_Farms.GetValue() + 1)

elseif PiperLoc == pBunkerHillLocation || pBunkerHillLocation.IsChild(PiperLoc)

  pLineCount_BHill.SetValue(pLineCount_BHill.GetValue() + 1)

elseif PiperLoc == pDiamondCityLocation || pDiamondCityLocation.IsChild(PiperLoc)

  pLineCount_DCity.SetValue(pLineCount_DCity.GetValue() + 1)

elseif PiperLoc == pGoodneighborLocation || pGoodneighborLocation.IsChild(PiperLoc)

  pLineCount_GNeighbor.SetValue(pLineCount_GNeighbor.GetValue() + 1)

elseif PiperLoc == pVault81Location || pVault81Location.IsChild(PiperLoc)

  pLineCount_Vault81.SetValue(pLineCount_Vault81.GetValue() + 1)

endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property pFarm01Location Auto Const

Location Property pFarm02Location Auto Const

Location Property pFarm03Location Auto Const

Location Property pFarm04Location Auto Const

Location Property pFarm05Location Auto Const

Location Property pFarm06Location Auto Const

Location Property pDiamondCityLocation Auto Const

Location Property pGoodneighborLocation Auto Const

Location Property pVault81Location Auto Const

Location Property pBunkerHillLocation Auto Const

GlobalVariable Property pLineCount_BHill Auto Const

GlobalVariable Property pLineCount_DCity Auto Const

GlobalVariable Property pLineCount_Farms Auto Const

GlobalVariable Property pLineCount_GNeighbor Auto Const

GlobalVariable Property pLineCount_Vault81 Auto Const

ReferenceAlias Property pPiper Auto Const
