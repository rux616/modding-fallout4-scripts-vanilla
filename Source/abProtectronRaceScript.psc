Scriptname abProtectronRaceScript extends ActiveMagicEffect conditional
{Script to handle Protectron Behaviors, specifically pods.}

group User_Vars
{Use these properties to customize your specific placement}
bool property startInPod = TRUE auto
{Override to FALSE to have Protectron start on its patrol}
endgroup

group Advanced_Vars CollapsedOnRef
{Stuff you should only mess with if you're sure of what you're doing.}
ActorValue Property ProtectronPodStatus Auto conditional Const
keyword property linkProtectronPod auto const
ReferenceAlias Property protectronAlias Auto Const
Scene Property ProtectronShutDownReceived Auto Const
Scene Property ProtectronShutDownCompleted Auto Const
Scene Property ProtectronPowerUpReceived Auto Const
Scene Property ProtectronVIPescortScene Auto Const
endGroup



protectronScript protectronRefScript

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace("abProtectron: Loading up!   ("+akTarget+")")

	actor myself = self.GetTargetActor()
	ObjectReference myPod = myself.getLinkedref(linkProtectronPod)
	protectronRefScript = myself as protectronScript
	startInPod = protectronRefScript.startInPod
	
    if myPod
    	debug.trace("abProtectron has a linked pod: "+myPod)
	    if !startInPod && !myself.IsDead()
	    	myself.setValue(ProtectronPodStatus, 1)
	    	myself.setUnconscious(FALSE)
	    	myself.evaluatePackage()
	    	if myself.getDistance(myPod) > 64
	    		myself.moveto(myPod)
	    	endif
	    elseif !myself.IsDead()
	    	mySelf.setUnconscious()
	    	mySelf.setValue(ProtectronPodStatus, 0)
	    	myPod.WaitFor3DLoad()
	    	mypod.playAnimation("Occupied")
	    endif
	else
		;debug.trace("Has no pod linked Reference")
	endif
EndEvent



Event OnActivate(ObjectReference akActionRef)
	if akActionRef is actor
	    ;do nothing
	else
		actor myself = self.GetTargetActor()
		ObjectReference myPod = myself.getLinkedref(linkProtectronPod)

		if myPod  ;make sure this stuff only applies to protectrons with a home pod.
			debug.trace("abProtectron: Received an Activation Signal from non-player input!")
	    	myself.evaluatePackage()
		    ; I've been poked by my terminal, or some other input.
		    if myself.getValue(ProtectronPodStatus) == 0
		    	; if I'm going to sleep, start looking for my pod.
		    	RegisterForDistanceLessThanEvent(myself, mypod, 16)
		    	; use scene to play a confirmation line.  Make myself the alias first!
		    	;;;;;;;;;;;;;;;;;;;;shutDownAllScenes()
		    	if protectronAlias.getReference() != myself
		    		protectronAlias.forceRefTo(myself)
		    	endif
		    	if !myself.isUnconscious()
		    		ProtectronShutDownReceived.start()
		    	endif
			; if I'm waking up, open the pod and let's go!
			elseif myself.getValue(ProtectronPodStatus) == 1
				if myself.isUnconscious() && !myself.IsDead()
					myself.setUnconscious(false)
					if protectronAlias.getReference() != myself
			    		protectronAlias.forceRefTo(myself)
			    	endif
			    	ProtectronPowerUpReceived.start()
					StartTimer(4, 0)

			    endif
			endif
		endif
	endif
	
EndEvent

Event OnTimer(int aiTimerID)
	protectronRefScript.busy = false

endEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	actor myself = self.GetTargetActor()

	;debug.trace("abProtectron: I've arrived in my pod!")
	StartTimer(4, 0)
	if protectronAlias.getReference() != myself
	    protectronAlias.forceRefTo(myself)
	endif
	;debug.trace("abProtectron: Play ProtectronShutDownCompleted Scene")
	ProtectronShutDownCompleted.start()
	;Don't set unconscious here - the scene does this.   
	;setUnconscious()
endEvent

bool function shutDownAllScenes()
	;debug.trace("abProtectron: Shutting down any pre-existing scenes")
	if ProtectronShutDownReceived.isPlaying()
		;debug.trace("abProtectron: stop ProtectronShutDownReceived scene!")
		ProtectronShutDownReceived.stop()
	endif
	if ProtectronPowerUpReceived.isPlaying()
		;debug.trace("abProtectron: stop ProtectronPowerUpReceived scene!")
		ProtectronPowerUpReceived.stop()
	endif
	if ProtectronShutDownCompleted.isPlaying()
		;debug.trace("abProtectron: stop ProtectronShutDownCompleted scene!")
		ProtectronShutDownCompleted.stop()
	endif
endfunction