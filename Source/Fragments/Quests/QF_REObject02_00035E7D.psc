;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REObject02_00035E7D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; move hatches into position
float zoffset = -5.0
Alias_Hatch.GetRef().Moveto(Alias_CenterMarker.GetRef(), afZOffset=zoffset)
Alias_HatchMarker.GetRef().Moveto(Alias_CenterMarker.GetRef(), afZOffset=zoffset)
Alias_HatchNavcut.GetRef().Moveto(Alias_CenterMarker.GetRef(), afZOffset=zoffset)
Alias_HatchExplode.GetRef().Moveto(Alias_CenterMarker.GetRef(), afZOffset=zoffset)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; detonate hatch explosion
Alias_HatchExplode.GetRef().DamageObject(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; enable real hatch when explosion goes off
Alias_HatchExplode.GetRef().Disable()
Alias_Hatch.GetRef().Enable()
REObject02Scene01.Stop()
REObject02Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; NPC goes through fake load door - have to fake it until we get dynamic portal placement
Alias_Hatch.GetRef().Activate(Alias_Scavenger.GetRef())
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

ReferenceAlias Property Alias_HatchExplode Auto Const

ReferenceAlias Property Alias_Hatch Auto Const

ReferenceAlias Property Alias_CenterMarker Auto Const

ReferenceAlias Property Alias_HatchMarker Auto Const

ReferenceAlias Property Alias_HatchNavcut Auto Const

ReferenceAlias Property Alias_Scavenger Auto Const

Scene Property REObject02Scene01 Auto Const

Scene Property REObject02Scene02 Auto Const
