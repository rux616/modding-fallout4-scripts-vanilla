;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REObjectDL01_0002F808 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; lock container
Alias_ContainerLocked.GetRef().Lock()
Alias_ContainerLocked.GetRef().SetLockLevel(50)
objectReference Pile = Alias_GarbagePile.getRef()

Pile.Moveto(Pile, 0, 0, 10, true)

alias_ContainerLocked.getRef().MoveTo(Pile, 44, 61, 1, True)
alias_ContainerLocked.getRef().SetAngle(75.45, 89.46, -26.88)

alias_ContainerUnlocked.getRef().MoveTo(Pile, -0.8, -49, 17, True)
alias_ContainerUnlocked.getRef().SetAngle(15.85, 58.87, 27.56)

alias_Radio.getRef().MoveTo(Pile, -70, 13, 10, True)
alias_Radio.getRef().SetAngle(22.4, 54.69, -66.48)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
; DO NOT REARM TRIGGER - we don't reuse Object encounter locations
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_ContainerLocked Auto Const


ReferenceAlias Property Alias_GarbagePile Auto Const

ReferenceAlias Property Alias_ContainerUnlocked Auto Const

ReferenceAlias Property Alias_Radio Auto Const
