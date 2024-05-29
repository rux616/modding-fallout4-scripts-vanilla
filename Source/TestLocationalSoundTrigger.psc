Scriptname TestLocationalSoundTrigger extends ObjectReference
{This trigger enables/disables specific sound(s) when the player is in the trigger and ramps those sounds appropriately
	This trigger should be set up to ONLY monitor for the player}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Event Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Event OnTimer(int aiTimerID)
	;Player is the ONLY trigger object
    if GetTriggerObjectCount() > 0
    	if instanceIDCurrentVolume001 < 1.0
    		instanceIDCurrentVolume001 += (1/(soundRampTime/timerInterval))
    		Sound.SetInstanceVolume(instanceID001, instanceIDCurrentVolume001)
    		StartTimer(timerInterval, 0)
    	endif
    else
    	if instanceIDCurrentVolume001 > 0.0
    		instanceIDCurrentVolume001 -= (1/(soundRampTime/timerInterval))
    		Sound.SetInstanceVolume(instanceID001, instanceIDCurrentVolume001)
    		StartTimer(timerInterval, 0)
    	endif
    endif
EndEvent


;int instanceID = mySFX.play(self)
;Sound.SetInstanceVolume(instanceID, 0.5)
;Sound.StopInstance(instanceID) 
;Game.GetPlayer().GetDistance(Chest)

Event OnTriggerEnter(ObjectReference akActionRef)
	if !PlayerInTrigger
		StartTimer(timerInterval, 0)
	endif
	PlayerInTrigger = True
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	PlayerInTrigger = False
	StartTimer(timerInterval, 0)
EndEvent


Event OnCellLoad()
	SoundsEmmitter001 = self.getLinkedRef(LinkCustom01)
	SoundsEmmitter002 = self.getLinkedRef(LinkCustom02)
	SoundsEmmitter003 = self.getLinkedRef(LinkCustom03)
	SoundsEmmitter004 = self.getLinkedRef(LinkCustom04)
	if SoundsEmmitter001 && Sound001
		instanceIDCurrentVolume001 = 0.0
		instanceID001 = Sound001.play(SoundsEmmitter001)
		Sound.SetInstanceVolume(instanceID001, 0.0)
	else
		debug.Trace(Self + ": Could not play sound")
		debug.Trace(Self + ": SoundsEmmitter001 = " + SoundsEmmitter001)
		debug.Trace(Self + ": Sound001 = " + Sound001)
	endif
EndEvent

Event OnCellDetach()
	PlayerInTrigger = False
	Sound.StopInstance(instanceID001)
	Sound.StopInstance(instanceID002)
	Sound.StopInstance(instanceID003)
	Sound.StopInstance(instanceID004)
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Functions Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function RampSoundToAppropriateLevel(objectReference soundEmmitter, int CurrentSound, float CurrentSoundVolume)
	;int DesiredSoundVolume
	;float playerDistance = Game.GetPlayer().GetDistance(soundEmmitter)

EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Vars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bool PlayerInTrigger = false

int instanceID001 = 0
int instanceID002 = 0
int instanceID003 = 0
int instanceID004 = 0
float instanceIDCurrentVolume001 = 0.0
float instanceIDCurrentVolume002 = 0.0
float instanceIDCurrentVolume003 = 0.0
float instanceIDCurrentVolume004 = 0.0

objectReference SoundsEmmitter001
objectReference SoundsEmmitter002
objectReference SoundsEmmitter003
objectReference SoundsEmmitter004

float property soundRampTime = 2.0 auto
	{Time in seconds for the sounds to ramp on/off}

;				vvv Change these to Arrays later? vvvv
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Sound property Sound001 auto
{Sound played from LinkCustom01
	don't add a sound if you don't want anything played from this
	sound will not play if there is no linked ref}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
float property SoundInaudibleDistance001 = 2048.0 auto
{The distance at which this sound will be completely inaudible
	Default = 2048}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
float property SoundMaxVolumeDistance001 = 1024.0 auto
{The distance at which this sound will be completely Audible
	Default = 2048}

Keyword property LinkCustom01 auto
Keyword property LinkCustom02 auto
Keyword property LinkCustom03 auto
Keyword property LinkCustom04 auto

float property timerInterval = 0.1 auto