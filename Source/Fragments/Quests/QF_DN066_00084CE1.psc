;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN066_00084CE1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.Trace("DN066 Stage 0 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
debug.Trace("DN066 Stage 10 Set")
Alias_LabDoor01.GetRef().Unlock()
Alias_LabDoor02.GetRef().Unlock()
Alias_LabDoor03.GetRef().Unlock()
Alias_LabDoor01.GetRef().SetOpen()
Alias_LabDoor02.GetRef().SetOpen()
Alias_LabDoor03.GetRef().SetOpen()
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
debug.Trace("DN066 Stage 15 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
debug.Trace("DN066 Stage 20 Set")
Alias_Door01.GetRef().Unlock()
Alias_Door02.GetRef().Unlock()
Alias_Door03.GetRef().Unlock()
Alias_Door04.GetRef().Unlock()
Alias_Door05.GetRef().Unlock()
Alias_Door06.GetRef().Unlock()
Alias_Door07.GetRef().Unlock()
Alias_Door08.GetRef().Unlock()
Alias_Door09.GetRef().Unlock()
Alias_Door10.GetRef().Unlock()
Alias_Door11.GetRef().Unlock()
Alias_Door12.GetRef().Unlock()
Alias_Door01.GetRef().SetOpen()
Alias_Door02.GetRef().SetOpen()
Alias_Door03.GetRef().SetOpen()
Alias_Door04.GetRef().SetOpen()
Alias_Door05.GetRef().SetOpen()
Alias_Door06.GetRef().SetOpen()
Alias_Door07.GetRef().SetOpen()
Alias_Door08.GetRef().SetOpen()
Alias_Door09.GetRef().SetOpen()
Alias_Door10.GetRef().SetOpen()
Alias_Door11.GetRef().SetOpen()
Alias_Door12.GetRef().SetOpen()
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
debug.Trace("DN066 Stage 100 Set")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_IntelRoomDoor Auto Const

ReferenceAlias Property Alias_Door01 Auto Const

ReferenceAlias Property Alias_Door02 Auto Const

ReferenceAlias Property Alias_Door03 Auto Const

ReferenceAlias Property Alias_Door04 Auto Const

ReferenceAlias Property Alias_Door05 Auto Const

ReferenceAlias Property Alias_Door06 Auto Const

ReferenceAlias Property Alias_Door07 Auto Const

ReferenceAlias Property Alias_Door08 Auto Const

ReferenceAlias Property Alias_Door09 Auto Const

ReferenceAlias Property Alias_Door10 Auto Const

ReferenceAlias Property Alias_Door11 Auto Const

ReferenceAlias Property Alias_Door12 Auto Const

ReferenceAlias Property Alias_LabDoor01 Auto Const

ReferenceAlias Property Alias_LabDoor02 Auto Const

ReferenceAlias Property Alias_LabDoor03 Auto Const
