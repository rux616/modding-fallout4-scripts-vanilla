;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN130_01002865 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;BoS01 - Set when Danse unlocks the police station doors.

;Just unlock the doors.
BoSPoliceStationFrontDoor.Unlock()
BoSPoliceStationRoofDoor.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;BoS02 - Set when the player is away from the base during the quest (retrieving the comm gear?).

;Set all prior stages to make this quickstart-safe.
SetStage(10)

;Update the enable state for the base.
;Reduce beds to 3, open up the garage, adjust clutter.
BoSPoliceStationGarageDoor.Unlock()
DN130_BoS02_Enable.Enable()
DN130_BoS02_EnableTemporarily.Enable()
DN130_BoS02_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;MQ07 - Set when MQ07 (Enemy of my Enemy) starts.

;Set all prior stages to make this quickstart-safe.
SetStage(20)

;Make cosmetic adjustments to clutter.
DN130_MQ07_Enable.Enable()
DN130_MQ07_EnableTemporarily.Enable()
DN130_MQ07_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;BoS03 - Set when BoS03 starts.

;Set all prior stages to make this quickstart-safe.
SetStage(30)

;Pack up the base.
DN130_BoS02_EnableTemporarily.Disable()
DN130_MQ07_EnableTemporarily.Disable()

DN130_BoS03_Enable.Enable()
DN130_BoS03_EnableTemporarily.Enable()
DN130_BoS03_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
;BoS03 - Set when the player approaches the police station during BoS03.

;Set all prior stages to make this quickstart-safe.
SetStage(40)

;Vertibird comes in for a landing.
DN130TempVertibird.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0049_Item_00
Function Fragment_Stage_0049_Item_00()
;BEGIN CODE
;BoS03 - Set when the player takes the vertibird to the Prydwen.

;Set all prior stages to make this quickstart-safe.
SetStage(40)

;Disable the Vertibird at the Police Station and make other clutter adjustments.
DN130TempVertibird.Disable()
DN130_BoS03_EnableTemporarily.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set when BoS troops occupy the Police Station.

;Set all prior stages to make this quickstart-safe.
SetStage(49)

;Pack up the base.
DN130_BoSTakeover_Enable.Enable()
DN130_BoSTakeover_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoSPoliceStationFrontDoor Auto Const

ObjectReference Property BoSPoliceStationGarageDoor Auto Const

ObjectReference Property DN130_BoS02_Enable Auto Const
ObjectReference Property DN130_BoS02_EnableTemporarily Auto Const
ObjectReference Property DN130_BoS02_Disable Auto Const

ObjectReference Property DN130_BoS03_Enable Auto Const
ObjectReference Property DN130_BoS03_EnableTemporarily Auto Const
ObjectReference Property DN130_BoS03_Disable Auto Const

ObjectReference Property DN130_MQ07_Enable Auto Const
ObjectReference Property DN130_MQ07_EnableTemporarily Auto Const
ObjectReference Property DN130_MQ07_Disable Auto Const

ObjectReference Property DN130_BoSTakeover_Enable Auto Const
ObjectReference Property DN130_BoSTakeover_Disable Auto Const

ObjectReference Property DN130_BoS02_EnableBeds Auto Const



ObjectReference Property DN130TempVertibird Auto Const

ObjectReference Property BoSPoliceStationRoofDoor Auto Const
