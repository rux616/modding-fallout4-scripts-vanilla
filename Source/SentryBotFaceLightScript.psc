Scriptname SentryBotFaceLightScript extends ActiveMagicEffect
{Turns off the face light when unconscipus}

VisualEffect Property pSentryBotFaceLightVE Auto Const Mandatory

ActorValue Property pPerceptionCondition Auto Const Mandatory

bool faceLightOn

auto state lightWorking
Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akCaster.GetSleepState() == 3
		;do nothing they are aslep
	else
   		pSentryBotFaceLightVE.Play(akCaster)
    	faceLightOn = true
    endIf
EndEvent

Event OnConsciousnessStateChanged( bool abUnconscious )
	Debug.Trace( "OnConsciousnessStateChanged Received: " + abUnconscious )
	if abUnconscious == 1 && faceLightOn == true
		utility.wait(0.3)
		pSentryBotFaceLightVE.Stop(self.GetTargetActor())
		faceLightOn = false
	elseIf abUnconscious == 0 && faceLightOn == false
		utility.wait(0.3)
		pSentryBotFaceLightVE.Play(self.GetTargetActor())
		faceLightOn = true
	endIf
EndEvent

Event OnSit(ObjectReference akFurniture)
	if faceLightOn == true
    	utility.wait(0.3)
		pSentryBotFaceLightVE.Stop(self.GetTargetActor())
	endIf
EndEvent


Event OnGetUp(ObjectReference akFurniture)
	if faceLightOn == false
    	utility.wait(0.3)
		pSentryBotFaceLightVE.Play(self.GetTargetActor())
	endIf
EndEvent

Event OnCripple(ActorValue akActorValue, bool abCrippled)
    if akActorValue == pPerceptionCondition
    	goToState("doNothing")
    	pSentryBotFaceLightVE.Stop(self.GetTargetActor())
    endIf
EndEvent

Event OnDying(Actor akKiller)
    pSentryBotFaceLightVE.Stop(self.GetTargetActor())
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
     pSentryBotFaceLightVE.Stop(akCaster)
EndEvent

endState


state doNothing


endState
