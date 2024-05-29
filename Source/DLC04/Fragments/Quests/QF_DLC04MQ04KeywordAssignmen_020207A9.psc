;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ04KeywordAssignmen_020207A9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Roll through all workshops and apply the "First batch" keyword
Alias_TaffingtonWorkshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_FinchFarmWorkshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_CroupManorWorkshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_Farm06Workshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_Farm04Workshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_KingsportLighthouseWorkshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_SlogWorkshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_RedRocketWorkshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_ZimonjaWorkshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_CoastalCottageWorkshop.GetRef().AddKeyword(WorkshopType02FirstBatch)
Alias_Farm02Workshop.GetRef().AddKeyword(WorkshopType02FirstBatch)

;Now shut it down
Stop()
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
