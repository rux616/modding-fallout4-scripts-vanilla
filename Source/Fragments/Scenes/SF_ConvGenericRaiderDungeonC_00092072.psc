;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_ConvGenericRaiderDungeonC_00092072 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;Set Raider Convo Rival global back to -1
RaiderConvoLocationRival.SetValue(-1)

;ConvGenericRaiderDungeonCleared.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
;Game.Getplayer().moveto(Raider01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property RaiderConvoLocationRival Auto Const

ReferenceAlias Property Raider01 Auto Const

Quest Property ConvGenericRaiderDungeonCleared Auto Const
