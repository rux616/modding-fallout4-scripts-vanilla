;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQPostQuest_01004F2C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set remotely inx
;Conditions Kasumi's greetings for her update scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if DLC03KasumiNakano.GetDeadCount() == 0
   ;if Kasumi is alive, pop the objective to talk to her   
   SetObjectiveDisplayed(10)
elseif DLC03KasumiNakano.GetDeadCount() != 0
   ;If Kasumi is dead, pop the objective to talk to Mister Nakano instead
   SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
;Set in DLC03MQPostQuest_KasumiScene1Update final negative option
;Referenced later on if the player saves Acadia, Kasumi will comment on it

SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Set in the final phase of DLC03MQPostQuest_KasumiScene1Update
;Tracks whether the player has updated Kasumi on his findings about DiMA's past

;Give rewards unless the player told to leave
If GetStageDone(145) == 0
  Game.GetPlayer().AddItem(RadAway, 3)
  Game.GetPlayer().AddItem(Stimpak, 3)
  Game.GetPlayer().AddItem(StealthBoy, 3)
EndIf

;update objectives
DLC03MQ05.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
Actor KasumiREF = Alias_Kasumi.GetActorRef()
 
DLC03KasumiHomeGlobal.SetValue(1)
KasumiRef.EvaluatePackage()
KasumiRef.moveto(DLC03MQPostQuestKasumiMarker01)
KasumiRef.RemoveFromFaction(DLC03AcadiaFaction)

;flip the boats so the Nakano one appears and the Far Harbor one dissappears
KasumiBoatEnable.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
DLC03MQPostQuest_NakanoReunionScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set at the end of DLC03MQPostQuest_KasumiBranch1Main is Kasumi was alive when stage 100 was set
;Set in Stage 100 if Kasumi was dead when stage 100 was set
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Alias_Kasumi.GetActorRef().EvaluatePackage()
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveFailed(10)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;Rewards
;Enable digging up the treasure cache unless you didn't earn it or refused it
if (GetStageDone(450) == False) && (GetStageDone(240) == False) && (GetStageDone(255) == False)
  DLC03PostQuestTreasureDig.Start()
endif

;check if Nick is your companion; turn on Nick's post-quest scene
If Alias_Nick.GetActorRef().IsInFaction(CurrentCompanionFaction)
  DLC03MQPostQuestNick.SetValueInt(1)
  DLC03MQNickPostQuest.Start()
EndIf

;Turn on Ellie's post-quest scene
DLC03MQElliePostQuest.Start()

; Add achievement
Game.AddAchievement(63)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property DLC03KasumiNakano Auto Const Mandatory

ReferenceAlias Property Alias_Kasumi Auto Const Mandatory

Potion Property RadAway Auto Const Mandatory

Potion Property Stimpak Auto Const Mandatory

Potion Property StealthBoy Auto Const Mandatory

Quest Property DLC03MQNickPostQuest Auto Const Mandatory

Quest Property DLC03MQElliePostQuest Auto Const Mandatory

Quest Property DLC03DialogueNakanoResidence Auto Const Mandatory

Quest Property DLC03MQ05 Auto Const Mandatory

GlobalVariable Property DLC03KasumiHomeGlobal Auto Const Mandatory

ObjectReference Property DLC03MQPostQuestKasumiMarker01 Auto Const Mandatory

Scene Property DLC03MQPostQuest_NakanoReunionScene01 Auto Const Mandatory

ObjectReference Property KasumiBoatEnable Auto Const Mandatory

Quest Property DLC03PostQuestTreasureDig Auto Const Mandatory

Faction Property DLC03AcadiaFaction Auto Const Mandatory

GlobalVariable Property DLC03MQPostQuestNick Auto Const Mandatory

ReferenceAlias Property Alias_Nick Auto Const Mandatory

Faction Property CurrentCompanionFaction Auto Const Mandatory
