;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_WorkshopSummonedByBell_000C4435 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE WorkshopSummonedByBellScript
Quest __temp = self as Quest
WorkshopSummonedByBellScript kmyQuest = __temp as WorkshopSummonedByBellScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " START")
ObjectReference[] workshopNPCs = WorkshopParent.GetWorkshopActors(Alias_Workshop.GetRef() as WorkshopScript)
; add them all to the collection
int i = 0
while i < workshopNPCs.Length
	ObjectReference theNPC = workshopNPCs[i]
	; what distance to travel (to randomize a bit)
	int dieRoll = Utility.RandomInt(0, 2)
	theNPC.SetValue(WorkshopBellDistance, dieRoll)
	Alias_WorkshopNPCs.AddRef(theNPC)
	i += 1
endWhile
; start timer
kmyQuest.StartTimerGameTime(0.5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

workshopparentscript Property WorkshopParent Auto Const

ActorValue Property WorkshopBellDistance Auto Const
