Scriptname DLC01:DLC01EyeBotHolotapes extends Actor Const


Quest Property DLC01MQ02 Auto Const Mandatory
Quest Property DLC01MQ04 Auto Const Mandatory
Quest Property DLC01MQ05 Auto Const Mandatory
Holotape Property DLC01MechanistRadio_MainHolotape Auto Const Mandatory
Holotape Property DLC01MechanistRadio_SecondHolotape Auto Const Mandatory
Holotape Property DLC01MechanistRadio_ThirdHolotape Auto Const Mandatory

Event OnDying(Actor akKiller)
	If DLC01MQ02.GetStageDone(3000) == 0
		AddItem(DLC01MechanistRadio_MainHolotape, 1, true)
	ElseIf DLC01MQ02.GetStageDone(3000) == 1 && DLC01MQ04.GetStageDone(255) == 0
		AddItem(DLC01MechanistRadio_SecondHolotape, 1, true)
	ElseIf DLC01MQ04.GetStageDone(255) == 1 && DLC01MQ05.GetStageDone(1000) == 0
		AddItem(DLC01MechanistRadio_ThirdHolotape, 1, true)
	EndIf
EndEvent