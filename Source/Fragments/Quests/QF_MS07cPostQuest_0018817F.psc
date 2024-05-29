;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07cPostQuest_0018817F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE MS07cPostQuestScript
Quest __temp = self as Quest
MS07cPostQuestScript kmyQuest = __temp as MS07cPostQuestScript
;END AUTOCAST
;BEGIN CODE
;Start timer for quest shut down
kmyquest.StartMS07cPostQuestTimer()

;If player's close enough, fire scene. Otherwise, tell player to talk to Nick
if Game.GetPlayer().GetDistance(Alias_NickValentine.GetRef()) < 500
  pNickPickUpScene.Start()
else
  SetObjectiveDisplayed(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Allow Nick to be a companion again
;Alias_NickValentine.GetActorRef().AllowCompanion(MakeCompanionIfNoneCurrently = false)

SetObjectiveCompleted(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
pComNick.SetStage(90)
Alias_NickValentine.GetActorRef().EvaluatePackage()

if !GetStageDone(50)
  SetObjectiveCompleted(5)
endif

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
pComNick.SetStage(80)
Alias_NickValentine.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(5)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(5, false)
SetStage(10)
Alias_NickValentine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MS07cPostQuestScript
Quest __temp = self as Quest
MS07cPostQuestScript kmyQuest = __temp as MS07cPostQuestScript
;END AUTOCAST
;BEGIN CODE
;Just in case it didn't get shut down earlier
SetObjectiveCompleted(5)

;Shut down quest timer
kmyquest.CancelMS07cPostQuestTimer()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pCOMNick Auto Const

ReferenceAlias Property Alias_NickValentine Auto Const

Scene Property NewProperty Auto Const

Scene Property pNickPickupScene Auto Const

ObjectReference Property pNickHomeMarker Auto Const
