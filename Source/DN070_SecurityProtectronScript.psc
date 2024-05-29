Scriptname DN070_SecurityProtectronScript extends abProtectronRaceScript Hidden
{Script for the Protectrons in the Security area. Activates or deactivates their klaxons depending on their state.}

Keyword property LinkCustom01 Auto Const Mandatory
{LinkCustom01; links to the Protectron's Klaxon.}

Actor mySelf
GlowingKlaxonLightScript myKlaxon


Event OnEffectStart(Actor akTarget, Actor akCaster)
	mySelf = akTarget
	myKlaxon = akTarget.GetLinkedRef(LinkCustom01) as GlowingKlaxonLightScript
	Parent.OnEffectStart(akTarget, akCaster)
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if ((mySelf.GetValue(ProtectronPodStatus) == 1) && (mySelf.IsUnconscious()))
		;Override the default behavior for this particular case. Keep the Protectron in its pod and stop the klaxon.
		myKlaxon.StopLights()
	Else
		Parent.OnActivate(akActionRef)
	EndIf
EndEvent

Event OnConsciousnessStateChanged(bool abUnconscious)
	if (abUnconscious)
		myKlaxon.StopLights()
	Else
		myKlaxon.PlayLights()
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
	myKlaxon.StopLights()
EndEvent