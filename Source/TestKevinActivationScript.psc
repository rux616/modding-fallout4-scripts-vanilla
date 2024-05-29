 Scriptname TestKevinActivationScript extends ObjectReference
 {Getting more familiar with papyrus}

;So we have a coiuple problems here. At the moment only third person is available for Power Armor. 
;Also, activation is not working after changing race. I may try to put in a timer.
;


Race Property PowerArmorChange Auto
Int IsActivatedCount
Race PlayersOriginalRace
Race PlayersCurrentRace
SystemPowerArmorScript Property SystemPowerArmorQuest Auto


;On the initial activation, trap the players race so we can get back to it.
Event OnLoad()
	If IsActivatedCount == 0
		PlayersOriginalRace = Game.GetPlayer().GetRace()
	EndIf
EndEvent

;Change the player to power armor if he is human, or back to human if power armor
Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()							;Are you the player?
		IsActivatedCount = IsActivatedCount + 1				;Increment a debug counter so we can see if this is working by checking the variable in game
		PlayersCurrentRace = Game.GetPlayer().GetRace()		;Set the players current race to whatever the player happens to be now.
		If PlayersCurrentRace != PowerArmorChange			;If the player is not already power armor
			Game.GetPlayer().SetRace(PowerArmorChange)		;...set the race to power armor
			;Game.ForceThirdPerson()							;Throw him into first person. WJS - First person now works so removing this call
			Debug.MessageBox("You step into the Power Armor")
			;SystemPowerArmorQuest.PowerArmorStartUp(PlayersCurrentRace)	;Start the Power Armor System script
			PlayersCurrentRace = PowerArmorChange			;Now set the current race toggle to Power Armor
		Else
			Game.GetPlayer().SetRace(PlayersOriginalRace)		;If the player was already power armor let's turn him back into what he started as
			Debug.MessageBox("You exit the Power Armor")
			;SystemPowerArmorQuest.PowerArmorPlayerExit()		;Shut off the Power Armor System script
			PlayersCurrentRace = PlayersOriginalRace			;Now we can set the current race toggle as what the player started as.
		EndIf		
	EndIF
EndEvent