Scriptname DLC04:WorkshopRaiderBeaconRecruitScript extends Quest Const
{quickly summon new workshop raiders}

ReferenceAlias Property Alias_Workshop Auto Const
ReferenceAlias Property Alias_WorkshopAttackMarker Auto Const

DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const

function Startup()
	; run random timer for new recruits to show up
	; how many new raiders?
	int recruitRoll = utility.randomint(1, 100)
	int recruitCount = 3
	if recruitRoll > 60
		recruitCount = 4
	elseif recruitRoll > 80
		recruitCount = 5
	endif
	debug.trace(self + " recruitRoll=" + recruitRoll + ", creating " + recruitCount + " raioers")
	WorkshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
	; create new settler for this workshop at nearby marker
	int i = 0
	while i < recruitCount
		DLC04WorkshopParent.CreateRaider(workshopRef, Alias_WorkshopAttackMarker.GetRef())
		i += 1
	endWhile

	Stop()
EndFunction
