;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07cGreetingHandler_010D7DB1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MS07cGreetingHandlerScript
Quest __temp = self as Quest
MS07cGreetingHandlerScript kmyQuest = __temp as MS07cGreetingHandlerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartGreetingTimer()
MS07c_001_NickIntro.Start()
Utility.Wait(3.0)
MS07cNickGreetingGlobal.SetValue(1)
Alias_Nick.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MS07cGreetingHandlerScript
Quest __temp = self as Quest
MS07cGreetingHandlerScript kmyQuest = __temp as MS07cGreetingHandlerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CancelGreetingTimer()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MS07c_001_NickIntro Auto Const

GlobalVariable Property MS07cNickGreetingGlobal Auto Const

ReferenceAlias Property Alias_Nick Auto Const
