;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ04KeywordAssignmen_010277CC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04AssignKeywordQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ04AssignKeywordQuestScript kmyQuest = __temp as DLC04:DLC04MQ04AssignKeywordQuestScript
;END AUTOCAST
;BEGIN CODE
;Apply the "Never available" keyword to other appropriate locations
Alias_CovenantWorkshop.GetRef().AddKeyword(WorkshopType02AlwaysExclude)

;Roll through all workshops and apply the "First batch" keyword
kmyquest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property WorkshopType02FirstBatch Auto Const Mandatory

ReferenceAlias Property Alias_TaffingtonWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_FinchFarmWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_CroupManorWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_Farm06Workshop Auto Const Mandatory

ReferenceAlias Property Alias_Farm04Workshop Auto Const Mandatory

ReferenceAlias Property Alias_KingsportLighthouseWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_SlogWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_RedRocketWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_ZimonjaWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_CoastalCottageWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_Farm02Workshop Auto Const Mandatory

ReferenceAlias Property Alias_AbernathyWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_StarlightDriveInWorkshop Auto Const Mandatory

Keyword Property WorkshopType02AlwaysExclude Auto Const Mandatory

ReferenceAlias Property Alias_CovenantWorkshop Auto Const Mandatory

ReferenceAlias Property Alias_WarwickWorkshop Auto Const Mandatory

Keyword Property WorkshopType02ChaseOffExclude Auto Const Mandatory
