Scriptname DLC03:DLC03AtomM01Script extends Quest Conditional

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Manages shutting down quest on kick out from Children}

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory
{Manages shutting down quest on kick out from Children}

int Property iMotherApproachDistance = 450 Auto Const
{Distance to kick off mother's walk into fog}

ReferenceAlias Property MotheroftheFog Auto Const Mandatory
{Mother of Fog Alias}

int Property iCoAKickOutStage = 700 Auto Const 
{Stage for Children of Atom kick out on DLC03CoA_Kickout}

ReferenceAlias Property SpringTrigger Auto Const Mandatory
{The trigger around the spring}

EffectShader Property DLC03FogMotherFXS Auto Const Mandatory
{Effect shader for Mother of Fog and shadow stags}

float Property fMotherSceneFailSafeTimerLength = 30.0 Auto Const
{length for Mother's fail safe timer}

float Property fMotherApproachTimerLength = 2.5 Auto Const
{length of time before Mother approaches the ledge after being enabled}

GlobalVariable Property DLC03AtomM01_PlayerLostVisionEffect Auto Const
{Global to inform music that the player has lost the hallucination effect}

Faction Property DLC03AtomM01EncounterFaction Auto Const Mandatory
{Mother of the Fog and Vision creature factions}

Faction[] Property VisionFriendlyFaction Auto Const
{Array of factions to make the Mother friends with at quest start}

;Local vars
int iShrineTimerID = 1 Const
int iPuzzleLaughAudioID = 2 Const
int iPuzzleCryAudioID = 3 Const
int iMotherSceneFailsafeTimerID = 4 Const
int iMotherApproachTimerID = 5 Const
bool bCryPlaying = false
bool bLaughPlaying = false

Event OnQuestInit()
	;When quest starts, register for OnStageSet event on Kickout quest
	RegisterforRemoteEvent(DLC03CoA_Kickout, "OnStageSet")

	DLC03:DLC03MQ06_NukeHandlingScript NukeScript = (DLC03MQ06_NukeHandling as DLC03MQ06_NukeHandlingScript)
	RegisterforCustomEvent(NukeScript, "NukeCountdownStarted")

	;Register for a custom event for if the spring effect expires
	DLC03:DLC03AtomSpringScript myTrigger = (SpringTrigger.GetRef() as DLC03AtomSpringScript)
	RegisterforCustomEvent(myTrigger, "EffectExpired")

	;Make creature factions friendly to visions
	MakeCreatureFactionsFriendlyToVision()
EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)
	;If the kick out stage gets set, shut this quest down
	if aksender == DLC03CoA_Kickout && auiStageID == iCoAKickOutStage
		SetStage(750)
	endif
EndEvent

Event DLC03:DLC03MQ06_NukeHandlingScript.NukeCountdownStarted(DLC03:DLC03MQ06_NukeHandlingScript akSender, Var[] akArgs)
	;If the nuke countdown has started, fail this quest
	SetStage(750)
EndEvent

Event DLC03:DLC03AtomSpringScript.EffectExpired(DLC03:DLC03AtomSpringScript aksender, Var[] akArgs)
	;If the effect has expired, but the player hasn't yet reached the final location with the Mother
	;disable mother, replace with note and set appropriate global
	DLC03AtomM01_PlayerLostVisionEffect.SetValue(1)

	ObjectReference MotherRef = MotheroftheFog.GetRef()

	if GetStageDone(20)
		if !MotherRef.IsDisabled() && !GetStageDone(40) && !GetStageDone(60)
			SetStage(57)
		else
			SetStage(58)
		endif
	endif
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == iMotherSceneFailsafeTimerID
		;Triggered when Mother is enabled (stage 20). When this timer is complete, if stage 30 isn't completed, complete it now
		SetStage(30)
		
	elseif aiTimerID == iMotherApproachTimerID
		;Triggered when Mother is enabled (stage 20). When this timer is complete, if stage 21 isn't completed, complete it now
		SetStage(21)
	endif
EndEvent

Function StartMotherApproachTimer()
	;Called from Stage 20. Sets stage 21 to get mother moving towards her first location
	StartTimer(fMotherApproachTimerLength, iMotherApproachTimerID)
EndFunction

Function StartMotherFailsafeTimer()
	;Called from Stage 20. Sets stage 30 in case Mother can't finish her intial scene for some reason
	StartTimer(fMotherSceneFailSafeTimerLength, iMotherSceneFailsafeTimerID)
EndFunction

Function CancelMotherFailsafeTimer()
	CancelTimer(iMotherSceneFailsafeTimerID)
EndFunction

Function DisableHallucinations()
	;Turn off the hallucination 
	DLC03:DLC03AtomSpringScript SpringScript = (SpringTrigger.GetRef() as DLC03AtomSpringScript)
	SpringScript.DeactivateVisualHallucination()
	SpringScript.DeactivateAudioHallucination()
EndFunction

Function MakeCreatureFactionsFriendlyToVision()
	int i = 0
	int iLength = VisionFriendlyFaction.length

	;Set each of the factions in the Vision Friendly Faction array to friendly with the vision faction
	while i < iLength
		DLC03AtomM01EncounterFaction.SetAlly(VisionFriendlyFaction[i], true, true)

		i += 1
	EndWhile
EndFunction