;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS101SceneStage020_Escor_00192E69 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if BoS101.GetStageDone(50) == 0
BoS101.SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
Danse.GetActorRef().PlayIdle(IdleEquipHelmet)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoS101 Auto Const

LeveledItem Property LL_Armor_Power_T60_Set_BOSPaladin_HelmetOnly Auto Const

ReferenceAlias Property Danse Auto Const

Idle Property IdleEquipHelmet Auto Const
