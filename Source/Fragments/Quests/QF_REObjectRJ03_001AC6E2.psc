;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REObjectRJ03_001AC6E2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

ObjectReference Furn01 = Alias_BarFurn.GetReference()
ObjectReference Bar = Alias_Bar.Getreference()
Furn01.MoveTo(bar, 0, 0, 0, True)
;float xAngle = (bar.getangleZ() + 180.0)
;Furn01.SetAngle(0,0,xAngle)

Alias_Mac.GetReference().Moveto(Bar, 0, 100, 0, True)
utility.wait(0.2)
Alias_Mac.TrytoEvaluatePackage()

REObjectRJ03PreScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
; DO NOT REARM TRIGGER - we don't reuse Object encounter locations
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_BarFurn Auto Const

ReferenceAlias Property Alias_Bar Auto Const

Scene Property REObjectRJ03PreScene Auto Const

ReferenceAlias Property Alias_ObjectMarkerA1 Auto Const

ReferenceAlias Property Alias_Mac Auto Const
