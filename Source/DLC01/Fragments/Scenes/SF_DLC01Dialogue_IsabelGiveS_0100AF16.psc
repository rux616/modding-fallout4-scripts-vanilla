;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01Dialogue_IsabelGiveS_0100AF16 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
If (DLC01Mechanist.GetItemCount(DLC01_ClothesMechanistArmor) > 0)
   DLC01Mechanist.RemoveItem(DLC01_ClothesMechanistArmor, 1, False, Game.GetPlayer())
   Utility.Wait(0.1)
EndIf

If (DLC01Mechanist.GetItemCount(DLC01_ClothesMechanistHelmet) > 0)
   DLC01Mechanist.RemoveItem(DLC01_ClothesMechanistHelmet, 1, False, Game.GetPlayer())
EndIf

GetOwningQuest().SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property DLC01_ClothesMechanistArmor Auto Const

Armor Property DLC01_ClothesMechanistHelmet Auto Const

Actor Property DLC01Mechanist Auto Const
