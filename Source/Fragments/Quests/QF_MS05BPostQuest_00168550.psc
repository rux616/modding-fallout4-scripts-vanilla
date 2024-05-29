;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS05BPostQuest_00168550 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
(Alias_PoppaDeathclaw.GetActorRef()).RemoveFromFaction(pPoppaDeathclawFaction)
(Alias_PoppaDeathclaw.GetActorRef()).SetValue(Game.GetAggressionAV(), 2)
(Alias_PoppaDeathclaw.GetActorRef()).StartCombat(Game.GetPlayer())

;Shut down Poppa Greeting quest
MS05BGreetPoppa.SetStage(100)

if !pMS05B.SetStage(510)
  pMS05B.SetStage(510)
endif

if Alias_Wellingham.GetActorRef().IsDead()
  self.setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;If stage 20's not done, do it (DO IT NOW!)

if !self.GetStageDone(20)
  self.SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(pRewardCaps, 1)
self.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PoppaDeathclaw Auto Const

Faction Property pPoppaDeathclawFaction Auto Const

LeveledItem Property pRewardCaps Auto Const

Quest Property pMS05B Auto Const

ReferenceAlias Property Alias_Wellingham Auto Const

Quest Property MS05BGreetPoppa Auto Const
