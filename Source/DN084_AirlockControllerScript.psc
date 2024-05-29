Scriptname DN084_AirlockControllerScript extends ObjectReference Hidden
{Script that controls the airlock elements in DN084's reactor area. Handles cycling the doors, toggling radiation hazards, and playing related scenes and effects.}

Group Required_Properties
	Quest property DN084 auto const
	{DN084}

	Scene property DN084_AirlockScene auto const mandatory
	{The airlock computer announcement scene.}

	;Airlock doors.
	Default2StateActivator property DN084_AirlockDoor01 auto const mandatory
	{The outer door.}
	Default2StateActivator property DN084_AirlockDoor02 auto const mandatory
	{The inner airlock door.}

	;Safety collision for the doors.
	ObjectReference property DN084_AirlockDoor01Collision auto const mandatory
	{Collision volume for the outer door.}
	ObjectReference property DN084_AirlockDoor02Collision auto const mandatory
	{Collision volume for the inner door.}

	;Radiation hazards.
	ObjectReference property DN084_MassFusionReactorRadiationRef auto const mandatory
	{Main radiation marker for the reactor.}
	ObjectReference property DN084_MassFusionReactorRadiationReducedRef auto const mandatory
	{Secondary radiation marker for the reactor. Switched on when the player takes the Agitator.}
	ObjectReference property DN084_MassFusionAirlockRadiationRef auto const mandatory
	{Low-level radiation in the sealed airlock, used to alert the player to the danger.}

	;Decontamination Arches
	Default2StateActivator property DN084_DecontaminationArch auto const
	{The first decontamination arch a linkedref chain of arches.}

	;Decontamination effect.
	Spell property DN084_DecontaminationSpell auto const mandatory
	{The decontamination spell effect. Removes rads while the player is in the decontamination hallway.}
EndGroup

;Local Refs
bool isOpenToControlRoom = True	;Is the airlock currently open on the control room side?
Default2StateActivator[] arches 	;Array of decontamination arches.

;Populate the arches array.
Event OnCellLoad()
	ObjectReference[] objArches = DN084_DecontaminationArch.GetLinkedRefChain()
	objArches.Add(DN084_DecontaminationArch)
	arches = (objArches as Default2StateActivator[])
EndEvent

Event OnCellDetach()
	arches = None
EndEvent


;---------------
;Airlock Button
;---------------

Auto State Ready
	Event OnActivate(ObjectReference akActivator)
		;When the player cycles the airlock, start the computer scene, which calls the functions below.
		GoToState("Busy")
		DN084_AirlockScene.Start()
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState


;----------------
;Airlock Process
;----------------

;When requested by DN084_AirlockScene, close the doors.
Function CloseDoors()
	;Enable collision to make absolutely sure the player can't slip out before the doors close.
	DN084_AirlockDoor01Collision.EnableNoWait()
	DN084_AirlockDoor02Collision.EnableNoWait()
	if (isOpenToControlRoom)
		;Close the outer door.
		DN084_AirlockDoor01.SetOpen(False)
	Else
		;Close the inner door and flip the radiation hazards, since the door is now blocking most of the radiation.
		DN084_AirlockDoor02.SetOpen(False)
		DN084_MassFusionReactorRadiationRef.DisableNoWait()
		DN084_MassFusionReactorRadiationReducedRef.DisableNoWait()
		DN084_MassFusionAirlockRadiationRef.EnableNoWait()
	EndIf
EndFunction

;When requested by DN084_AirlockScene, turn on the decontamination arches and apply the decontamination spell to the player.
Function StartDecontamination()
	int i = 0
	While (i < arches.Length)
		arches[i].SetOpenNoWait(True)
		i = i + 1
	EndWhile
	Actor player = Game.GetPlayer()
	DN084_DecontaminationSpell.Cast(player, player)
EndFunction

;When requested by DN084_AirlockScene, turn off the decontamination arches and spell.
Function StopDecontamination()
	int i = 0
	While (i < arches.Length)
		arches[i].SetOpenNoWait(False)
		i = i + 1
	EndWhile
EndFunction

;When requested by DN084_AirlockScene, open the doors.
Function OpenDoors()
	if (isOpenToControlRoom)
		;Flip the radiation hazards as the door to the reactor chamber opens.
		DN084_MassFusionAirlockRadiationRef.DisableNoWait()
		if (DN084.GetStageDone(360))
			DN084_MassFusionReactorRadiationReducedRef.EnableNoWait()
		Else
			DN084_MassFusionReactorRadiationRef.EnableNoWait()
		EndIf
		;Disable safety collision on the doors.
		DN084_AirlockDoor01Collision.DisableNoWait()
		DN084_AirlockDoor02Collision.DisableNoWait()
		;Open the reactor chamber door.
		DN084_AirlockDoor02.SetOpen(True)
		isOpenToControlRoom = False
	Else
		;Disable safety collision on the doors.
		DN084_AirlockDoor01Collision.DisableNoWait()
		DN084_AirlockDoor02Collision.DisableNoWait()
		;Open the control room door.
		DN084_AirlockDoor01.SetOpen(True)
		isOpenToControlRoom = True
	EndIf
	GoToState("Ready")
EndFunction
