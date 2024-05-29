;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS13PaulDies_0008806F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE MS13PaulDiesScript
Quest __temp = self as Quest
MS13PaulDiesScript kmyQuest = __temp as MS13PaulDiesScript
;END AUTOCAST
;BEGIN CODE
; startup
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MS13PaulDiesScript
Quest __temp = self as Quest
MS13PaulDiesScript kmyQuest = __temp as MS13PaulDiesScript
;END AUTOCAST
;BEGIN CODE
; register for player change location events
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
; if "random" death in Diamond City, and witnessed - Darcy knows Paul is dead
if kmyQuest.DarcyInvestigation == 4 && kmyQuest.DeathWitnessed && kmyQuest.DiedInDiamondCity
	setStage(50)
	if kmyQuest.KilledByPlayer
		setStage(60)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MS13PaulDiesScript
Quest __temp = self as Quest
MS13PaulDiesScript kmyQuest = __temp as MS13PaulDiesScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerKnowsPaulIsDead = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE MS13PaulDiesScript
Quest __temp = self as Quest
MS13PaulDiesScript kmyQuest = __temp as MS13PaulDiesScript
;END AUTOCAST
;BEGIN CODE
; Darcy is now depressed
actor Darcy = Alias_DarcyPembroke.GetActorRef()
Darcy.RemoveKeyword(AnimArchetypeFriendly)
Darcy.AddKeyword(AnimArchetypeDepressed)
; start "find photo" timer
kmyQuest.StartFindPhotoTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
MS13.DarcyAllowedTaphouse = false
setStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
setStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_DarcyPembroke.GetRef().AddItem(Alias_MarowskiPhotoPaul.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN CODE
; Darcy willing to ask player for help
SetStage(205)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_MarowskiPhotoPaul.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
MS13FindPhoto.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
MS13FindPhoto.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; quest is done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; give Darcy half
Game.GetPlayer().RemoveItem(Caps001, MS13FindPhoto.MS13FindPhotoDarcyReward.GetValueInt(), false, Alias_DarcyPembroke.GetRef())
setStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
setStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_killer Auto Const

MS13Script Property MS13 Auto Const

ReferenceAlias Property Alias_DarcyPembroke Auto Const

MiscObject Property Caps001 Auto Const

Keyword Property AnimArchetypeFriendly Auto Const

Keyword Property AnimArchetypeDepressed Auto Const

ReferenceAlias Property Alias_MarowskiPhotoPaul Auto Const

MS13FindPhotoScript Property MS13FindPhoto Auto Const
