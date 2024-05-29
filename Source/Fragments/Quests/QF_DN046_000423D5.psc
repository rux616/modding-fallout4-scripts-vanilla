;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN046_000423D5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Debug.Trace("DN046 started State 1: Ghouls")

;Enable State Markers:
;...should already be set up correctly.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DN046_ElevatorDisable.Disable()
DN046_GideonRubbleDisable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Debug.Trace("DN046 started State 2: BoS vs. Ghouls")

;Enable State Markers:
DN046_State2_Enable.Enable()
DN046_State2Only_Enable.Enable()
DN046_State2_Disable.Disable()
DN046_ElevatorDisable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Debug.Trace("DN046 started State 3: BoS Fortified")

;Enable State Markers:
DN046_State2_Enable.Enable()
DN046_State2_Disable.Disable()
DN046_State2Only_Enable.Disable()
DN046_State3_Enable.Enable()
DN046_State3_Disable.Disable()
DN046_State3_Disable001.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN046_State2_Enable Auto Const

ObjectReference Property DN046_State3_Enable Auto Const

ObjectReference Property DN046_State2Only_Enable Auto Const

ObjectReference Property DN046_State2_Disable Auto Const

ObjectReference Property DN046_State3_Disable Auto Const

ObjectReference Property DN046_ElevatorDisable Auto Const

ObjectReference Property DN046_GideonRubbleDisable Auto Const

ObjectReference Property DN046_State3_Disable001 Auto Const
