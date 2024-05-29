;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_Kickout_010323DE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_KickoutScript
Quest __temp = self as Quest
DLC03:DLC03CoA_KickoutScript kmyQuest = __temp as DLC03:DLC03CoA_KickoutScript
;END AUTOCAST
;BEGIN CODE
;This is triggered from several spots:
;1. Killing any name CoA NPC (other than High Confessor during MQ06a)
;2. Stage 150 - CoA entrance scene
;3. Stage 700 - AtomM01
;4. Stage 100 - MQ06 NukeHandling
;5. Stage 760 - MQ06a

Actor PlayerActor = Game.GetPlayer()

PlayerActor.RemoveFromFaction(DLC03ChildrenofAtomFaction)
DLC03ChildrenofAtomFaction.SetEnemy(PlayerFaction)
DLC03ChildrenofAtomFaction.SetPlayerEnemy()
DLC03ChildrenofAtomInteriorFaction.SetEnemy(PlayerFaction)

;Add them to the bed faction if they aren't already in it
if !PlayerActor.IsInFaction(DLC03ChildrenofAtomBedFaction)
  PlayerActor.AddToFaction(DLC03ChildrenofAtomBedFaction)
endif

;Set "Kick Out" var
DLC03CoA_PlayerKickedOutofCoA.SetValue(1)

;Show message
DLC03CoA_KickOutMessage.Show()

;Shut down "Speak to High Confessor" objective if active
DLC03CoA_DialogueNucleus.SetStage(55)

;Set fail stage for Nucleus dialogue
DLC03CoA_DialogueNucleus.SetStage(700)

;Shutdown AtomM02
if DLC03AtomM02.IsRunning()
  DLC03AtomM02.SetStage(800)
endif

;Remove protected from Nucleus NPCs
kmyquest.RemoveProtectedFromNucleusNamedNPCs()

;If Sister Gwyneth has been returned to the Nucleus, mark her unprotected
if DLC03CoA_AtomM02EndState.GetValue() == 1
  Alias_SisterGwyneth.GetActorRef().GetActorBase().SetProtected(false)
endif

;If sermon isn't complete, shut it down now
if !DLC03CoA_DialogueNucleusSermon.GetStageDone(100)
  DLC03CoA_DialogueNucleusSermon.SetStage(100)
endif

;Swap Nucleus map markers
MMEnableMarker.Disable()

;Clear the Mother icon from her QI alias
MotherQIAlias.Clear()

;Increase Idle actor value on prayer CoA
Actor CA = Alias_CoAPrayerM01.GetActorRef()

CA.SetValue(IdleChatterTimeMax, 30)
CA.SetValue(IdleChatterTimeMin, 15)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC03ChildrenofAtomFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerKickedOutofCoA Auto Const Mandatory

Message Property DLC03CoA_KickOutMessage Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

Quest Property DLC03AtomM02 Auto Const Mandatory

ReferenceAlias Property MotherQIAlias Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusSermon Auto Const Mandatory

ObjectReference Property MMEnableMarker Auto Const Mandatory

Faction Property DLC03ChildrenofAtomBedFaction Auto Const Mandatory

ReferenceAlias Property Alias_SisterGwyneth Auto Const Mandatory

GlobalVariable Property DLC03CoA_AtomM02EndState Auto Const Mandatory

ReferenceAlias Property Alias_CoAPrayerM01 Auto Const Mandatory

ActorValue Property IdleChatterTimeMax Auto Const Mandatory

ActorValue Property IdleChatterTimeMin Auto Const Mandatory

Faction Property DLC03ChildrenofAtomInteriorFaction Auto Const Mandatory
