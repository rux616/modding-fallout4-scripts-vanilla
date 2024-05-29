;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REObjectRJ01_001A97FD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Move the safe into position.

ObjectReference Tank = Alias_Tank.GetReference()

ObjectReference Furn01 = Alias_Furniture01.GetReference()
Furn01.MoveTo(tank, -400, 0, 0, False)
;Furn01.SetAngle(0,0,90.0)

ObjectReference Furn02 = Alias_Furniture02.GetReference()
Furn02.MoveTo(tank, -2500, 250, 0, False)
Furn02.SetAngle(0,0,180.0)

ObjectReference Furn03 = Alias_Furniture03.GetReference()
Furn03.MoveTo(tank, 400, -400, 0, True)
Furn03.SetAngle(0,0,135)

ObjectReference Furn04 = Alias_Furniture04.GetReference()
Furn04.MoveTo(tank, 400, 400, 0, True)
Furn04.SetAngle(0,0,45)

ObjectReference Furn05 = Alias_Furniture05.GetReference()
Furn05.MoveTo(tank, -400, 400, 0, True)
Furn05.SetAngle(0,0,-45)

ObjectReference Furn06 = Alias_Furniture06.GetReference()
Furn06.MoveTo(tank, -400, -400, 0, True)
Furn06.SetAngle(0,0,-135)

ObjectReference Gun = Alias_Gunner.GetReference()
Gun.MoveTo(tank, 500, 0, 0, True)

ObjectReference Gun01 = Alias_Gunner01.GetReference()
Gun01.MoveTo(tank, -500, 0, 0, True)

ObjectReference Gun02 = Alias_Gunner02.GetReference()
Gun02.MoveTo(tank, 0, 500, 0, True)

ObjectReference Trunk = Alias_Container.GetReference()
Trunk.MoveTo(tank, 0, -210, 0, True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Tank Auto Const

ReferenceAlias Property Alias_Furniture01 Auto Const

ReferenceAlias Property Alias_Furniture02 Auto Const

ReferenceAlias Property Alias_Furniture03 Auto Const

ReferenceAlias Property Alias_Furniture04 Auto Const

ReferenceAlias Property Alias_Furniture05 Auto Const

ReferenceAlias Property Alias_Furniture06 Auto Const


ReferenceAlias Property Alias_Gunner Auto Const

ReferenceAlias Property Alias_Gunner01 Auto Const

ReferenceAlias Property Alias_Gunner02 Auto Const

ReferenceAlias Property Alias_Container Auto Const
