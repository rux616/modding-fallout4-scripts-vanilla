;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03REObjectKMK01_0104B65F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

ObjectReference center = Alias_CenterMarker.GetRef()

; set up nest/eggs
ObjectReference nest = Alias_MirelurkNest.GetRef()
nest.MoveTo(center, 33.5562, 0.1567, -6.0739, true)

ObjectReference hatchingTrigger = Alias_HatchingTrigger.GetRef()
hatchingTrigger.MoveTo(center)
ObjectReference eggHarvest01 = Alias_EggHarvestable01.GetRef()
eggHarvest01.MoveTo(center, 17.3760, -66.3735, 34.8540, true)
eggHarvest01.SetAngle(12.7010, 2.7684, 71.4162)

ObjectReference eggHarvest02 = Alias_EggHarvestable01.GetRef()
eggHarvest02.MoveTo(center, 82.4612, -49.4873, 46.6259, true)
eggHarvest02.SetAngle(-5.0208, 5.6516, 358.2252)

ObjectReference eggHatch01 = Alias_EggHatching01.GetRef()
eggHatch01.MoveTo(center, 0, 0, 30, true)
eggHatch01.SetAngle(23.8690, 8.8406, 4.4843)

ObjectReference eggHatch02 = Alias_EggHatching02.GetRef()
eggHatch02.MoveTo(center, 47.7803, -29.2041, 41.6125, true)
eggHatch02.SetAngle(-1.1555, 7.8459, 91.0071)

ObjectReference eggHatch03 = Alias_EggHatching03.GetRef()
eggHatch03.MoveTo(center, -17.5120, -25.1045, 30, true)
eggHatch03.SetAngle(-7.0851, 11.9232, 250.8248)

ObjectReference eggHatch04 = Alias_EggHatching04.GetRef()
eggHatch04.MoveTo(center, -17.1460, -56.1650, 27.0, true)
eggHatch04.SetAngle(2.0650, 0.7683, 322.7325)
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

ReferenceAlias Property Alias_MirelurkNest Auto Const Mandatory

ReferenceAlias Property Alias_HatchingTrigger Auto Const Mandatory

ReferenceAlias Property Alias_EggHarvestable01 Auto Const Mandatory

ReferenceAlias Property Alias_EggHatching01 Auto Const Mandatory

ReferenceAlias Property Alias_EggHatching02 Auto Const Mandatory

ReferenceAlias Property Alias_EggHarvestable02 Auto Const Mandatory

ReferenceAlias Property Alias_EggHatching03 Auto Const Mandatory

ReferenceAlias Property Alias_EggHatching04 Auto Const Mandatory

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory
