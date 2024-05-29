;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRecruitChangeLocationS_0009891D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; script event to fire up recruitment quest at this location

; only send event if this location has population
WorkshopScript workshopRef = Alias_SettlementWorkshop.GetRef() as WorkshopScript
debug.trace(self + " started at " + workshopRef + " " + workshopRef.myLocation)

if workshopRef && workshopRef.GetBaseValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingPopulation].resourceValue) > 0
	MinRecruitmentStart.SendStoryEvent(akLoc = workshopRef.myLocation, akRef1 = workshopRef)		
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property MinRecruitmentStart Auto Const

LocationAlias Property Alias_SettlementLocation Auto Const

ReferenceAlias Property Alias_SettlementWorkshop Auto Const

workshopparentscript Property WorkshopParent Auto Const
