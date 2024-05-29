;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN165_00112D10 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;If the player entered the ruins as part of BoSM02, do nothing.
;Otherwise, revert to the prequest state to make the dungeon explorable again.
if (!BoSM02.GetStageDone(199))
     DN165_Quest_Disable.Enable()
     DN165_Quest_Enable.Disable()
     BostonAirportRuins01.Reset()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;When the Prydwen arrives in the Commonwealth, lock and reset the dungeon to
;prepare it for BoSM02.
if (!GetStageDone(11))
     DN165_Quest_Disable.Disable()
     DN165_Quest_Enable.Enable()
     BostonAirportRuins01.Reset()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Cell Property BostonAirportRuins01 Auto Const

ObjectReference Property DN165_Quest_Disable Auto Const

ObjectReference Property DN165_Quest_Enable Auto Const

ObjectReference Property BoSKnightRylanCommentaryRef Auto Const

Quest Property BoSM02 Auto Const

ObjectReference Property BostonAirportRuinsMapMarkerRef Auto Const

Scene Property DN165_PeoplemoverRadioScene Auto Const
