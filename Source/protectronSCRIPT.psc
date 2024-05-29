Scriptname protectronSCRIPT extends Actor conditional
{Script has become a property value holder for the protectron script on the Protectron race.}

group User_Vars
{Use these properties to customize your specific placement}
bool property startInPod = TRUE auto const
{Override to FALSE to have Protectron start on its patrol}
bool property busy = false auto conditional
endgroup



;group Advanced_Vars CollapsedOnRef
;{Stuff you should only mess with if you're sure of what you're doing.}
;ActorValue Property ProtectronPodStatus Auto conditional Const
;keyword property linkProtectronPod auto const
;ReferenceAlias Property protectronAlias Auto Const
;Scene Property ProtectronShutDownReceived Auto Const
;Scene Property ProtectronShutDownCompleted Auto Const
;Scene Property ProtectronPowerUpReceived Auto Const
;Scene Property ProtectronVIPescortScene Auto Const
;endGroup

; NOTE =!= NOTE =!= NOTE =!= NOTE =!= NOTE
; Currently linking protectron to furniture (keyword) and furniture to pod. 
; This is probably temp, depending on how we choose to implement real assets
; For now I've set it up this way because of the temp stuff I'm working with.
; NOTE =!= NOTE =!= NOTE =!= NOTE =!= NOTE

;Event OnLoad()
;	;debug.trace("PROTECTRON: Loading up!")
;    if getLinkedRef(linkProtectronPod)
;    	;debug.trace("Protectron has a linked pod: "+getLinkedref(linkProtectronPod))
;	    if !startInPod 
;	    	setValue(ProtectronPodStatus, 1)
;	    	setUnconscious(FALSE)
;	    	evaluatePackage()
;	    	if getDistance(getLinkedRef(linkProtectronPod)) > 64
;	    		moveto(getLinkedref(linkProtectronPod))
;	    	endif
;	    else
;	    	setUnconscious()
;	    	setValue(ProtectronPodStatus, 0)
;	    endif
;	else
;		;debug.trace("Has no pod linked Reference")
;	endif
;EndEvent

;Event OnActivate(ObjectReference akActionRef)
;	if getLinkedRef(linkProtectronPod)  ;make sure this stuff only applies to protectrons with a home pod.
;	    if akActionRef != game.getPlayer()
;	    	debug.trace("Protectron: Received an Activation Signal from non-player input!")
;	    	evaluatePackage()
;		    ; I've been poked by my terminal, or some other input.
;		    if getValue(ProtectronPodStatus) == 0
;		    	; if I'm going to sleep, start looking for my pod.
;		    	RegisterForDistanceLessThanEvent(self, getLinkedRef(linkProtectronPod), 16)
;		    	; use scene to play a confirmation line.  Make myself the alias first!
;		    	;;;;;;;;;;;;;;;;;;;;shutDownAllScenes()
;		    	if protectronAlias.getReference() != self
;		    		protectronAlias.forceRefTo(self)
;		    	endif
;		    	if !isUnconscious()
;		    		ProtectronShutDownReceived.start()
;		    	endif
;			; if I'm waking up, open the pod and let's go!
;			elseif getValue(ProtectronPodStatus) == 1
;				if isUnconscious()
;					setUnconscious(false)
;					if protectronAlias.getReference() != self
;			    		protectronAlias.forceRefTo(self)
;			    	endif
;			    	ProtectronPowerUpReceived.start()
;			    endif
;			endif
;		endif
;	endif
;EndEvent

;Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
;	;debug.trace("Protectron: I've arrived in my pod!")
;	if protectronAlias.getReference() != self
;	    protectronAlias.forceRefTo(self)
;	endif
;	;debug.trace("Protectron: Play ProtectronShutDownCompleted Scene")
;	ProtectronShutDownCompleted.start()
;	;Don't set unconscious here - the scene does this.   
;	;setUnconscious()
;endEvent

;bool function shutDownAllScenes()
;	;debug.trace("Protectron: Shutting down any pre-existing scenes")
;	if ProtectronShutDownReceived.isPlaying()
;		;debug.trace("Protectron: stop ProtectronShutDownReceived scene!")
;		ProtectronShutDownReceived.stop()
;	endif
;	if ProtectronPowerUpReceived.isPlaying()
;		;debug.trace("Protectron: stop ProtectronPowerUpReceived scene!")
;		ProtectronPowerUpReceived.stop()
;	endif
;	if ProtectronShutDownCompleted.isPlaying()
;		;debug.trace("Protectron: stop ProtectronShutDownCompleted scene!")
;		ProtectronShutDownCompleted.stop()
;	endif
;endfunction