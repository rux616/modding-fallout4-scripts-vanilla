;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_DialogueNucleus_01004C8E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DebugMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_DialogueNucleusScript
Quest __temp = self as Quest
DLC03:DLC03CoA_DialogueNucleusScript kmyQuest = __temp as DLC03:DLC03CoA_DialogueNucleusScript
;END AUTOCAST
;BEGIN CODE
;Give player caps if earned
if kmyquest.iSisterMaiBargainSuccess == 1
  Game.GetPlayer().AddItem(Caps001, 150)
elseif kmyquest.iSisterMaiBargainSuccess == 2
  Game.GetPlayer().AddItem(Caps001, 250)
elseif kmyquest.iSisterMaiBargainSuccess >= 3
  Game.GetPlayer().AddItem(Caps001, 350)
endif

;Give player rifle
DLC03_CustomItemQuest.SetStage(40)

;Set appropriate stage in FFNucleus 30
DLC03CoA_FFNucleus03.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
DLC03CoA_QuestPointers.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Mark appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN CODE
;Clear the Mother of the Fog out of her Quest Item alias
MotherQIAlias.Clear()

SetStage(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Clear the Mother of the Fog out of her Quest Item alias
MotherQIAlias.Clear()

;Mark appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
DLC03CoA_Kickout.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
DLC03CoA_FFNucleus02.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(MQ06Caps)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
DLC03MQ06.SetStage(190)

;High Confessor trusts the player more now
DLC03CoA_QuestsCompleted.SetValue(DLC03CoA_QuestsCompleted.Getvalue() + 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
;TEMP - Add in CoA reward item
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0092_Item_00
Function Fragment_Stage_0092_Item_00()
;BEGIN CODE
DLC03MQ06.SetStage(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0096_Item_00
Function Fragment_Stage_0096_Item_00()
;BEGIN CODE
DLC03MQ06a.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0097_Item_00
Function Fragment_Stage_0097_Item_00()
;BEGIN CODE
;Player seduced High Confessor
DLC03MQ06a_SeducedHighConf.SetValue(1)

;And High Confessor has agreed to follow player
SetStage(96)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0098_Item_00
Function Fragment_Stage_0098_Item_00()
;BEGIN CODE
;Fail DLC03MQ06a
DLC03MQ06a.SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
DLC03MQ06.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DLC03AtomM02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
DLC03CoA_FFNucleus01.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0117_Item_00
Function Fragment_Stage_0117_Item_00()
;BEGIN CODE
;Shut down FF01
DLC03CoA_FFNucleus01.SetStage(200)

Actor PA = Game.GetPlayer()

;Give player Ware Root
PA.AddItem(DLC03CoA_WareRoot, 4)
PA.Additem(DLC03CoA_FFNucleus01_WareBrewRecipe)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0119_Item_00
Function Fragment_Stage_0119_Item_00()
;BEGIN CODE
DLC03CoA_FFNucleus01.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
DLC03CoA_FFNucleus01.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0122_Item_00
Function Fragment_Stage_0122_Item_00()
;BEGIN CODE
Actor Devin = Alias_BrotherDevin.GetActorRef()

Devin.ChangeAnimArchetype(none)
Devin.ChangeAnimFaceArchetype(AnimFaceArchetypeAwed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0124_Item_00
Function Fragment_Stage_0124_Item_00()
;BEGIN CODE
SetStage(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_DialogueNucleusScript
Quest __temp = self as Quest
DLC03:DLC03CoA_DialogueNucleusScript kmyQuest = __temp as DLC03:DLC03CoA_DialogueNucleusScript
;END AUTOCAST
;BEGIN CODE
;Set stage in FFNuc01
DLC03CoA_FFNucleus01.SetStage(100)

;Start Devin's end scene
DLC03CoA_DialogueNucleus_DevinWrapUp.Start()

;Start Devin's failsafe timer
kmyquest.StartDevinFailSafeTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0127_Item_00
Function Fragment_Stage_0127_Item_00()
;BEGIN CODE
Game.GetPlayer().Additem(Caps001, 32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0128_Item_00
Function Fragment_Stage_0128_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_DialogueNucleusScript
Quest __temp = self as Quest
DLC03:DLC03CoA_DialogueNucleusScript kmyQuest = __temp as DLC03:DLC03CoA_DialogueNucleusScript
;END AUTOCAST
;BEGIN CODE
;Cancel Devin's failsafe timer
kmyquest.CancelDevinFailSafeTimer()

;Update Devin's anim archetype
Actor Devin = Alias_BrotherDevin.GetActorRef()

Devin.SetAnimArchetypeFriendly()
Devin.ChangeAnimFaceArchetype(AnimFaceArchetypeFriendly)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;If FFNucleus02 is running, set appropriate stage
if DLC03CoA_FFNucleus02.IsRunning()
  DLC03CoA_FFNucleus02.SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
Alias_SisterAubert.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0136_Item_00
Function Fragment_Stage_0136_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Caps_Reward_Medium_and_Change)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC03ChildrenofAtomFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Keyword Property AnimArchetypeConfident Auto Const Mandatory

ReferenceAlias Property Alias_BrotherDevin Auto Const Mandatory

Keyword Property AnimFaceArchetypeHappy Auto Const Mandatory

Keyword Property AnimFaceArchetypeAwed Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus01 Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerKickedOutofCoA Auto Const Mandatory

LeveledItem Property MQ06Caps Auto Const Mandatory

Quest Property DLC03MQ06 Auto Const Mandatory

Quest Property DLC03AtomM02 Auto Const Mandatory

GlobalVariable Property DLC03CoA_QuestsCompleted Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory

GlobalVariable Property DLC03MQ06a_SeducedHighConf Auto Const Mandatory

ObjectReference Property DebugMarker Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

Potion Property DLC03CoA_WareRoot Auto Const Mandatory

Scene Property DLC03CoA_DialogueNucleus_DevinWrapUp Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus03 Auto Const Mandatory

Keyword Property AnimFaceArchetypeFriendly Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus02 Auto Const Mandatory

ReferenceAlias Property Alias_SisterAubert Auto Const Mandatory

ReferenceAlias Property MotherQIAlias Auto Const Mandatory

Message Property DLC03CoA_KickOutMessage Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus01_Misc Auto Const Mandatory

Quest Property DLC03CoA_Kickout Auto Const Mandatory

Book Property DLC03CoA_FFNucleus01_WareBrewRecipe Auto Const Mandatory

Quest Property DLC03_CustomItemQuest Auto Const Mandatory

Quest Property DLC03CoA_AtomM02_Misc Auto Const Mandatory

LeveledItem Property LL_Caps_Reward_Medium_and_Change Auto Const Mandatory

Quest Property DLC03CoA_QuestPointers Auto Const Mandatory
