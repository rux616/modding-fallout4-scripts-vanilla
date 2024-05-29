Scriptname MQ101KelloggSequenceScript extends Quest Conditional

ReferenceAlias Property SpousePod Auto Const
ReferenceAlias Property PlayerPod Auto Const
ReferenceAlias Property PlayerPod3rdPerson Auto Const
ReferenceAlias Property Kellogg Auto Const
ReferenceAlias Property KelloggNamed Auto Const
ReferenceAlias Property Spouse auto const
ReferenceAlias Property PlayerDuplicate auto const
ReferenceAlias Property SpouseMale auto const
ReferenceAlias Property SpouseFemale auto const
ReferenceAlias Property InstScientistFemale Auto Const
ReferenceAlias Property InstScientistMale Auto Const
ReferenceAlias Property MultiActorFurniture Auto Const
ReferenceAlias Property MQ101PlayerDuplicate Auto Const

MQ203Script:MemoryActor[] Property AllActors Auto Const
{ array of all actors for ease of pausing AI - used by FFGoodneighbor01MemorySequence version }

Quest Property MQ101 Auto Const
Sound Property WPNPistol44magFirePlayer Auto Const
Scene Property KelloggScene Auto

Quest Property FFGoodneighbor01MemorySequence Auto Const
MQ105Script property MQ105 auto const
ObjectReference Property MQ105SceneStartMarker const auto
ObjectReference property MQ105Vault111Door const auto

group StartMarkers
	ObjectReference Property MQ101InstFemaleMarker01 const auto
	ObjectReference Property MQ101InstFemaleChargenStartMarker const auto
	ObjectReference Property MQ101InstMaleMarker01 const auto
	ObjectReference Property MQ101KelloggMarker01 const auto
	ObjectReference Property MQ101KelloggChargenStartMarker const Auto
endGroup

MQ203Script property MQ203 auto const

ObjectReference Property MQ203Vault111LayerMarker const auto

Outfit Property Vault111SuitPlayerSpouse Const Auto
Outfit Property Vault111SuitNoLoot Const Auto
Keyword Property UseFurnitureDeath Auto
Keyword Property AnimFurnCryopodPanic Auto
Keyword Property AnimFurnInCryopodAwake Auto
Keyword Property AnimFurnMaleSpouse Auto
Keyword Property AnimFurnFemaleSpouse Auto
Keyword Property AnimFurnSpouse Auto
Armor Property BabyBundled Auto

Int Property SpouseSitPod Auto Conditional
{Should the Spouse be sitting in the Cryopod?}

Int Property SpousePodOpen Auto Conditional
{Has the Spouse Pod finished opening?}

Int Property SequenceNumber Auto Conditional
{Which Sequence are we on?
0 = CharGen Sequence
1 = FFGoodneighbor01MemorySequence
2 = MQ203 Sequence
}

Int Property AnimationTimingNumber Auto Conditional
{How far has the animation with Kellogg progressed?
}

Int Property ActorsInMultiFurniture Auto

;did the animation timers register?
Bool AnimationTimersFired

Function OpenSpousePod()
	SpousePod.GetRef().PlayAnimation("Stage2")
	SpousePodOpen = 1
	if SequenceNumber == 1
		FFGoodneighbor01MemorySequence.SetStage(25)
	endif
EndFunction

Function CloseSpousePod()
	SpousePod.GetRef().PlayAnimation("Stage1")
	SpousePodOpen = 0
EndFunction

Function MQ101Imod()
	If SequenceNumber == 0
		MQ101.SetStage(805)
	EndIf
EndFunction

function ShowKelloggName()
	KelloggNamed.ForceRefTo(Kellogg.GetRef())
EndFunction

