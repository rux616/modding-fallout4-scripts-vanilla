ScriptName DialogueGoodneighborScript extends Quest Conditional

Int Property MQ04IrmaReject Auto Conditional
;Has the player rejected going into the memory pod? 1 = yes

ActorValue Property Strength Auto Const
ActorValue Property Perception Auto Const
ActorValue Property Endurance Auto Const
ActorValue Property Charisma Auto Const
ActorValue Property Intelligence Auto Const
ActorValue Property Agility Auto Const
ActorValue Property Luck Auto Const

Int HighestSpecial Conditional
Int Property HateJazz Auto Conditional
Int Property MagnoliaFlirt Auto Conditional
Int Property DateComplete Auto Conditional
Int Property MagnoliaRelationshipOver Auto Conditional

Scene Property MagnoliaGreetScene03 Auto
ReferenceAlias Property Magnolia Auto
ObjectReference Property HotelPlayerMarkerREF Auto
ObjectReference Property HotelMagnoliaMarkerREF Auto
Spell Property LoversEmbracePerkSpell Auto

Function GetPlayerHighestSpecial()
	debug.trace(self + "GetPlayerHighestSpecial function started")
	Int HighestValue = 15

	Actor PlayerREF = Game.GetPlayer()
	Int PlayerStrengthValue = PlayerREF.GetValue(Strength) as Int
	debug.trace("PlayerStrengthValue is: " + PlayerStrengthValue)

	Int PlayerPerceptionValue = PlayerREF.GetValue(Perception) as Int
	debug.trace("PlayerPerceptionValue is: " + PlayerPerceptionValue)

	Int PlayerEnduranceValue = PlayerREF.GetValue(Endurance) as Int
	debug.trace("PlayerEnduranceValue is: " + PlayerEnduranceValue)

	Int PlayerCharismaValue = PlayerREF.GetValue(Charisma) as Int
	debug.trace("PlayerCharismaValue is: " + PlayerCharismaValue)

	Int PlayerIntelligenceValue = PlayerREF.GetValue(Intelligence) as Int
	debug.trace("PlayerIntelligenceValue is: " + PlayerIntelligenceValue)

	Int PlayerAgilityValue = PlayerREF.GetValue(Agility) as Int
	debug.trace("PlayerAgilityValue is: " + PlayerAgilityValue)

	Int PlayerLuckValue = PlayerREF.GetValue(Luck) as Int
	debug.trace("PlayerLuckValue is: " + PlayerLuckValue)

	While HighestValue > 0
		debug.trace(self + "GetPlayerHighestSpecial function is starting its While Loop")
		debug.trace("HighestValue is: " + HighestValue)
		If PlayerStrengthValue >= HighestValue
			HighestSpecial = 1
			Return
		ElseIf PlayerPerceptionValue >= HighestValue
			HighestSpecial = 2
			Return
		ElseIf PlayerEnduranceValue >= HighestValue
			HighestSpecial = 3
			Return
		ElseIf PlayerCharismaValue >= HighestValue
			HighestSpecial = 4
			Return
		ElseIf PlayerIntelligenceValue >= HighestValue
			HighestSpecial = 5
			Return
		ElseIf PlayerAgilityValue >= HighestValue
			HighestSpecial = 6
			Return
		ElseIf PlayerLuckValue >= HighestValue
			HighestSpecial = 7
			Return
		EndIf

		HighestValue = HighestValue - 1
	EndWhile
EndFunction



Function MagnoliaDate()
	InputEnableLayer myLayer = InputEnableLayer.Create()
	Actor myPlayer = Game.GetPlayer()
	Actor MagnoliaREF = Magnolia.GetActorRef()

	myLayer.DisablePlayerControls()
	Game.FadeOutGame(True, True, 0.0, 3.0, True)
	Utility.Wait(5.0)
	;Game.PassTime(4)
	Utility.Wait(0.1)
	MagnoliaREF.moveto(HotelMagnoliaMarkerREF)
	myPlayer.Moveto(HotelPlayerMarkerREF)
	Utility.Wait(0.1)

	Game.FadeOutGame(False, True, 0.0, 3.0)
	;track when the scene should progress
	DateComplete = 0
	MagnoliaGreetScene03.Start()
	Utility.Wait(3.0)
	LoversEmbracePerkSpell.Cast(myPlayer, myPlayer)
	DateComplete = 1
	myLayer = None
EndFunction
