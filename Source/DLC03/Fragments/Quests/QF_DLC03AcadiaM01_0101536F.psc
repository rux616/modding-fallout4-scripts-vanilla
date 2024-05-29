;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AcadiaM01_0101536F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;The player has spoken to Chase and has been given the first objective to go to Brooks

SetObjectiveDisplayed(10)

;Enable the Trappers and the attack site clutter/blood trail
DLC03AcadiaM01EnableMarkerRef.enable()
;DLC03_AcadiaM01_SynthHeadStaticRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Set if the player chooses not to help Chase
;Conditions a greeting by Chase where she reminds the player she still needs help
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set at the end of the first scene with Brooks

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set when player interacts with activator DLC03AcadiaM01_SleepingBagActivator

;Player personal comment scene
DLC03AcadiaM01_SleepingBagComment.Start()

SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set when the player enters the trigger box inside the house at POI 17

SetObjectiveCompleted(30)

if GetStageDone(500) == False
  SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
Alias_TrapperBoss.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_TrapperBoss.GetActorRef().StartCombat(Game.GetPlayer())
Alias_SceneTrapper1.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_SceneTrapper1.GetActorRef().StartCombat(Game.GetPlayer())
Alias_SceneTrapper2.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_SceneTrapper2.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;NO LONGER USED

;Set when the player activates the cook pot in the house at POI 17

;Int ButtonPressed = 0

;Display the message box to take the head or leave it
;ButtonPressed = DLC03_AcadiaM01_TakeHeadMessage.Show()
;if ButtonPressed == 0
;   DLC03AcadiaM01.SetStage(420)
;elseIf ButtonPressed == 1
;   DLC03AcadiaM01.SetStage(430)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
;Disable the head in the pot
DLC03_AcadiaM01_SynthHeadStaticRef.Disable()

;Add the quest item head to the player's inventory
Game.GetPlayer().AddItem(SynthHead.GetReference(), 1)

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
;This stage is used as a condition in the final conversation with Chase

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
;Add the head to the player's inventory
Game.GetPlayer().AddItem(SynthHead.GetReference(), 1)

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE DLC03:AcadiaM01QuestScript
Quest __temp = self as Quest
DLC03:AcadiaM01QuestScript kmyQuest = __temp as DLC03:AcadiaM01QuestScript
;END AUTOCAST
;BEGIN CODE
;Complete quest

Actor PlayerREF = Game.GetPlayer()

;Remove the head
PlayerREF.RemoveItem(DLC03_AcadiaM01_HeadQuestItem, 1)

;Give reward
If kmyquest.ChaseReward == 0
    PlayerREF.AddItem(caps001, 200)
elseIf kmyquest.ChaseReward == 1
    PlayerREF.AddItem(caps001, 250)
elseIf kmyquest.ChaseReward == 2
    PlayerREF.AddItem(caps001, 300)
elseIf kmyquest.ChaseReward == 3
    PlayerREF.AddItem(caps001, 400)
endIf
DLC03_CustomItemQuest.SetStage(230)


;update quest pointer...quest
DLC03AcadiaQuestPointers.SetStage(30)

;start Acadia M02 if player isn't in Institute
if (PlayerInstitute_Joined.GetValue()==0) || (PlayerInstitute_KickedOut.GetValue() == 1)
DLC03AcadiaM02.Start()
endif

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
FailAllObjectives()
DLC03AcadiaM01EnableMarkerRef.disable()

if DLC03AcadiaQuestPointers.IsRunning()
DLC03AcadiaQuestPointers.SetStage(500)
endif


Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;Set in the quset script if registered event "FarHarborKickout" fires
;That event disables Brooks, which will make this quest impossible to advance if 
;Stage 100 has not been reached yet

if DLC03AcadiaM01.GetStageDone(100) == False
     SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;make sure the trappers are now aggressive
Alias_SceneTrapper1.GetActorRef().SetValue(Aggression, 2)
Alias_SceneTrapper2.GetActorRef().SetValue(Aggression, 2)
Alias_TrapperBoss.GetActorRef().SetValue(Aggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC03AcadiaM01_TrapperScene1 Auto Const Mandatory

ObjectReference Property DLC03_AcadiaM01_SynthHeadStaticRef Auto Const Mandatory

MiscObject Property DLC03_AcadiaM01_HeadQuestItem Auto Const Mandatory

Message Property DLC03_AcadiaM01_TakeHeadMessage Auto Const Mandatory

Quest Property DLC03AcadiaM01 Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

ObjectReference Property DLC03AcadiaM01EnableMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_SceneTrapper1 Auto Const Mandatory

ReferenceAlias Property Alias_SceneTrapper2 Auto Const Mandatory

ReferenceAlias Property Alias_TrapperBoss Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Quest Property DLC03AcadiaM02 Auto Const Mandatory

Scene Property DLC03AcadiaM01_SleepingBagComment Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Quest Property DLC03AcadiaQuestPointers Auto Const Mandatory

ReferenceAlias Property SynthHead Auto Const

GlobalVariable Property PlayerInstitute_Joined Auto Const Mandatory

GlobalVariable Property PlayerInstitute_KickedOut Auto Const Mandatory

Quest Property DLC03_CustomItemQuest Auto Const Mandatory
