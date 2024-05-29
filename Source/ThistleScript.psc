ScriptName ThistleScript extends ObjectReference 
{On entering the trigger zone, the thistle releases stinging nettles}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                    States
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Auto State PrePoisonPlant
  Event OnTriggerEnter(objectReference akActionref )
    if akActionRef as actor && CheckPerks(akActionref)
      Debug.Trace(Self + " has received OnTriggerEnter from" + akActionRef)
      if DoOnce
        gotoState("WaitingToExplode")
        starttimer(3.0, 1)
        PlayAnimation( "stage2" )
      else
       ;wait(resetDelay)
       ;PlayAnimation( "reset" )
      endif
    endif
  endEvent
EndState                             

State WaitingToExplode
  Event OnTimer(int aiTimerID)
   ; PlayAnimation( "reset" )
    if aiTimerID == 1
      PlayAnimation( "stage3" )
      ;;;;;;;;Place Explode Anim will go here;;;;;;
      placeatme(ExplosionToPlace)
      if HazardToPlace
        MyHazard = placeatme(HazardToPlace)
        starttimer(10, 10)
      endif
      gotoState("PostPoisonPlant")
    elseif aiTimerID == 10
      if MyHazard 
        MyHazard.delete()
      endif
    endif
  EndEvent
endState


Event OnUnload()
 ;PlayAnimation( "reset" )
	if MyHazard 
		MyHazard.delete()
	endif
EndEvent 

;/
Event OnTimer(int aiTimerID)
 ; PlayAnimation( "reset" )
	if aiTimerID == 10 
		if MyHazard 
			MyHazard.delete()
		endif
	endif
EndEvent
/;

State PostPoisonPlant
  Event OnBeginState(string previousState)
    DamageObject(10)
    setDestroyed()
  endEvent
EndState

Event OnActivate(ObjectReference akActionRef)
    ;playAnimation(Anim)
    if akActionRef as actor
      ;;;;;;;;picked anim will go here;;;;;;
      CancelTimer(1)
      akActionRef.AddItem(Thistle, 1)
      gotoState("PostPoisonPlant")
    endif
EndEvent

Function ResetThistle()
  PlayAnimation( "reset" )
  setDestroyed(false)
  clearDestruction()
endFunction

bool Function CheckPerks(objectReference akActionRef)
  return True
endFunction


Event OnTimer(int aiTimerID)
 ; PlayAnimation( "reset" )
  if aiTimerID == 10
    if MyHazard 
      MyHazard.delete()
    endif
  endif
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                    Properties 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Bool Property DoOnce = True Auto 
Explosion Property ExplosionToPlace Auto 
Hazard Property hazardToPlace Auto 
ObjectReference Property MyHazard Auto hidden
potion property Thistle auto

;/
Group Required_Properties

  string property Anim = "state3" auto
  {Anim to play when this is activated.}

EndGroup
/;