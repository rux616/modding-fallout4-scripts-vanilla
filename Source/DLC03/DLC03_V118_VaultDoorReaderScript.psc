Scriptname DLC03:DLC03_V118_VaultDoorReaderScript extends ObjectReference 
{This script controls the Vault Door Keycard Readers in Vault 118}


int Property VaultNumber = 1 Auto Const
{1 = Gilda & Keith
2 = Ezra
3 = Player
4 = Santiago
5 = Juliana & Bert
6 = Spencer}
Group KeycardProperties CollapsedOnRef
	MiscObject property DLC03_V118_Keycard_GildaKeith Auto Const Mandatory
	MiscObject property DLC03_V118_Keycard_Ezra Auto Const Mandatory
	MiscObject property DLC03_V118_Keycard_Player Auto Const Mandatory
	MiscObject property DLC03_V118_Keycard_Santiago Auto Const Mandatory
	MiscObject property DLC03_V118_Keycard_Spencer Auto Const Mandatory
	MiscObject property DLC03_V118_Keycard_Julianna Auto Const Mandatory
EndGroup

Group Fixed_Properties CollapsedOnRef
	Message property IDCardReaderMessageNeedsCard auto const mandatory
	{Failure message to display if the player doesn't have the card.}

	Sound property NeedsCardFailureSound auto const mandatory
	{Failure sound to play if the player doesn't have the card.}

	Message property IDCardReaderMessageLockdown auto const mandatory
	{Failure message to display if the card reader is locked down.}

	Sound property LockdownFailureSound auto const mandatory
	{Failure sound to play if the card reader is locked down.}

	Scene property Player_IDCardReaderActivation auto const mandatory
	{Player dialogue to play when the player activates the card reader without the card.}

	Quest Property DLC03_V118_ClueTracker Auto Const mandatory
	int Property StageToSet = 91 Auto Const
EndGroup

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
			GoToState("Busy")
			Actor player = Game.GetPlayer()
			if (akActionRef == player)
				int myAction = CountCards(player)
				;You have no keycards
				if myAction == 0
					NeedsCardFailureSound.Play(Self)
					IDCardReaderMessageNeedsCard.Show()
					Player_IDCardReaderActivation.Start()

				;You have the correct keycard
				elseif myAction == 1
					GoToState("Green")
					Self.WaitFor3DLoad()
					Self.playAnimationAndWait("play01", "End")
					GoToState("Done")
					if VaultNumber == 6
						DLC03_V118_ClueTracker.SetStage(StageToSet)
					endif
					GetLinkedRef().SetOpen()
				;You have an incorrect keycard
				elseif myAction == 2
					Self.WaitFor3DLoad()
					Self.playAnimationAndWait("play02", "End")
					LockdownFailureSound.Play(Self)
					GoToState("Waiting")
				else
					Debug.Trace(Self + " OH GOD BADNESS!")
				endif
			else
				GoToState("Waiting")
			endif
	EndEvent
EndState

State Busy
EndState

State Done

EndState

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Function Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;This Function counts the cards the player has and passes back an int
;	0 = no cards at all
;	1 = does not have the correct card
;	2 = Has cards, but not the correct one

int Function CountCards(Actor player)
	;Here we count what you have. This is probably not the most efficient way to do this
	;	¯\_(ツ)_/¯
	
	if player.GetItemCount(DLC03_V118_Keycard_GildaKeith)
		GildaKeithCard = 1
	else
		GildaKeithCard = 0
	endif

	if player.GetItemCount(DLC03_V118_Keycard_Ezra)
		EzraCard = 1
	else
		EzraCard = 0
	endif

	if player.GetItemCount(DLC03_V118_Keycard_Julianna)
		JulianaCard = 1
	else
		JulianaCard = 0
	endif

	if player.GetItemCount(DLC03_V118_Keycard_Player)
		PlayerCard = 1
	else
		PlayerCard = 0
	endif

	if player.GetItemCount(DLC03_V118_Keycard_Santiago)
		SantiagoCard = 1
	else
		SantiagoCard = 0
	endif

	if player.GetItemCount(DLC03_V118_Keycard_Spencer)
		SpencerCard = 1
	else
		SpencerCard = 0
	endif

	;Here we check the cards
	int CardTotal = (GildaKeithCard + EzraCard + PlayerCard + SantiagoCard + SpencerCard + JulianaCard)
	if VaultNumber == 1 && GildaKeithCard == 1
		return 1
	elseif VaultNumber == 2 && EzraCard == 1
		return 1
	elseif VaultNumber == 3 && PlayerCard == 1
		return 1
	elseif VaultNumber == 4 && SantiagoCard == 1
		return 1
	elseif VaultNumber == 5 && JulianaCard == 1
		return 1
	elseif VaultNumber == 6 && SpencerCard == 1
		return 1
	elseif CardTotal > 0
		;you have cards, but not the right one
		return 2
	else
		;you got no cards!
		return 0
	endif

EndFunction
int GildaKeithCard
int EzraCard
int PlayerCard
int SantiagoCard
int JulianaCard
int SpencerCard

