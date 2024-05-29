;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03DialogueNakanoReside_01003EC6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;If Kasumi agreed to come home, move her there when the player changes location away from
;the Nakano residence and DLC03MQPostQuest stage 160 is done
;Also set the 'KasumiHome' global, which conditions her home packages

if DLC03MQPostQuest.GetStageDone(160) == True
   DLC03KasumiRef.MoveTo(DLC03KasumiReturnMarker)
   DLC03KasumiHomeGlobal.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQPostQuest Auto Const Mandatory

ObjectReference Property DLC03KasumiRef Auto Const Mandatory

GlobalVariable Property DLC03KasumiHomeGlobal Auto Const Mandatory

ObjectReference Property DLC03KasumiReturnMarker Auto Const Mandatory
