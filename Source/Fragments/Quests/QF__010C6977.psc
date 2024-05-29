;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__010C6977 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set if the player passes the speech challenge with the synth scavenger
;Give the player 20 prewar dollars

Game.GetPlayer().AddItem(PrewarMoney, 20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set during Max's end scene when Max takes the report from the player.

;Add the report to Max
Alias_Max.GetActorReference().AddItem(Alias_Report.GetReference())
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
;Disable the synth scavenger
Alias_Synth.GetActorRef().Disable()

;Give Reward
;reward

;Set the Global so the game knows the quest has been completed at least once (dialogue condition)
InstR01Global.SetValue(1)

;Reset the quest so it can run again quest
CompleteAllObjectives()
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_marker Auto Const

ReferenceAlias Property Alias_Synth Auto Const

MiscObject Property PrewarMoney Auto Const

ReferenceAlias Property Alias_Report Auto Const

ReferenceAlias Property Alias_max Auto Const

GlobalVariable Property InstR01Global Auto Const
