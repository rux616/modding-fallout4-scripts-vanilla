;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_ADV011_01032D34 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;activate the queen
ObjectReference myMarker = Alias_QueenEnableMarker.getReference()
myMarker.enableNoWait()
myMarker.activate(myMarker, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_QueenEnableMarker Auto Const Mandatory
