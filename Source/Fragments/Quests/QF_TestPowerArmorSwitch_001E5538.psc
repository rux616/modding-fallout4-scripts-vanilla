;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestPowerArmorSwitch_001E5538 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor Maxson = Alias_Maxson.GetActorRef()
Maxson.SwitchToPowerArmor(BoSMarshal_MaxsonPowerArmor)
Maxson.MoveTo(Game.GetPlayer())
Maxson.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoSMarshal_MaxsonPowerArmor Auto Const

ReferenceAlias Property Alias_Maxson Auto Const
