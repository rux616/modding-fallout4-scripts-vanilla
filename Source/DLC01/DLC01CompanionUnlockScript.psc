Scriptname DLC01:DLC01CompanionUnlockScript extends Quest conditional

actorvalue Property DLC01_CompanionFailedToUnlock const auto mandatory ;actor value to put on object when robot companion fails to hack it, so he won't try again.
int property CommandUnlockAttempts auto hidden conditional ;how many attempts to cait make to pick a lock?
bool  Property CommandUnlockSuccess auto hidden conditional


ReferenceAlias Property RobotCompanion const auto mandatory
{Autofill}

ReferenceAlias Property CommandActor const auto mandatory
{Autofill}

ReferenceAlias Property CommandTarget const auto mandatory
{Autofill}

ActorValue Property DLC01_Ability_Hacking const auto mandatory
{autofill;
actorvalue:
0 = can't hack
1 = can hack }


ActorValue Property DLC01_Ability_Lockpicking const auto mandatory
{autofill;
actorvalue:
0 = can't pick locks
1 = can pick locks }

VisualEffect Property DLC01EyebotInteractVFX Auto Const Mandatory

FollowersScript Property Followers const auto mandatory
{autofill}

scene Property DLC01COMRobotCompanion_UnlockScene const auto mandatory
{Autofill}


formlist Property VoiceTypeFormlist const auto Mandatory
{start scene only if robot has a voicetype in this liat}

Sound Property DLC01QSTMSATDoorActivate Auto Const
{Autofill}

;CRIBBED IMPLEMENTATION FROM FollowerScript

Event OnInit()
    RegisterForRemoteEvent(RobotCompanion, "OnCommandModeGiveCommand") ;used to start quests for specific behavior
EndEvent


;Companion command interface commands
Event ReferenceAlias.OnCommandModeGiveCommand(ReferenceAlias akSender, int aeCommandType, ObjectReference akTarget)

;	aeCommandType: Type of Command that is given, which is one of the following:
;
;    0 - None
;    1 - Call
;    2 - Follow
;    3 - Move
;    4 - Attack
;    5 - Inspect
;    6 - Retrieve
;    7 - Stay
;    8 - Release
;    9 - Heal 

	FollowersScript.trace(self, "OnCommandModeGiveCommand() aeCommandType: "  + aeCommandType + ", akTarget:" + akTarget)
	form BaseObject
	
	actor RobotRef = RobotCompanion.GetActorReference()

	voicetype RobotVoiceType = RobotRef.GetVoiceType()

	;returns negative if not found
	if VoiceTypeFormlist.find(RobotVoiceType) < 0
		FollowersScript.trace(self, "OnCommandModeGiveCommand() RobotVoiceType not in list, bailing out. " + RobotVoiceType)
		RETURN
	endif

	if akTarget
		 BaseObject = akTarget.GetBaseObject()
	endif

	FollowersScript.trace(self, "OnCommandModeGiveCommand() target BaseObject: "  + BaseObject)
		
	if (BaseObject is Container || BaseObject is Door) && akTarget.IsLocked() && RobotRef.GetValue(DLC01_Ability_Lockpicking)  == 1
		FollowersScript.trace(self, "OnCommandModeGiveCommand() will start unlocking scene.")
		RobotRef.EvaluatePackage(abResetAI=true) ;cancels the stay command
		DLC01COMRobotCompanion_UnlockScene.stop()
		CommandActor.ForceRefTo(RobotRef)
		CommandTarget.ForceRefTo(akTarget)
		DLC01COMRobotCompanion_UnlockScene.start()

	elseif BaseObject is Terminal && akTarget.IsLocked() && RobotRef.GetValue(DLC01_Ability_Hacking)  == 1
		FollowersScript.trace(self, "OnCommandModeGiveCommand() will start unlocking scene.")
		RobotRef.EvaluatePackage(abResetAI=true) ;cancels the stay command
		DLC01COMRobotCompanion_UnlockScene.stop()
		CommandActor.ForceRefTo(RobotRef)
		CommandTarget.ForceRefTo(akTarget)
		DLC01COMRobotCompanion_UnlockScene.start()

	endif
EndEvent


Function CommandUnlockStartNewAttempt()
	FollowersScript.trace(self, "CommandUnlockStartNewAttempt()")
	CommandUnlockSuccess = false
	CommandUnlockAttempts = 0

EndFunction

Function CommandUnlockPlayAnim()
	FollowersScript.trace(self, "CommandUnlockPlayAnim()")
	actor source = CommandActor.GetActorReference()
	objectReference target = CommandTarget.GetReference()

	DLC01EyebotInteractVFX.Play(Source, akFacingObject = target)
	DLC01QSTMSATDoorActivate.Play(Source)

EndFunction

Function CommandUnlockAttempt()
	FollowersScript.trace(self, "CommandUnlockAttempt()")
	objectReference source = CommandActor.GetReference()
	objectReference target = CommandTarget.GetReference()
	int lockLevel = target.GetLockLevel()
	FollowersScript.trace(self, "lockLevel: " + lockLevel)

	int roll = Utility.RandomInt(0, 110)
	FollowersScript.trace(self, "roll: " + roll)

	CommandUnlockSuccess = roll > lockLevel
	FollowersScript.trace(self, "CommandUnlockSuccess: " + CommandUnlockSuccess)


	if CommandUnlockSuccess
		target.unlock()

		if target.GetBaseObject() is Terminal
			Followers.NPCHumanHackingPasswordGood.play(source)
		else
			Followers.NPCHumanLockpickingUnlock.play(source)	
		endif

	else
		if target.GetBaseObject() is Terminal
			Followers.NPCHumanHackingPasswordBad.play(source)
		else
			Followers.NPCHumanLockpickingPickBreak.play(source)	
		endif
		
	endif

	CommandUnlockAttempts += 1	

EndFunction

Function CommandUnlockFailed()
	FollowersScript.trace(self, "CommandUnlockFailed()")
	objectReference target = CommandTarget.GetReference()
	target.setvalue(DLC01_CompanionFailedToUnlock, 1)
EndFunction
