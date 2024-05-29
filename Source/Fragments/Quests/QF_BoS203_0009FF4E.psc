;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS203_0009FF4E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Note that this debug assumes you have already gained entry to the Institute and spoken to Maxson
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(20)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
BoS202.SetStage(255)
BoS202.SetStage(300)
BoS202LinkMQ.SetStage(255)
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
MQ206TeleporterFaction.SetValue(1.0)
MQ206TeleporterBuildStage.SetValue(5.0)
SetStage(10)
SetStage(30)
Game.GetPlayer().MoveTo(BoS203DBStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE BoS203QuestScript
Quest __temp = self as Quest
BoS203QuestScript kmyQuest = __temp as BoS203QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_BoS203DoctorLi.GetActorRef().EvaluatePackage()

; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE BoS203QuestScript
Quest __temp = self as Quest
BoS203QuestScript kmyQuest = __temp as BoS203QuestScript
;END AUTOCAST
;BEGIN CODE
if PlayerInstitute_KickedOut.GetValue() == 0
kmyQuest.BoS203FindLi()
SetObjectiveDisplayed(10,1)
MQ206BoS.SetStage(1300)
elseif PlayerInstitute_KickedOut.GetValue() == 1
SetStage(65)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
;Player said no or wait on the deal to get evidence for Doctor Li
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
if GetStageDone(50) == 1
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
elseif GetStageDone(50) == 0
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(40,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_BoS203Holotape.GetRef())
Game.StopDialogueCamera()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Player didn't kill Doctor Li, but got kicked out of the Institute before obtaining her services
BoS203Failed.SetValue(1)
if IsObjectiveDisplayed(10) == 1
SetObjectiveDisplayed(10,0)
endif
if IsObjectiveDisplayed(20) == 1
SetObjectiveDisplayed(20,0)
endif
if IsObjectiveDisplayed(30) == 1
SetObjectiveDisplayed(30,0)
endif
if IsObjectiveDisplayed(40) == 1
SetObjectiveDisplayed(40,0)
endif
BoSLiLeftInstitute.SetValue(0)
BoSDrLiSlain.SetValue(1)
SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
BoS203Failed.SetValue(1)
if IsObjectiveDisplayed(10) == 1
SetObjectiveDisplayed(10,0)
endif
if IsObjectiveDisplayed(20) == 1
SetObjectiveDisplayed(20,0)
endif
if IsObjectiveDisplayed(30) == 1
SetObjectiveDisplayed(30,0)
endif
if IsObjectiveDisplayed(40) == 1
SetObjectiveDisplayed(40,0)
endif
BoSDrLiSlain.SetValue(1)
BoSLiLeftInstitute.SetValue(0)
SetObjectiveDisplayed(50,1)
SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
BoSLiLeftInstitute.SetValue(1)
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
if IsObjectiveDisplayed(40) == 1
SetObjectiveCompleted(40,1)
endif
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_01
Function Fragment_Stage_0080_Item_01()
;BEGIN CODE
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
if IsObjectiveDisplayed(40) == 1
SetObjectiveCompleted(40,1)
endif
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)
if BoS204.GetStageDone(200) == 1
BoS301.SetStage(10)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_01
Function Fragment_Stage_0255_Item_01()
;BEGIN CODE
SetObjectiveCompleted(50,1)
if BoS204.GetStageDone(200) == 1
BoS301.SetStage(10)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoSPFD Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

ReferenceAlias Property Alias_BoS203DoctorLi Auto Const

Quest Property MQ206BoS Auto Const

GlobalVariable Property BoSLiLeftInstitute Auto Const

GlobalVariable Property BoSDrLiSlain Auto Const

Quest Property BoSEnable Auto Const

Quest Property BoS301 Auto Const

Quest Property BoS204 Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS101 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoS100Fight Auto Const

Quest Property BoSPoliceStation Auto Const

Quest Property BoSDialoguePrydwen Auto Const

ObjectReference Property BoSDoors Auto Const

GlobalVariable Property MQ206TeleporterFaction Auto Const

GlobalVariable Property MQ206TeleporterBuildStage Auto Const

GlobalVariable Property XPFactionFinal Auto Const

ReferenceAlias Property Alias_BoS203Holotape Auto Const

Quest Property BoS201 Auto Const

Quest Property BoS201B Auto Const

Quest Property BoS202 Auto Const

ObjectReference Property BoS203DBStart Auto Const

GlobalVariable Property BoS203Failed Auto Const

Quest Property BoS202LinkMQ Auto Const

GlobalVariable Property PlayerInstitute_KickedOut Auto Const
