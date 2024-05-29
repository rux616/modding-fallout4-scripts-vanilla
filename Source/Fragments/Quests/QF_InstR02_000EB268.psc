;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstR02_000EB268 Extends Quest Hidden Const

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
;Set in the speech challenge when the player returns to hand in the tissue sample

;Give reward
Game.GetPlayer().AddItem(Stimpak, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set during Clayton's end scene when Clayton takes the report from the player.

;Add the report to Max
Alias_Max.GetActorReference().AddItem(Alias_Report.GetReference())
Game.GetPlayer().RemoveItem(Alias_Report.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set at the end of Max's initial scene

SetObjectiveDisplayed(10)
Alias_DungeonMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set at the end of the synth scavenger's scene

;Hand over the status report
Game.GetPlayer().AddItem(Alias_Report.GetReference())

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
InstR02Global.SetValue(1)

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
                if akSender == Game.GetPlayer() && akOldLoc == InstituteLocation && InstR02.GetStageDone(1000)
                                ; CHECK FOR old/new location matching whatever you want, quest stage, etc.- then DO SOMETHING!!
                	InstR02.Stop()
                	; if quest InstR02 is on stage 1000 (completion stage), stop the quest
                	; This allows the quest to restart when the player returns to the Institute later
                endif
EndEvent

MiscObject Property PrewarMoney Auto Const

ReferenceAlias Property Alias_Report Auto Const

ReferenceAlias Property Alias_max Auto Const

GlobalVariable Property InstR01Global Auto Const

GlobalVariable Property InstR02Global Auto Const

Potion Property Stimpak Auto Const

Quest Property InstR02 Auto Const

Location Property InstituteLocation Auto Const

GlobalVariable Property XPRadiant Auto Const

GlobalVariable Property InstR02FirstCompletion Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const
