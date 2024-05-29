;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstR03_000EC1E9 Extends Quest Hidden Const

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
;Set if the player passes the speech challenge with the synth scavenger
;Give the player 4 fusion cells

Game.GetPlayer().AddItem(AmmoFusionCell, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Evan takes the bluprints from the player
Alias_Questgiver.GetActorReference().AddItem(Alias_Item.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set at the end of Evan's initial scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set when the item is acquierd

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Give Reward
Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;Set the Global so the game knows the quest has been completed at least once (dialogue condition)
InstR03Global.SetValue(1)

CompleteAllObjectives()
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
                if akSender == Game.GetPlayer() && akOldLoc == InstituteLocation && InstR03.GetStageDone(900)
                                ; CHECK FOR old/new location matching whatever you want, quest stage, etc.- then DO SOMETHING!!
                	InstR03.Stop()
                	; if quest is on stage 900 (completion stage), stop the quest
                	; This allows the quest to restart when the player returns to the Institute later
                endif
EndEvent

ReferenceAlias Property Alias_marker Auto Const

ReferenceAlias Property Alias_Item Auto Const

ReferenceAlias Property Alias_Questgiver Auto Const

Quest Property InstR03 Auto Const

Location Property InstituteLocation Auto Const

GlobalVariable Property InstR03Global Auto Const

GlobalVariable Property XPRadiant Auto Const

Ammo Property AmmoFusionCell Auto Const
