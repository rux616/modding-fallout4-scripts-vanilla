;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN049_010027A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Debug.Notification("TEMP: All doors have been unlocked.")
Door01.Unlock()
Door02.Unlock()
Door03.Unlock()
Door04.Unlock()
Door05.Unlock()
Door06.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Door01 Auto Const

ObjectReference Property Door02 Auto Const

ObjectReference Property Door03 Auto Const

ObjectReference Property Door04 Auto Const

ObjectReference Property Door05 Auto Const

ObjectReference Property Door06 Auto Const
