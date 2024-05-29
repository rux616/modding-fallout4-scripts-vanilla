Scriptname MQ00Script extends Quest Conditional

GlobalVariable Property PlayerBoS_KickedOut Auto
GlobalVariable Property PlayerRailroad_KickedOut Auto
GlobalVariable Property PlayerInstitute_KickedOut Auto
Quest Property Inst308 Auto
Quest Property MQ302 Auto
SoundCategory Property AudioCategoryMaster Auto
SoundCategorySnapshot Property CSEndgameBink Auto
GlobalVariable Property MQ302Faction Auto

;custom event to handle getting kicked out of a Faction
CustomEvent MQFactionKickOut

; since we don't have enums:
int property Faction01_Brotherhood = 1 auto const
int property Faction02_Minutemen = 2 auto const
int property Faction03_Railroad = 3 auto const
int property Faction04_Institute = 4 auto const

Faction[] property Factions auto const
{ array of factions, indexed by factionID-1 
	this may be temp once the factions are handling the kickout themselves
}

Faction property PlayerFaction auto const

;function to call when the player is kicked out of a Faction
Function MQFactionKickoutPlayer(int FactionNumber)
	;set global variable to track that you've been kicked out
	;Brotherhood of Steel branch
	If FactionNumber == Faction01_Brotherhood
		PlayerBoS_KickedOut.SetValueInt(1)
	;Railroad branch
	ElseIf FactionNumber == Faction03_Railroad
		PlayerRailroad_KickedOut.SetValueInt(1)
	;Institute branch
	ElseIf FactionNumber == Faction04_Institute
		PlayerInstitute_KickedOut.SetValueInt(1)
	EndIf
	
	; TEMP? make the faction enemies of the player
	;   ... remove after faction kickout is done on each faction
	PlayerFaction.SetEnemy(Factions[FactionNumber-1])

	;send the MQFactionKickOut event to anyone listening for it
	;define the array to send
	Var[] kargs = new Var[1]
	kargs[0] = FactionNumber
	SendCustomEvent("MQFactionKickOut", kargs)
EndFunction

Function EndGameBinks()
	;lock player controls
	InputEnableLayer myLayer = InputEnableLayer.Create()
	myLayer.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=True, abLooking=True, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=True, abVATS=True, abFavorites=True)

	;fade game out
	Game.SetCharGenHudMode(3)
	Game.FadeOutGame(True, True, 0.0, 2.0, True)
	Utility.Wait(5.0)
	;fade down sound and mute everything
	CSEndgameBink.Push(5.0)
	;did we win with the Institute?
	Int myFactionWinner = MQ302Faction.GetValueInt()
	;Play Binks	
	;Male path
	If (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 0
		;Institute destroyed ending
		If myFactionWinner != Faction04_Institute
			Game.PlayBink("Endgame_MALE_A.bk2", abInterruptible=true)			
		;Institute saved ending
		Else
			Game.PlayBink("Endgame_MALE_B.bk2", abInterruptible=true)
			Inst308.SetStage(40)
		EndIf
	;female path
	Else
		;Institute destroyed ending
		If myFactionWinner != Faction04_Institute
			Game.PlayBink("Endgame_FEMALE_A.bk2", abInterruptible=true)			
		;Institute saved ending
		Else
			Game.PlayBink("Endgame_FEMALE_B.bk2", abInterruptible=true)
			Inst308.SetStage(40)
		EndIf
	EndIf
	;wait a bit for the Binks to finish
	Utility.Wait(2.0)
	;unmute everything
	CSEndgameBink.Remove()
	;fade game in
	Game.SetCharGenHudMode(0)
	Game.FadeOutGame(False, True, 0.0, 2.0)

	;kill the input layer so the player has controls again
	myLayer=None

	Utility.Wait(3.0)

	If MQ302.GetStageDone(700) == 1
		MQ302.SetStage(900)
	ElseIf Inst308.GetStageDone(10) == 1
		Inst308.SetStage(50)
	EndIf

EndFunction