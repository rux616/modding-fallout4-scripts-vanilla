;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01072EED Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.Trace("DN138 Stage 0 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DN138QuestScript
Quest __temp = self as Quest
DN138QuestScript kmyQuest = __temp as DN138QuestScript
;END AUTOCAST
;BEGIN CODE
debug.Trace("DN138 Stage 10 Set")
DN138LoudSpeaker01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DN138QuestScript
Quest __temp = self as Quest
DN138QuestScript kmyQuest = __temp as DN138QuestScript
;END AUTOCAST
;BEGIN CODE
debug.Trace("DN138 Stage 20 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
debug.Trace("DN138 Stage 100 Set")
DN138BertScreaming.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
debug.Trace("DN138 Stage 200 Set")
Alias_IncineratorFire.GetReference().EnableNoWait()
utility.Wait(2)
Alias_IncineratorMirelurk.GetActorReference().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
debug.Trace("DN138 Stage 300 Set")
debug.MessageBox("Bert would now follow the player to Diamond City.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
debug.Trace("DN138 Stage 301 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0302_Item_00
Function Fragment_Stage_0302_Item_00()
;BEGIN CODE
debug.Trace("DN138 Stage 302Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.Trace("DN138 Stage 1000 Set")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_IncineratorFire Auto Const

ReferenceAlias Property Alias_IncineratorMirelurk Auto Const

Scene Property DN138BertScreaming Auto Const

Scene Property DN138Loudspeaker01 Auto Const