Function StartAnimationTimers()
	debug.trace(Self + " StartAnimationTimers Function Started")

	Actor SpouseREF = Spouse.GetActorRef()

	debug.trace(SpouseREF + " is the SpouseREF")

	; animation events to handle each line of the scnene for the synced anim
	If RegisterForAnimationEvent(SpouseREF, "Talk01")
		AnimationTimersFired=True
	Else
		debug.trace(self + "Failed to register because the Spouse isn't loaded. Wait for OnLoad() block instead.")
	EndIf
	RegisterForAnimationEvent(SpouseREF, "Talk02")
	RegisterForAnimationEvent(SpouseREF, "Talk03")
	RegisterForAnimationEvent(SpouseREF, "Talk04")
	RegisterForAnimationEvent(SpouseREF, "Talk05")
	RegisterForAnimationEvent(SpouseREF, "Talk06")
	RegisterForAnimationEvent(SpouseREF, "Talk07")
	RegisterForAnimationEvent(SpouseREF, "Talk08")
	RegisterForAnimationEvent(SpouseREF, "Talk09")
	RegisterForAnimationEvent(SpouseREF, "Talk10")
	RegisterForAnimationEvent(SpouseREF, "Talk11")
	RegisterForAnimationEvent(SpouseREF, "Talk12")
	RegisterForAnimationEvent(SpouseREF, "Talk13")
	RegisterForAnimationEvent(SpouseREF, "Talk14")
EndFunction

Function StopAnimationTimers()
	debug.trace(Self + " StopAnimationTimers Function Started")
	;reset timinigs
	AnimationTimingNumber = 0
	AnimationTimersFired=False

	Actor SpouseREF = Spouse.GetActorRef()
	; animation events to handle each line of the scnene for the synced anim
	UnRegisterForAnimationEvent(SpouseREF, "Talk01")
	UnRegisterForAnimationEvent(SpouseREF, "Talk02")
	UnRegisterForAnimationEvent(SpouseREF, "Talk03")
	UnRegisterForAnimationEvent(SpouseREF, "Talk04")
	UnRegisterForAnimationEvent(SpouseREF, "Talk05")
	UnRegisterForAnimationEvent(SpouseREF, "Talk06")
	UnRegisterForAnimationEvent(SpouseREF, "Talk07")
	UnRegisterForAnimationEvent(SpouseREF, "Talk08")
	UnRegisterForAnimationEvent(SpouseREF, "Talk09")
	UnRegisterForAnimationEvent(SpouseREF, "Talk10")
	UnRegisterForAnimationEvent(SpouseREF, "Talk11")
	UnRegisterForAnimationEvent(SpouseREF, "Talk12")
	UnRegisterForAnimationEvent(SpouseREF, "Talk13")
	UnRegisterForAnimationEvent(SpouseREF, "Talk14")
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSender)
	debug.trace(Self + " OnLoad() block for Spouse. Register for Timers again in case the first call failed because the Spouse wasn't loaded yet.")
	If AnimationTimersFired == False
		StartAnimationTimers()
	EndIf
	UnRegisterForRemoteEvent(Spouse.GetActorRef(), "OnLoad")
EndEvent

