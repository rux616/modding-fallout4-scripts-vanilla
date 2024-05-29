Scriptname DLC04:DLC04RaiderControllerQuestScript extends Quest

GlobalVariable Property DLC04RankDisciples Auto Const Mandatory
GlobalVariable Property DLC04RankPack Auto Const Mandatory
GlobalVariable Property DLC04RankOperators Auto Const Mandatory
GlobalVariable Property DLC04GangIDDisciples Auto Const Mandatory
GlobalVariable Property DLC04GangIDPack Auto Const Mandatory
GlobalVariable Property DLC04GangIDOperators Auto Const Mandatory
GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

Int PointsDisciples
Int PointsPack
Int PointsOperators

;=RAIDER SCORING FUNCTIONS==============================================================================
;These functions are split in case any of them need to be directly accessed by a quest that doesn't need
;the standard stage set - "Points" are awarded when converting or adding a new settlement or park area
;from Nuka-World

Function ModRaiderScore(GlobalVariable GangID, Int Points)

	If GangID == DLC04GangIDDisciples
		PointsDisciples += Points
	ElseIf GangID == DLC04GangIDPack
		PointsPack += Points
	ElseIf GangID == DLC04GangIDOperators
		PointsOperators += Points
	EndIf

	ModRaiderRank()

EndFunction

Function ModRaiderRank()

	DLC04RankDisciples.SetValue(2)
	DLC04RankPack.SetValue(2)
	DLC04RankOperators.SetValue(2)

	If PointsDisciples > PointsPack && PointsDisciples > PointsOperators
		DLC04RankDisciples.SetValue(1)
	EndIf

	If PointsPack > PointsDisciples && PointsPack > PointsOperators
		DLC04RankPack.SetValue(1)
	EndIf

	If PointsOperators > PointsDisciples && PointsOperators > PointsPack
		DLC04RankOperators.SetValue(1)
	EndIf

	If PointsDisciples < PointsPack && PointsDisciples < PointsOperators
		DLC04RankDisciples.SetValue(3)
	EndIf

	If PointsPack < PointsDisciples && PointsPack < PointsOperators
		DLC04RankPack.SetValue(3)
	EndIf

	If PointsOperators < PointsDisciples && PointsOperators < PointsPack
		DLC04RankOperators.SetValue(3)
	EndIf

EndFunction

;=END RAIDER SCORING FUNCTIONS===========================================================================
