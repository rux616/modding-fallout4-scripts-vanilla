;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CZPostQuest_00138442 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE CZPostQuestScript
Quest __temp = self as Quest
CZPostQuestScript kmyQuest = __temp as CZPostQuestScript
;END AUTOCAST
;BEGIN CODE
;Trigger post-quest timer
kmyquest.SetPostQuestTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
If !Alias_Rulebreaker01.GetActorRef().IsDead()
  Alias_Rulebreaker01.GetRef().Disable()
endif

If !Alias_Rulebreaker02.GetActorRef().IsDead()
  Alias_Rulebreaker02.GetRef().Disable()
endif

;Turn off Rule Breakers' dialogue quest
DialogueCZRulebreakers.SetStage(100)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Rulebreaker01 Auto Const

ReferenceAlias Property Alias_Rulebreaker02 Auto Const

Quest Property DialogueCZRulebreakers Auto Const
