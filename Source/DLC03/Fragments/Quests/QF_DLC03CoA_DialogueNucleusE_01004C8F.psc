;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_DialogueNucleusE_01004C8F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(50)
SetStage(55)
SetStage(100)
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;If the CoA Male is already dead or someone's in combat, bypass scene. Also, turn off essential
Actor CoAMale = Alias_CoAMale.GetActorRef()
Actor CoAFemale = Alias_CoAFemale.GetActorRef()

CoAMale.SetProtected(false)
CoAFemale.SetProtected(false)

Utility.Wait(1.0)

if !CoAMale.IsDead() && !CoAMale.IsInCombat() && !Alias_GrandZealot.GetActorRef().IsInCombat() && !CoAFemale.IsInCombat()
  DLC03CoA_DialogueNucleusEntrance_Scene.Start()
else
  SetStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_NucleusEntranceScript
Quest __temp = self as Quest
DLC03:DLC03CoA_NucleusEntranceScript kmyQuest = __temp as DLC03:DLC03CoA_NucleusEntranceScript
;END AUTOCAST
;BEGIN CODE
;Set Male's health low
Alias_CoAMale.GetActorRef().SetValue(Health, 1)

;Start failsafe timer
kmyquest.StartFailsafeTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Actor CoAMale = Alias_CoAMale.GetActorRef()

CoAMale.SetProtected(false)
CoAMale.KillEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Actor CoAMale = Alias_CoAMale.GetActorRef()
Actor GZ = Alias_GrandZealot.GetActorRef()
Actor CoAFemale = Alias_CoAFemale.GetActorRef()

CoAMale.SetProtected(false)
CoAFemale.SetProtected(false)

;If the CoA Male hasn't died, make him killable in one shot and have the Children attack him
if !CoAMale.IsDead()
  SetStage(15)
  DLC03ChildrenofAtomFaction.SetEnemy(DLC03ChildrenofAtomFaction_MaleEntrance)
  DLC03ChildrenofAtomFaction_MaleEntrance.SetEnemy(PlayerFaction)
  CoAMale.SetValue(Aggression, 1)
  GZ.StartCombat(CoAMale)
  CoAMale.StartCombat(GZ)
  CoAMale.StartCombat(Game.GetPlayer())
endif

;If player hasn't been kicked from CoA, enable trigger. Otherwise, shutdown quest
if DLC03CoA_PlayerKickedOutofCoA.GetValue() == 0
  Alias_RitcherSceneTrigger.GetRef().Enable()
else
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
Actor GZ = Alias_GrandZealot.GetActorRef()

if !GZ.IsInCombat()
  DLC03CoA_DialogueNucleusEntrance_RichterScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
Alias_GrandZealot.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0053_Item_00
Function Fragment_Stage_0053_Item_00()
;BEGIN CODE
;Disable Richter's trigger scene
Alias_RitcherSceneTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
DLC03CoA_PlayerKnowsAtom.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_GrandZealot.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Start Vision Quest
DLC03CoAAtomM01.SetStage(10)
DLC03CoAAtomM01.SetActive()

;Disable Richter's trigger scene
Alias_RitcherSceneTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
DLC03CoA_Kickout.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
Actor CoAMale = Alias_CoAMale.GetActorRef()
Actor CoAFemale = Alias_CoAFemale.GetActorRef()

CoAMale.SetProtected(false)
CoAFemale.SetProtected(false)

;Disable Richter's trigger scene
Alias_RitcherSceneTrigger.GetRef().Disable()

SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CoAMale Auto Const Mandatory

Scene Property DLC03CoA_DialogueNucleusEntrance_Scene Auto Const Mandatory

Quest Property DLC03CoAAtomM01 Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerKnowsAtom Auto Const Mandatory

ReferenceAlias Property Alias_GrandZealot Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

Faction Property DLC03ChildrenofAtomFaction_MaleEntrance Auto Const Mandatory

Faction Property DLC03ChildrenofAtomFaction Auto Const Mandatory

ReferenceAlias Property Alias_CoAFemale Auto Const Mandatory

Quest Property DLC03CoA_Kickout Auto Const Mandatory

Scene Property DLC03CoA_DialogueNucleusEntrance_RichterScene Auto Const Mandatory

ReferenceAlias Property Alias_RitcherSceneTrigger Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerKickedOutofCoA Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
