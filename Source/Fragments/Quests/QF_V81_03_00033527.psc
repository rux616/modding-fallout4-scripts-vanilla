;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_V81_03_00033527 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Jet, 1)
Game.GetPlayer().AddItem(Caps001, 75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100, true)
SetObjectiveCompleted(300, true)
SetObjectiveDisplayed(400, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400, true)
V81_03RachelAndBobby.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
game.GetPlayer().RemoveItem(Jet, 1)
SetObjectiveFailed(300, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Alias_Bobby.GetActorRef().GetActorBase().SetEssential(false)
Alias_Bobby.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;Bobby attacks the player
Alias_Bobby.GetActorRef().GetActorBase().SetEssential(false)
Actor Bobby = Alias_Bobby.GetActorRef()
Bobby.RemoveFromFaction(CrimeVault81)
Bobby.RemoveFromFaction(SettlementVault81)
Bobby.AddtoFaction(PlayerEnemyFaction)
V81BobbyHostileFaction.SetEnemy(PlayerFaction)
V81BobbyHostileFaction.SetEnemy(Vault81GuardFaction)
Bobby.StartCombat(Game.GetPlayer())
Bobby.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0675_Item_00
Function Fragment_Stage_0675_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, false)
SetObjectiveDisplayed(300, false)
SetObjectiveDisplayed(400, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400, true)
SetStage(1100)

Alias_Bobby.GetActorRef().GetActorBase().SetEssential(false)
Alias_Tina.GetActorRef().GetActorBase().SetEssential(false)
Alias_Rachel.GetActorRef().GetActorBase().SetEssential(false)

CompleteAllObjectives()
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;Stop quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property Jet Auto Const

ReferenceAlias Property Alias_Bobby Auto Const

Quest Property V81_03 Auto Const

Scene Property V81_03RachelAndBobby Auto Const

Faction Property PlayerEnemyFaction Auto Const

Faction Property Vault81GuardFaction Auto Const

ActorValue Property Aggression Auto Const

Faction Property V81BobbyHostileFaction Auto Const

Faction Property PlayerFaction Auto Const

Faction Property CrimeVault81 Auto Const

Faction Property SettlementVault81 Auto Const

MiscObject Property Caps001 Auto Const

ReferenceAlias Property Alias_Rachel Auto Const

ReferenceAlias Property Alias_Tina Auto Const
