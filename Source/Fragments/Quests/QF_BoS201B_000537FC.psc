;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS201B_000537FC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
Game.GetPlayer().MoveTo(BoS201BStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
BoSDialogue.SetStage(20)
SetObjectiveDisplayed(10,1)
SetObjectiveDisplayed(20,1)
SetObjectiveDisplayed(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10,1)
BoS201BCount.SetValue(BoS201BCount.GetValue() + 1)
if BoS201BCount.GetValue() >= 4
SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)
BoS201BCount.SetValue(BoS201BCount.GetValue() + 1)
if BoS201BCount.GetValue() >= 4
SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
BoS201BCount.SetValue(BoS201BCount.GetValue() + 1)
if BoS201BCount.GetValue() >= 4
SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40,1)
BoS201BCount.SetValue(BoS201BCount.GetValue() + 1)
if BoS201BCount.GetValue() >= 4
SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
BoS201BCount.SetValue(5)
BoS202.SetStage(10)
BoSR04.SetStage(10)
BoSR05.SetStage(10)

;For QuickStarts
BoSCadeIntroDone.SetValue(1)
BoSIngramIntroDone.SetValue(1)
BoSQuinlanIntroDone.SetValue(1)
BoSTeaganIntroDone.SetValue(1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
FailAllObjectives()

;Disable Safety Wall on Prydwen
BoS201SafetyWallRef.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoS201BCount Auto Const

Quest Property BoS202 Auto Const

Quest Property BoSDialogue Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS101 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoS100Fight Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Quest Property BoSEnable Auto Const

Quest Property BoS201 Auto Const

ObjectReference Property BoS201BStart Auto Const

Quest Property BoSR04 Auto Const

Quest Property BoSR05 Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Weather Property CommonwealthClear Auto Const

GlobalVariable Property BoSCadeIntroDone Auto Const
GlobalVariable Property BoSIngramIntroDone Auto Const
GlobalVariable Property BoSTeaganIntroDone Auto Const
GlobalVariable Property BoSQuinlanIntroDone Auto Const

ObjectReference Property BoS201SafetyWallRef Auto Const