; restart = true : don't move anybody but the spouse
; NEW: probably don't need restart anymore - try always moving everybody
Function StartKelloggSequence(int mySequenceNumber = 0, bool bRestart = false)
	debug.trace(self + " StartKelloggSequence " + mySequenceNumber + ", bRestart=" + bRestart)
	if IsRunning() == false
		debug.trace(self + " starting quest")
		Start()
		debug.trace(self + " done starting quest- isRunning=" + IsRunning())
	endif
	; set sequence number
	SequenceNumber = mySequenceNumber

	Actor PlayerREF = Game.GetPlayer()

	; always make sure we have the right spouse and player duplicate
	If (PlayerREF.GetBaseObject() as ActorBase).GetSex() == 1
		Spouse.ForceRefTo(SpouseMale.GetRef())
		PlayerDuplicate.ForceRefTo(SpouseFemale.GetRef())		
	Else
		;if the player is male, force the player duplicate to a dummy actor templated to Player, since we don't store that data out during facegen
		Spouse.ForceRefTo(SpouseFemale.GetRef())
		PlayerDuplicate.ForceRefTo(MQ101PlayerDuplicate.GetRef())
	EndIf

	Actor SpouseREF = Spouse.GetActorRef()
	Actor KelloggREF = Kellogg.GetActorRef()
	Actor FemaleAgentREF = InstScientistFemale.GetActorRef()
	Actor MaleAgentREF = InstScientistMale.GetActorRef()
	Actor PlayerDuplicateREF = PlayerDuplicate.GetActorRef()

	; make sure spouse dies in the furntiure correctly
	If SpouseREF.HasKeyword(UseFurnitureDeath) == False
		SpouseREF.AddKeyword(UseFurnitureDeath)
	EndIf

	; reset variables
	SpouseSitPod = 1

	; block activation/rollover text on cryopod levers
	debug.trace(self + " CryopodLevels count=" + CryopodLevers.GetCount())
	CryopodLevers.BlockActivation(true, true)

	; enable correct visual state
	if SequenceNumber == 2
		MQ203Vault111LayerMarker.Enable()
	else
		MQ203Vault111LayerMarker.Disable()
	endif
	
	; block activation on Kellogg during CharGen
	If SequenceNumber == 0
		KelloggREF.BlockActivation(True, True)
	Else
		KelloggREF.BlockActivation(False, False)
	EndIf

	; enable correct player pod
	ObjectReference PlayerPodREF = PlayerPod.GetRef()
	ObjectReference PlayerPod3rdPersonREF = PlayerPod3rdPerson.GetRef()
	if SequenceNumber == 0
		debug.trace(self + " enable 1st person player pod, disable 3rd person pod")
		PlayerPodREF.Enable()
		PlayerPod3rdPersonREF.Disable()
	else
		debug.trace(self + " disable 1st person player pod, enable 3rd person pod")
		PlayerPodREF.Disable()
		PlayerPod3rdPersonREF.Enable()
	endif

	; enable everybody
	if mySequenceNumber < 2
		KelloggREF.Enable()
		FemaleAgentREF.Enable()
		MaleAgentREF.Enable()
		SpouseREF.Enable()

		;don't enable the player dupe until after chargen
		If SequenceNumber > 0
			PlayerDuplicateREF.Enable()
		EndIf
	EndIf

	if SequenceNumber >= 0
		;Spouse.GetActorRef().Resurrect()
		; move everybody back into starting positions
		; only do this the first time
		if bRestart == false			
			SpouseREF.SetOutfit(Vault111SuitPlayerSpouse)
			; helper function - so MQ203 can call it when necessary
			ResetSpouse(SpouseRef)
		endif

		if bRestart == false			
			;don't bother with the player dupe until after chargen
			If SequenceNumber > 0
				PlayerDuplicateREF.SetOutfit(Vault111SuitNoLoot)
				PlayerDuplicateREF.AddKeyword(AnimFurnCryopodPanic)
				PlayerDuplicateREF.RemoveKeyword(AnimFurnInCryopodAwake)
				PlayerDuplicateREF.RemoveKeyword(AnimFurnMaleSpouse)
				PlayerDuplicateREF.RemoveKeyword(AnimFurnFemaleSpouse)
				PlayerDuplicateREF.RemoveKeyword(AnimFurnSpouse)
				PlayerDuplicateREF.ChangeAnimArchetype()
				PlayerDuplicateREF.ChangeAnimFaceArchetype()			
				PlayerDuplicateREF.MoveTo(PlayerPod3rdPerson.GetRef())
				PlayerDuplicateREF.SnapIntoInteraction(PlayerPod3rdPersonREF)
			EndIf
		EndIf

		; Always move everybody else back into position:
		; NOT for MQ203 version - that's handled in MQ203 script
		if SequenceNumber < 2
			KelloggREF.EvaluatePackage()
			FemaleAgentREF.EvaluatePackage()
			MaleAgentREF.EvaluatePackage()

			debug.trace(self + "  Kellogg moving to package location " + KelloggREF.Getcurrentpackage())
			KelloggREF.MoveToPackageLocation()
			debug.trace(self + "  Female Agent moving to package location " + FemaleAgentREF.Getcurrentpackage())
			FemaleAgentREF.MoveToPackageLocation()
			debug.trace(self + "  Male Agent moving to package location " + MaleAgentREF.Getcurrentpackage())
			MaleAgentREF.MoveToPackageLocation()
		EndIf

		if SequenceNumber == 2
			; open and unlock door
			MQ105Vault111Door.SetOpen(true)
			MQ105Vault111Door.Lock(false)
			MQ105Vault111Door.BlockActivation(true, True)

			; need to initialize all the actor alias scripts
			MQ203.ResetActors(MQ203.GetMemoryActors(MQ203.MemoryF_ID))
		ElseIf SequenceNumber == 1
			; close and lock  door
			MQ105Vault111Door.SetOpen(False)
			MQ105Vault111Door.Lock()
			MQ105Vault111Door.BlockActivation(true, True)			
		endif
	endif

	;if needed, check when the spouse has loaded 3D
	RegisterForRemoteEvent(SpouseREF, "OnLoad")

	;register for cryopod scene animation events
	StartAnimationTimers()

	KelloggScene.Start()
