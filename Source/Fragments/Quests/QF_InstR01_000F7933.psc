;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstR01_000F7933 Extends Quest Hidden Const

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
;Set when Inst301 is complete
;Also set when the player changes location to the Institute
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set if the player succeeds at the speech challenge with the questgiver

;Give reward
Game.GetPlayer().AddItem(PrewarMoney, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set by the script on the boss collection alias

if GetStageDone(100) == True
     SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Set in the repeat scene if the player refuses the quest
;Used to condition a "Did you change your mind?" greeting on the questgiver
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set at the end of the questgiver's initial scene

SetObjectiveDisplayed(10)
Alias_DungeonMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set when the boss is killed

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
InstR01Global.SetValue(1)

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
                if akSender == Game.GetPlayer() && akOldLoc == InstituteLocation && InstR01.GetStageDone(1000)
                                ; CHECK FOR old/new location matching whatever you want, quest stage, etc.- then DO SOMETHING!!
                	InstR01.Stop()
                	; if quest InstR02 is on stage 1000 (completion stage), stop the quest
                	; This allows the quest to restart when the player returns to the Institute later
                endif
EndEvent

MiscObject Property PrewarMoney Auto Const

GlobalVariable Property InstR01Global Auto Const

Quest Property InstR01 Auto Const

Location Property InstituteLocation Auto Const

GlobalVariable Property XPRadiant Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const
