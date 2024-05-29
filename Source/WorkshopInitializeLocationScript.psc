Scriptname WorkshopInitializeLocationScript extends Quest Conditional Const

workshopparentscript Property WorkshopParent Auto Const

function Startup()
	WorkshopScript workshopRef =  Workshop.GetRef() as WorkshopScript
	; add children to settlement NPCs collection
	SettlementNPCs.AddRefCollection(SettlementChildren)
	SettlementNPCs.AddRefCollection(SettlementRobots)
	WorkshopParent.InitializeLocation(workshopRef, SettlementNPCs, SettlementLeader, MapMarker)
	Stop()
endFunction


RefCollectionAlias Property SettlementNPCs Auto Const

RefCollectionAlias Property SettlementChildren Auto Const

RefCollectionAlias Property SettlementRobots Auto Const

ReferenceAlias Property SettlementLeader Auto Const

ReferenceAlias Property Workshop Auto Const

ReferenceAlias Property MapMarker Auto Const
