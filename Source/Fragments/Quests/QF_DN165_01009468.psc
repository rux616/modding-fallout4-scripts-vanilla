;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN165_01009468 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;When the Prydwen arrives in the Commonwealth, lock and reset the dungeon
;to prepare it for BoSM02.
DN165_Quest_Disable.Disable()
DN165_Quest_Enable.Enable()
BostonAirportRuins01.Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Cell Property BostonAirportRuins01 Auto Const

ObjectReference Property DN165_Quest_Disable Auto Const

ObjectReference Property DN165_Quest_Enable Auto Const
