Scriptname DLC03:DLC03MQ06_KlaxonAnimOnLoad extends ObjectReference Const

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory
{Quest used to know when to trigger lights}

int Property iPrereqStage = 100 Auto Const 
{This stage must be done before activating}

Event OnLoad()
	if DLC03MQ06_NukeHandling.GetStageDone(iPrereqStage)
		ObjectReference KlaxonLight = Self.GetLinkedRef()
		ObjectReference KlaxonSound = KlaxonLight.GetLinkedRef()
			
		;animate light
		Self.PlayAnimation("Stage2")
		;animate Klaxon
		if KlaxonLight.IsDisabled()
			KlaxonLight.Enable()
		endif

		KlaxonLight.PlayAnimation("Stage2")
		;enable sound, have to check to see if they have sounds because some of them don't
		if(KlaxonSound) && KlaxonSound.IsDisabled()
			KlaxonSound.enable()
		endif
	endif
EndEvent