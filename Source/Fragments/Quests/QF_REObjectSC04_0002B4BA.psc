;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REObjectSC04_0002B4BA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + " STARTING")
kmyQuest.Startup()

;Move the static barrels.
ObjectReference barrel
barrel = Alias_BarrelStatic01.GetReference()
barrel.SetAngle(0, 0, Utility.RandomInt(0, 360))
barrel = Alias_BarrelStatic01b.GetReference()
barrel.MoveTo(barrel, 40, 45, 0, True)
barrel.SetAngle(0, 0, Utility.RandomInt(0, 360))
barrel = Alias_BarrelStatic01c.GetReference()
barrel.MoveTo(barrel, 40, -45, 0, True)
barrel.SetAngle(0, 0, Utility.RandomInt(0, 360))
barrel = Alias_BarrelStatic02.GetReference()
barrel.SetAngle(0, 0, Utility.RandomInt(0, 360))
barrel = Alias_BarrelStatic02b.GetReference()
barrel.MoveTo(barrel, -65, 40, 0, True)
barrel.SetAngle(0, 0, Utility.RandomInt(0, 360))
barrel = Alias_BarrelStatic03.GetReference()
barrel.SetAngle(0, 0, Utility.RandomInt(0, 360))

;Move the nonstatic barrels.
barrel = Alias_Barrel04.GetReference()
barrel.MoveTo(barrel, 40, 40, 90, True)
barrel.SetAngle(Utility.RandomInt(0, 180), Utility.RandomInt(0, 180), Utility.RandomInt(0, 360))
barrel.ApplyHavokImpulse(0, 0, 1.0, 1.0)
barrel = Alias_Barrel05.GetReference()
barrel.MoveTo(barrel, -40, -40, 90, True)
barrel.SetAngle(Utility.RandomInt(0, 180), Utility.RandomInt(0, 180), Utility.RandomInt(0, 360))
barrel.ApplyHavokImpulse(0, 0, 1.0, 1.0)
barrel = Alias_Barrel06.GetReference()
barrel.MoveTo(barrel, -40, 40, 90, True)
barrel.SetAngle(Utility.RandomInt(0, 180), Utility.RandomInt(0, 180), Utility.RandomInt(0, 360))
barrel.ApplyHavokImpulse(0, 0, 1.0, 1.0)
barrel = Alias_Barrel07.GetReference()
barrel.MoveTo(barrel, 40, -40, 90, True)
barrel.SetAngle(Utility.RandomInt(0, 180), Utility.RandomInt(0, 180), Utility.RandomInt(0, 360))
barrel.ApplyHavokImpulse(0, 0, 1.0, 1.0)
barrel = Alias_Barrel08.GetReference()
barrel.MoveTo(barrel, -40, -40, 90, True)
barrel.SetAngle(Utility.RandomInt(0, 180), Utility.RandomInt(0, 180), Utility.RandomInt(0, 360))
barrel.ApplyHavokImpulse(0, 0, 1.0, 1.0)
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
;debug.trace(self + " STOPPING")
; DO NOT REARM TRIGGER - we don't reuse Object encounter locations
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_BarrelStatic01b Auto Const

ReferenceAlias Property Alias_BarrelStatic02b Auto Const

ReferenceAlias Property Alias_BarrelStatic03b Auto Const

ReferenceAlias Property Alias_BarrelStatic01 Auto Const

ReferenceAlias Property Alias_BarrelStatic02 Auto Const

ReferenceAlias Property Alias_BarrelStatic03 Auto Const

ReferenceAlias Property Alias_Barrel04 Auto Const

ReferenceAlias Property Alias_Barrel05 Auto Const

ReferenceAlias Property Alias_Barrel06 Auto Const

ReferenceAlias Property Alias_Barrel07 Auto Const

ReferenceAlias Property Alias_Barrel08 Auto Const

ReferenceAlias Property Alias_BarrelStatic01c Auto Const
