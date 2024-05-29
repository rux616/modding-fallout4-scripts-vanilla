Scriptname DLC01:DLC01BotCrippleMobilityOnLoad extends ObjectReference
{A one-off script for the Sentry Bot 'Turret' in the Mechanist boss battle. Cripples its mobility conditions on load to prevent it from moving.}

;Autofill properties.
ActorValue property LeftMobilityCondition Auto Const Mandatory
ActorValue property RightMobilityCondition Auto Const Mandatory
Keyword property ActorMobilityInjuredLeft Auto Const Mandatory
Keyword property ActorMobilityInjuredRight Auto Const Mandatory

Event OnLoad()
	Self.DamageValue(LeftMobilityCondition, 10000)
	Self.DamageValue(RightMobilityCondition, 10000)
EndEvent