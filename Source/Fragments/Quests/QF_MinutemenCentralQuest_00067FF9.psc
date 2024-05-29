;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinutemenCentralQuest_00067FF9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE minutemencentralscript
Quest __temp = self as Quest
minutemencentralscript kmyQuest = __temp as minutemencentralscript
;END AUTOCAST
;BEGIN CODE
MinutemenRecruitmentOn.SetValue(1.0)
kmyQuest.TryToStartRecruitmentQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
PrestonHeroChance.SetValue(15.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Min02.Start()
PrestonHeroChance.SetValue(20.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE minutemencentralscript
Quest __temp = self as Quest
minutemencentralscript kmyQuest = __temp as minutemencentralscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TurnOnRadioStation()
kmyQuest.TryToStartRecruitmentQuest()
PrestonHeroChance.SetValue(25.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
PrestonHeroChance.SetValue(30.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
PrestonHeroChance.SetValue(35.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MinutemenRecruitmentOn Auto Const

Quest Property Min02 Auto Const

GlobalVariable Property PrestonHeroChance Auto Const
