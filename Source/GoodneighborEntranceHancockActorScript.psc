Scriptname GoodneighborEntranceHancockActorScript extends Actor

;script to handle Hancock needing to have his Knife equipped over any other weapon
;need to have this script on the actor form since we need to have Hancock equip weapons normally again, but only AFTER DialogueGoodneighborEntrance is done

Quest Property DialogueGoodneighborEntrance Auto const
Weapon Property CompHancockKnife Auto const

Auto State GoodneighborEntranceState

	Event OnLoad()
		If DialogueGoodneighborEntrance.GetStageDone(100) == 0
			;Hancock must keep the knife equipped until we tell him otherwise
			Self.EquipItem(CompHancockKnife, abPreventRemoval=True)
		Else
			;Hancock can now equip anything
			gotostate("hasbeentriggered")
			Self.EquipItem(CompHancockKnife, abPreventRemoval=False)
		EndIf
	EndEvent

EndState

State hasbeentriggered
	;empty state
EndState