;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06OverseerHandler_01003CF3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06OverseerHandlerScript
Quest __temp = self as Quest
DLC06:DLC06OverseerHandlerScript kmyQuest = __temp as DLC06:DLC06OverseerHandlerScript
;END AUTOCAST
;BEGIN CODE
Debug.Trace("Stage 100")

kmyQuest.FillVariables()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Debug.Trace("Happy!")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
