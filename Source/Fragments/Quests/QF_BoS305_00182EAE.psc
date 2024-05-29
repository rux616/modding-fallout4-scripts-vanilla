;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS305_00182EAE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
BoSEnable.SetStage(40)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(30)
Setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
BoSPostQuest.SetStage(10)

;Block Kells' BoSM/BoSR greetings during the BoS305 scene,
;and then later until he's back on the bridge.
BoSMKellsDialogueBlocked.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_BoS305Maxson.GetActorRef().MoveTo(BoS305MaxsonPrydwenMarker)
Alias_BoS305Maxson.GetActorRef().EvaluatePackage()
Alias_BoS305Kells.GetActorRef().MoveTo(BoS305KellsPrydwenMarker)
Alias_BoS305Kells.GetActorRef().EvaluatePackage()
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)

;Setting Sentinel Rank
BoSDialoguePrydwen.SetStage(35)

;Send Kells back to the bridge.
BoSM00.SetStage(15)

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

ObjectReference Property BoS305MaxsonPrydwenMarker Auto Const

ObjectReference Property BoS305KellsPrydwenMarker Auto Const

ReferenceAlias Property Alias_BoS305Maxson Auto Const

ReferenceAlias Property Alias_BoS305Kells Auto Const

Quest Property BoSDialoguePrydwen Auto Const

Quest Property BoSEnable Auto Const

ObjectReference Property BoSDoors Auto Const

Quest Property BoSPostQuest Auto Const

GlobalVariable Property BoSMKellsDialogueBlocked Auto Const Mandatory

Quest Property BoSM00 Auto Const Mandatory
