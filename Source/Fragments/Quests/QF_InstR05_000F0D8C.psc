;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstR05_000F0D8C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Set when the quest begins
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set if the player passes the speech challenge
;Give the player 100 caps

Game.GetPlayer().AddItem(Caps001, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set when the player turns in the item to the questgiver

;Turn in the item
Game.GetPlayer().RemoveItem(Alias_Item.GetReference(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Add the report to the player's inventory

;Give player the item
Game.GetPlayer().AddItem(Alias_Item.GetReference(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set at the end of the questgiver's initial scene

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set when the player completes the primary objective

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Give Reward NO LONGER USED
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;Set the Global so the game knows the quest has been completed at least once (dialogue condition)
InstR05Global.SetValue(1)

CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Event OnQuestInit()
                ; register for events
                ; RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
                ; watch for player to change location
                if akSender == Game.GetPlayer() && akOldLoc == InstituteLocation && InstR05.GetStageDone(1000)
                                ; CHECK FOR old/new location matching whatever you want, quest stage, etc.- then DO SOMETHING!!
                	InstR05.Stop()
                	; if quest is on stage 1000 (completion stage), stop the quest
                	; This allows the quest to restart when the player returns to the Institute later
                endif
EndEvent

ReferenceAlias Property Alias_marker Auto Const

Quest Property InstR05 Auto Const

Location Property InstituteLocation Auto Const

GlobalVariable Property XPRadiant Auto Const

ReferenceAlias Property Alias_Synth Auto Const

ReferenceAlias Property Alias_Item Auto Const

GlobalVariable Property InstR05Global Auto Const

MiscObject Property Caps001 Auto Const
