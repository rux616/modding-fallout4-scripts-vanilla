;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS13CookeDies_0008C106 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE MS13CookeDiesScript
Quest __temp = self as Quest
MS13CookeDiesScript kmyQuest = __temp as MS13CookeDiesScript
;END AUTOCAST
;BEGIN CODE
; startup
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Colette.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE MS13CookeDiesScript
Quest __temp = self as Quest
MS13CookeDiesScript kmyQuest = __temp as MS13CookeDiesScript
;END AUTOCAST
;BEGIN CODE
; start initial investigation timer
kmyQuest.StartInvestigationTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MS13CookeDiesScript
Quest __temp = self as Quest
MS13CookeDiesScript kmyQuest = __temp as MS13CookeDiesScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerKnowsCookeIsDead = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MS13CookeDiesScript
Quest __temp = self as Quest
MS13CookeDiesScript kmyQuest = __temp as MS13CookeDiesScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.InvestigationDone()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Colette confronts player
setStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
; she stands down
setStage(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; make her enemy of player
MS13ColetteFaction.SetEnemy(PlayerFaction)
Alias_Colette.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE MS13CookeDiesScript
Quest __temp = self as Quest
MS13CookeDiesScript kmyQuest = __temp as MS13CookeDiesScript
;END AUTOCAST
;BEGIN CODE
; investigation done
setStage(100)
; she's ready to leave town
setStage(150)
; just in case, clear enemy state
MS13ColetteFaction.SetEnemy(PlayerFaction, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetStage(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE MS13CookeDiesScript
Quest __temp = self as Quest
MS13CookeDiesScript kmyQuest = __temp as MS13CookeDiesScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MS13.PaulBreaksBad()
actor paul = Alias_PaulPembroke.GetActorRef()
paul.GetActorBase().SetProtected(false)
paul.GetActorBase().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
; make Pembroke faction hostile to her
DmndPembrokeOwnerFaction.SetEnemy(MS13ColetteFaction, false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_Colette.GetRef().Disable()
; set "revenge time" (minimum time for her to attack player or Paul after "learning" they are guilty)
MS13ColetteRevengeStart.SetValue(GameDaysPassed.GetValue() + 150.0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_killer Auto Const

MS13Script Property MS13 Auto Const

ReferenceAlias Property Alias_HenryCooke Auto Const

ReferenceAlias Property Alias_PaulPembroke Auto Const

ReferenceAlias Property Alias_Colette Auto Const

Faction Property MS13ColetteFaction Auto Const

Faction Property PlayerFaction Auto Const

MiscObject Property Caps001 Auto Const

GlobalVariable Property MS13ColetteRevengeStart Auto Const

GlobalVariable Property GameDaysPassed Auto Const

Faction Property DmndPembrokeOwnerFaction Auto Const
