;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborFF03c_Misc_01048645 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
if ( pDLC03FarHarborFF03c.GetStageDone(100) )
  Stop()
else
  SetObjectiveDisplayed(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDLC03FarHarborFF03a Auto Const Mandatory

Quest Property pDLC03FarHarborFF03b Auto Const Mandatory

Quest Property pDLC03FarHarborFF03c Auto Const Mandatory
