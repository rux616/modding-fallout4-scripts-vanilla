Scriptname YoureSPECIALscript extends ObjectReference

ActorValue Property Strength Auto Const
ActorValue Property Perception Auto Const
ActorValue Property Endurance Auto Const
ActorValue Property Charisma Auto Const
ActorValue Property Intelligence Auto Const
ActorValue Property Agility Auto Const
ActorValue Property Luck Auto Const

Message Property YoureSpecialMessage Auto Const
bool Property HasBeenRead Auto

Event OnActivate(ObjectReference akActionRef)
	if HasBeenRead == false
		int ButtonPressed = YoureSpecialMessage.Show()

		if ButtonPressed == 0
			game.GetPlayer().SetValue( Strength, game.GetPlayer().GetBaseValue(Strength)+1 )
		elseif ButtonPressed == 1 
			game.GetPlayer().SetValue( Perception, game.GetPlayer().GetBaseValue(Perception)+1)
		elseif ButtonPressed == 2
			game.GetPlayer().SetValue( Endurance, game.GetPlayer().GetBaseValue(Endurance)+1)
		elseif ButtonPressed == 3 
			game.GetPlayer().SetValue( Charisma, game.GetPlayer().GetBaseValue(Charisma)+1)
		elseif ButtonPressed == 4
			game.GetPlayer().SetValue( Intelligence, game.GetPlayer().GetBaseValue(Intelligence)+1)
		elseif ButtonPressed == 5
			game.GetPlayer().SetValue( Agility, game.GetPlayer().GetBaseValue(Agility)+1)
		elseif ButtonPressed == 6
			game.GetPlayer().SetValue( Luck, game.GetPlayer().GetBaseValue(Luck)+1)
		endif

		HasBeenRead = true
	endif
EndEvent
