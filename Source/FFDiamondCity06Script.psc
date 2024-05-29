Scriptname FFDiamondCity06Script extends Quest Conditional

;tracker for how many relics we have
Int Property Num_Relics Auto Conditional

;track for how many relics we have turned Int
Int Property Num_TurnIns auto Conditional

;track how much money the player gets
;0 = 100 caps, 1 = 150 caps, 2 = 200 caps, 3 = 300 caps
Int Property var_Speech Auto Conditional

MiscObject Property Caps001 Auto Conditional

;check how much the player gets for each item
Function RewardForRelics()
	If var_Speech == 0
		Game.GetPlayer().AddItem(Caps001, 100)
	ElseIf var_Speech == 1
		Game.GetPlayer().AddItem(Caps001, 150)
	ElseIf var_Speech == 2
		Game.GetPlayer().AddItem(Caps001, 200)
	ElseIf var_Speech == 3
		Game.GetPlayer().AddItem(Caps001, 300)
	EndIf
EndFunction

