Scriptname DrinkingBuddyprotectronSCRIPT extends Actor 
{Script to handle Protectron behavior, specifically pods}

group User_Vars
{Use these properties to customize your specific placement}
bool property startInPod = TRUE auto 
{Override to FALSE to have Protectron start on its patrol}
endgroup

group Advanced_Vars CollapsedOnRef
{Stuff you should only mess with if you're sure of what you're doing.}
ActorValue Property ProtectronPodStatus Auto conditional Const
ActorValue Property Aggression Auto Const
keyword property linkProtectronPod auto const
ReferenceAlias Property protectronAlias Auto Const
Scene Property ProtectronShutDownReceived Auto Const
Scene Property ProtectronShutDownCompleted Auto Const
Scene Property ProtectronPowerUpReceived Auto Const
Scene Property ProtectronVIPescortScene Auto Const
endGroup

bool doOnce = false

; NOTE =!= NOTE =!= NOTE =!= NOTE =!= NOTE
; Currently linking protectron to furniture (keyword) and furniture to pod. 
; This is probably temp, depending on how we choose to implement real assets
; For now I've set it up this way because of the temp stuff I'm working with.
; NOTE =!= NOTE =!= NOTE =!= NOTE =!= NOTE

Event OnLoad()
	;debug.trace("PROTECTRON: Loading up!")
    if getLinkedRef(linkProtectronPod) && !IsDead()
    	;debug.trace("Protectron has a linked pod: "+getLinkedref(linkProtectronPod))
	    if !startInPod 
	    	setValue(ProtectronPodStatus, 1)
	    	setUnconscious(FALSE)
	    	evaluatePackage()
	    else
	    	setUnconscious()
	    	setValue(ProtectronPodStatus, 0)
	    endif
	else
		;debug.trace("Has no pod linked Reference")
	endif
EndEvent

Function SetDrinkingBuddyAwake()
	if !DoOnce  ;make sure this stuff only applies to protectrons with a home pod.
    	debug.trace("Protectron: Received an Activation Signal from non-player input!")
    	evaluatePackage()
    	SetValue(Aggression, 1)
		; if I'm waking up, open the pod and let's go!
		if getValue(ProtectronPodStatus) == 1 && !IsDead()
			if isUnconscious()
				setUnconscious(false)
		    endif
		endif
		DoOnce = TRUE
		startInPod = false
	endif
EndFunction

Function BypassStartInPod()
	startInPod = false
EndFunction