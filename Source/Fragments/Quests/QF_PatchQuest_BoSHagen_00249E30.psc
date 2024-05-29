;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_PatchQuest_BoSHagen_00249E30 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;patch 1.3 - 89109 - remove fast travel disable input layers if their triggers aren't loaded

;for BOS302, also check the quest
If BoS302DFTTRef.Is3DLoaded() == False
  (BoS302DFTTRef as BoS302_DisableFastTravelTrigger).RemoveInputLayer()
EndIf

If MQ106_DisableFastTravelREF.Is3DLoaded() == False
  (MQ106_DisableFastTravelREF as MQ106_DisableFastTravelScript).RemoveInputLayer()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoS302DFTTRef Auto Const Mandatory

ObjectReference Property MQ106_DisableFastTravelREF Auto Const Mandatory

Quest Property BoS302 Auto Const Mandatory
