;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AtomM02Post_0102E058 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Use the folllowing global to track Gwyeth's status in post-quest
;DLC03CoA_AtomM02EndState
;1 = Gwyneth returns to the nucleus
;2 = Gwyneth is gone

;This global will be set when the player leaves the nucleus after the quest is done and this post-quest has started
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set when the player changes location away from the Nucleus

;Manage Sister Gwyneth

Actor GwynethREF = Alias_Gwyneth.GetActorRef()
ActorBase GwynethBASE = Alias_Gwyneth.GetActorRef().GetActorBase()

;if Gwyneth is leaving the island, disable her
if DLC03AtomM02.GetStageDone(540) == True
   DLC03AtomM02_ChurchEnableMarkerRef.Disable()
   Alias_Gwyneth.GetActorRef().Disable()
   DLC03CoA_AtomM02EndState.SetValue(2)
;if Gwyneth is returning to the Nucleus, move her there, set Protected on her and add her to the Children of Atom faction
elseif DLC03AtomM02.GetStageDone(530) == True
   GwynethREF.MoveTo(DLC03AtomM02Post_GwynethMoveTo)
   GwynethREF.AddToFaction(DLC03ChildrenOfAtomFaction)
   GwynethBASE.SetProtected()
   DLC03CoA_AtomM02EndState.SetValue(1)

   ;Add Gwyneth to Nucleus citizens ref collection if the quest hasn't already progressed past that point
    if DLC03MQ06_NukeHandling.IsRunning() && !DLC03MQ06_NukeHandling.GetStageDone(100)
      NucleusCitizens.AddRef(GwynethREF)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Gwyneth Auto Const Mandatory

ObjectReference Property DLC03AtomM02_ChurchEnableMarkerRef Auto Const Mandatory

ObjectReference Property DLC03AtomM02Post_GwynethMoveTo Auto Const Mandatory

GlobalVariable Property DLC03CoA_AtomM02EndState Auto Const Mandatory

Quest Property DLC03AtomM02 Auto Const Mandatory

Faction Property DLC03ChildrenOfAtomFaction Auto Const

RefCollectionAlias Property NucleusCitizens Auto Const Mandatory

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory
