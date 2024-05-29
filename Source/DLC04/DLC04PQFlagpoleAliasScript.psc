Scriptname DLC04:DLC04PQFlagpoleAliasScript extends ReferenceAlias

Int ButtonPressed
Quest Property DLC04MQ05 Auto Const Mandatory
Message Property DLC04PQFlagpoleMessageDisciples Auto Const Mandatory
Message Property DLC04PQFlagpoleMessageOperators Auto Const Mandatory
Message Property DLC04PQFlagpoleMessagePack Auto Const Mandatory
GlobalVariable Property ZoneClaimedGlobal Auto Const Mandatory
GlobalVariable Property DLC04EnemyGang Auto Const Mandatory
ObjectReference Property DisciplesFlag Auto Const Mandatory
ObjectReference Property OperatorsFlag Auto Const Mandatory
ObjectReference Property PackFlag Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
debug.trace("I am activating a flagpole post questline")

if DLC04MQ05.GetStageDone(255) == 1 && ZoneClaimedGlobal.GetValue() == 0
	if akActionRef == Game.GetPlayer()
		Debug.Trace("FlagPole Activated")
		if DLC04EnemyGang.GetValue() == 1
			ButtonPressed = DLC04PQFlagpoleMessageDisciples.Show()
			if ButtonPressed == 0
				Debug.Trace("Button 0 Pressed - Operators")
				;Kick Off the Enable for the Flag and the Zone
				OperatorsFlag.Enable()
				ZoneClaimedGlobal.SetValue(2)
			elseif ButtonPressed == 1
				Debug.Trace("Button 1 Pressed - Pack")
				;Kick Off the Enable for the Flag and the Zone
				PackFlag.Enable()
				ZoneClaimedGlobal.SetValue(3)
			endif
		elseif DLC04EnemyGang.GetValue() == 2
			ButtonPressed = DLC04PQFlagpoleMessageOperators.Show()
			if ButtonPressed == 0
				Debug.Trace("Button 0 Pressed - Disciples")
				;Kick Off the Enable for the Flag and the Zone
				DisciplesFlag.Enable()
				ZoneClaimedGlobal.SetValue(1)
			elseif ButtonPressed == 1
				Debug.Trace("Button 1 Pressed - Pack")
				;Kick Off the Enable for the Flag and the Zone
				PackFlag.Enable()
				ZoneClaimedGlobal.SetValue(3)
			endif			
		elseif DLC04EnemyGang.GetValue() == 3
			ButtonPressed = DLC04PQFlagpoleMessagePack.Show()
			if ButtonPressed == 0
				Debug.Trace("Button 0 Pressed - Disciples")
				;Kick Off the Enable for the Flag and the Zone
				DisciplesFlag.Enable()
				ZoneClaimedGlobal.SetValue(1)
			elseif ButtonPressed == 1
				Debug.Trace("Button 1 Pressed - Operators")
				;Kick Off the Enable for the Flag and the Zone
				OperatorsFlag.Enable()
				ZoneClaimedGlobal.SetValue(2)
			endif
		endif
	endif
endif

EndEvent