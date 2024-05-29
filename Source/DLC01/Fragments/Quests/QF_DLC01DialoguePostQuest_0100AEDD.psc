;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01DialoguePostQuest_0100AEDD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Player is saying thank you for the Mechanist suit Isabel just gave them.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
;Player is being mean, telling Isabel to "get lost" when she wants to talk to them 
;once they've gotten her to stand down and taken control of her lair.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Fire scene for Ada to offer radiants.
;Triggered off of Stage 1100 in DLC01MQ05.
DLC01Dialogue_CodsworthOfferRadiants.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set global to track that player knows Isabel's name.
DLC01PlayerKnowsIsabelsName.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_IsabelCruz.Clear()
Alias_Sparks.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Player is being nice to isabel, trying to get her to say more about herself post quest.
;"You never know until you tell me."
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Player is being uncaring… Isabel is reflecting on how she could have made a difference 
;for the better and the player is saying they don’t have time for this.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Player is being nice to Isabel post quest, telling her, 
;at least she tried to do some good, even if it backfired.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Player is being mean to Isabel, saying she's only created a symbol of terror 
;and sarcastically telling her "way to go."
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set global to allow Isabel to give radiants.
DLC01MQPostQuestRadiantsEnabledMechanist.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Player being nice to Isabel. Trying to get her to tell them more about herself.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
If DLC01PlayerKnowsIsabelsName.GetValue() == 0 && DLC01MQ05.GetStageDone(680) == 0
   SetObjectiveDisplayed(401)
ElseIf DLC01MQ05.GetStageDone(680) == 0
   SetObjectiveDisplayed(402)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(401) == 1
   SetObjectiveCompleted(401)
Else
   SetObjectiveCompleted(402)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(401, False)
SetObjectiveDisplayed(402, False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC01Dialogue_CodsworthOfferRadiants Auto Const

DLC01:DLC01MQ03Script Property DLC01MQPostQuestRadiantParent Auto Const Mandatory

GlobalVariable Property DLC01MQPostQuestRadiantsEnabledMechanist Auto Const

ReferenceAlias Property Alias_IsabelCruz Auto Const Mandatory

ReferenceAlias Property Alias_Sparks Auto Const Mandatory

GlobalVariable Property DLC01PlayerKnowsIsabelsName Auto Const Mandatory

Quest Property DLC01MQ05 Auto Const
