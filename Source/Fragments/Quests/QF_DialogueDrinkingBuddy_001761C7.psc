;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueDrinkingBuddy_001761C7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DialogueDrinkingBuddyScript
Quest __temp = self as Quest
DialogueDrinkingBuddyScript kmyQuest = __temp as DialogueDrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().addItem(BeerGwinnettPale, 1)
Alias_DrinkingBuddy.GetActorRef().MakePlayerFriend()
DN137DrinkingBuddyCommentMarker.MoveTo(Alias_DrinkingBuddy.GetReference())
kmyQuest.InitBrewing()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DialogueGoodneighborRufus.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if DN137DrinkingBuddyCommentMarker
DN137DrinkingBuddyCommentMarker.Delete()
endif
DialogueGoodneighborRufus.SetStage(505)

If True

Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
DialogueGoodneighborRufus.SetStage(520)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DialogueDrinkingBuddyScript
Quest __temp = self as Quest
DialogueDrinkingBuddyScript kmyQuest = __temp as DialogueDrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
if DN137DrinkingBuddyCommentMarker
	DN137DrinkingBuddyCommentMarker.Delete()
endif
kMyQuest.IsInDeliveryMode = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE DialogueDrinkingBuddyScript
Quest __temp = self as Quest
DialogueDrinkingBuddyScript kmyQuest = __temp as DialogueDrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.IsInDeliveryMode = false
kMyQuest.livesInRexford = true
kMyQuest.WaitingForHome = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
if Alias_DrinkingBuddy.GetActorRef().GetKiller() == game.GetPlayer()
	SetStage(501)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property BeerGwinnettPale Auto Const

ReferenceAlias Property Alias_DrinkingBuddy Auto Const

ObjectReference Property DN137DrinkingBuddyCommentMarker Auto Const

Quest Property DN134 Auto Const

Quest Property DialogueGoodneighborRufus Auto Const
