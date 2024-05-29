Scriptname DansePostQuestBoSHostilityScript extends Actor
{handles making player an enemy of BoS when Danse is current companion and near the player}

Faction Property BrotherhoodofSteelFaction const auto
Faction Property CurrentCompanionFaction const auto

Message Property DanseBosHostilityMessageOn const auto
Message Property DanseBosHostilityMessageOff const auto
;Popping these message should help alleviate weirdness if you tell Danse to wait somewhere far away and run into BoS... 
;The player will hopefully accept it because we tell him what's happening at the time he hires/fires Danse


bool IsBoSHostile

float timerGameTimeInterval =  12.0 const

Actor PlayerRef


Event OnLoad() ;just in case CompanionChange events come in simultaneously and out of order
	if IsBoSHostile
    	Process() 
    endif
EndEvent

Event OnTimerGameTime(int aiTimerID)
	Process()
EndEvent

Function MakeBoSHostile()
    PlayerRef = Game.GetPlayer()
    RegisterForCustomEvent(FollowersScript.GetScript(), "CompanionChange")
	RemoveFromFaction(BrotherhoodofSteelFaction)
	SetCrimeFaction(None)
	IsBoSHostile = true
	Process()
EndFunction

Event FollowersScript.CompanionChange(FollowersScript akSender, Var[] akArgs)
	Actor ActorThatChanged = akArgs[0] as Actor
	Bool IsNowCompanion = akArgs[1] as Bool

	debug.trace(self + "CompanionChange() ActorThatChanged:" + ActorThatChanged + ", IsNowCompanion:" + IsNowCompanion)

	if ActorThatChanged == self
		Process(showMessage = true)
	endif

EndEvent

bool ProcessLocked
Function Process(bool showMessage = false)
	while ProcessLocked
		debug.trace(self + "ProcessLocked, waiting")
		utility.wait(1)
	endwhile
	ProcessLocked = true
	debug.trace(self + "Process()")

	CancelTimerGameTime()

	if IsBoSHostile

		if IsInFaction(CurrentCompanionFaction)
			if showMessage
				DanseBoSHostilityMessageOn.Show()
			endif

			BrotherhoodofSteelFaction.SetPlayerEnemy(true)
			StartTimerGameTime(timerGameTimeInterval)

			debug.trace(self + "SETTING BOS PLAYER ENEMY")

		else 
			if showMessage
				DanseBoSHostilityMessageOff.Show()
			endif

			;there is likely a slight exploit here which is if you make them mad normally, then hire and fire Danse, they will stop being mad at you too soon.
			BrotherhoodofSteelFaction.SetPlayerEnemy(false)
			debug.trace(self + "CLEARING BOS PLAYER ENEMY")
			
			if IsInFaction(CurrentCompanionFaction)
				StartTimerGameTime(timerGameTimeInterval)
			endif

		endif

	endif

	ProcessLocked = false
EndFunction