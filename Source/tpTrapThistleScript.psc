Scriptname tpTrapThistleScript extends ObjectReference
{On entering the trigger zone, the thistle releases stinging nettles}

Explosion Property ExplosionToPlace Auto 

Hazard Property hazardToPlace Auto 
{the hazard to place on break up}

ObjectReference Property MyHazard Auto Hidden 

INT PROPERTY count =3 AUTO 
{the number of thistle grenades to give out}

WEAPON property Thistle auto
{the grenade}

;***************************************

Function ResetThistle()
  PlayAnimation( "reset" )
  setDestroyed(false)
  clearDestruction()
endFunction

;***************************************

Event OnUnload()
  if(MyHazard)
    MyHazard.delete()
  endif
EndEvent 

;***************************************

Event OnTimer(int aiTimerID)
  if(aiTimerID == 10 && MyHazard)
    MyHazard.delete()
    DamageObject(10)
  endif
EndEvent

;***************************************

Event OnReset()
  PlayAnimation( "reset" )
  setDestroyed(false)
  clearDestruction()
EndEvent
;***************************************

Event OnActivate(ObjectReference akActionRef)
  if(akActionRef as actor)

    ;picked anim will go here
    DamageObject(10)
    CancelTimer(1)
    akActionRef.AddItem(Thistle, count)
  endif
EndEvent

;***************************************

Auto State PrePoisonPlant
 Event OnTriggerEnter(objectReference akActionref)
    gotoState("PostPoisonPlant")
    ;placeatme(ExplosionToPlace)
    PlayAnimation("stage2")
    if(HazardToPlace)
      MyHazard = placeatme(HazardToPlace)
      starttimer(4.8, 10)
    endif
  endEvent
EndState                             

;***************************************

State PostPoisonPlant
  Event OnTriggerEnter(ObjectReference akActionref)
      ;Do nothing
  endEvent

  Event OnActivate(ObjectReference akActionRef)
      ;Do nothing
  EndEvent
EndState

;***************************************
