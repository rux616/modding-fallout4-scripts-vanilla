Scriptname AssaultronShockHandScript extends ActiveMagicEffect
{Adds an effect to the hand that is quite shocking! Must be added to each hand seperately}

VisualEffect Property PRobotShockHandVE Auto Const
{attached art showing shock from hand}
Explosion Property PElectricalExplosionSmall Auto Const
{small explosion to play on power attacks}
String Property myPlaceAtNode Auto Const
{node to place the shock explosion at}
ActorValue property myLimbAV Auto Const
{AV associated with the hand}
Sound Property NPCRobotHandShockLPM Auto Const
{Shock hand loop sound}


int sound01
;Holds  sound loacally so we can stop it

Event OnEffectStart(Actor akTarget, Actor akCaster)

	;reg for events to trigger explosion
    RegisterForAnimationEvent(akCaster, "HitFrame")
    RegisterForAnimationEvent(akCaster, "HandFXOn03")
    RegisterForAnimationEvent(akCaster, "HAndFXOn04")
    ;start hand fx art
    PRobotShockHandVE.Play(akCaster)
    Sound01 = NPCRobotHandShockLPM.Play(akCaster)
    goTostate("waiting")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    UnregisterForAnimationEvent(akCaster, "HitFrame")
    UnregisterForAnimationEvent(akCaster, "HandFXOn03")
    UnregisterForAnimationEvent(akCaster, "HAndFXOn04")
    ;DLC01 fix for lingering hand fx in BAB
    PRobotShockHandVE.Stop(akCaster)
    Sound.StopInstance(sound01)
    ;;end dcl01 fix
EndEvent

Event OnConsciousnessStateChanged( bool abUnconscious )
	actor selfRef = self.GetTargetActor()
	Debug.Trace( "OnConsciousnessStateChanged Received: " + abUnconscious )
	if abUnconscious == 1
		utility.wait(0.3)
		PRobotShockHandVE.Stop(selfRef)
	elseIf abUnconscious == 0
		utility.wait(0.3)
		PRobotShockHandVE.Play(selfRef)
	endIf
EndEvent

;On limb cripple or death stop the hand fx
Event OnCripple(ActorValue akActorValue, bool abCrippled)
	actor selfRef = self.GetTargetActor()
    if akActorValue == myLimbAV
    	PRobotShockHandVE.Stop(selfRef)
    	Sound.StopInstance(sound01)  
    endIf
EndEvent

Event OnDying(Actor akKiller)
	actor selfRef = self.GetTargetActor()
    PRobotShockHandVE.Stop(selfRef)
    Sound.StopInstance(sound01)  
EndEvent

; On a power attack play an explosion on the first hit frame. Need to jump between states for this to only happen once since there are multiple hitframes
state waiting
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)	
		actor selfRef = self.GetTargetActor()
	   if asEventName == "HandFXOn03" || asEventName == "HAndFXOn04"
			goTostate("hitState")
			Debug.Trace("got power attack")
		endif
	EndEvent
endState

state hitState
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		actor selfRef = self.GetTargetActor()
	   if asEventName == "HitFrame"
		selfRef.PlaceAtNode(myPlaceAtNode, PElectricalExplosionSmall)
		goTostate("waiting")
		Debug.Trace("got hitframe")
		endif
	EndEvent
endState