;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_EMSystemLinkToSleepWithAm_001D8854 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
if akActor.Is3DLoaded()
	if akActor.GetLinkedRef(EMSystemLinkToSleep).GetBaseObject() is Furniture
		akActor.EvaluatePackage()
	endif
endif
debug.trace("EMSystemLinkToSleepWithAmbushPackage OnEnd Fired!")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property EMSystemLinkToSleep Auto Const
