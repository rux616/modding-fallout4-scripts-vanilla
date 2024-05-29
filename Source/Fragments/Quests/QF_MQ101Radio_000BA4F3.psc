;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ101Radio_000BA4F3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_PlayerHouseRadio.GetRef().SetRadioOn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
RadioSanctuaryHillsPrewarScene.Stop()
;disable the transmitter
Alias_Transmitter.GetRef().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PlayerHouseRadio Auto Const

Scene Property RadioSanctuaryHillsPrewarScene Auto Const

ReferenceAlias Property Alias_Transmitter Auto Const