EndFunction

function ResetSpouse(Actor SpouseRef)
	debug.trace(self + "ResetSpouse: moving " + SpouseRef + " to " + SpousePod.GetRef())
	SpouseREF.MoveTo(SpousePod.GetRef())
	SpouseREF.SnapIntoInteraction(MultiActorFurniture.GetRef())
	SpouseREF.EquipItem(BabyBundled)
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.trace(asEventName + " is the string we just passed")

	If (asEventName == "Talk01")
		AnimationTimingNumber = 1
	EndIf
	If (asEventName == "Talk02")
		AnimationTimingNumber = 2
	EndIf
	If (asEventName == "Talk03")
		AnimationTimingNumber = 3
	EndIf
	If (asEventName == "Talk04")
		AnimationTimingNumber = 4
	EndIf
	If (asEventName == "Talk05")
		AnimationTimingNumber = 5
	EndIf
	If (asEventName == "Talk06")
		AnimationTimingNumber = 6
	EndIf
	If (asEventName == "Talk07")
		AnimationTimingNumber = 7
	EndIf
	If (asEventName == "Talk08")
		AnimationTimingNumber = 8
	EndIf
	If (asEventName == "Talk09")
		AnimationTimingNumber = 9
	EndIf
	If (asEventName == "Talk10")
		AnimationTimingNumber = 10
	EndIf
	If (asEventName == "Talk11")
		AnimationTimingNumber = 11
	EndIf
	If (asEventName == "Talk12")
		AnimationTimingNumber = 12
	EndIf
	If (asEventName == "Talk13")
		AnimationTimingNumber = 13
	EndIf
	If (asEventName == "Talk14")
		AnimationTimingNumber = 14
	EndIf
EndEvent

Function SpouseDies()
	debug.trace(self + " SpouseDies")
	; only do this for FFGoodneighbor01MemorySequence
	if SequenceNumber == 1
		FFGoodneighbor01MemorySequence.SetStage(30)
	elseif SequenceNumber == 2
		MQ203.SetStage(710)
	endif
EndFunction

Function EndKelloggSequence()
	debug.trace(self + " EndKelloggSequence: SequenceNumber=" + SequenceNumber)
	If SequenceNumber == 0
		;if we're on the CharGen sequence, advance CharGen and shutdown this quest
		MQ101.SetStage(810)
		Stop()
	elseif SequenceNumber == 1
		;this sequence ends in FFGoodneighbor01MemorySequence in Amari's voiceover scene
		FFGoodneighbor01MemorySequence.SetStage(70)
	elseif SequenceNumber == 2
		MQ203.EndMemory(MQ203.MemoryF_ID)
	EndIf 
	;reset the animation timings
	StopAnimationTimers()
EndFunction

function AmariVoiceoverBeginning()
	debug.trace(self + " AmariVoiceoverBeginning")
	; only do this for FFGoodneighbor01MemorySequence
	if SequenceNumber == 1
		;wait a second for everyone to get in place, then togggle ai off
		;Utility.Wait(1.0)
		;PauseSequence(true)
		FFGoodneighbor01MemorySequence.SetStage(20)
	endif
EndFunction

; used by MQ105 to pause, since MQ203 isn't running
function PauseSequence(bool bPause)
	debug.tracefunction()
	MQ203.EnableMemoryActorAI(AllActors, !bPause)
	KelloggScene.Pause(bPause)
EndFunction

function HearKelloggName()
	;function no longer needed
EndFunction

function RestartKelloggSequence()
	if SequenceNumber == 2
		MQ203.RestartMemory(MQ203.MemoryF_ID)
	EndIf 
EndFunction


RefCollectionAlias Property CryopodLevers Auto Const

sound Property WPNPistol10mmKelloggChargenFire Auto Const
