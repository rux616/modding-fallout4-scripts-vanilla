Scriptname DN019JoinCultScript extends Quest Conditional

DN019Script Property DN019 auto const

ReferenceAlias Property OfficeSceneTrigger auto const
ReferenceAlias Property CultLeader auto const

function StartOfficeScene(bool bStart)
	DN019.AttackOnWalkaway = bStart
	ObjectReference triggerRef = OfficeSceneTrigger.GetRef()
	; first time, set stages
	if bStart
		setStage(300)
		; enable no fast travel trigger
		debug.trace(self + " move and enable fast travel trigger")
		triggerRef.MoveTo(CultLeader.GetRef())
		triggerRef.Enable()
	else
		setStage(400)
		debug.trace(self + " disable fast travel trigger")
		; disable trigger
		triggerRef.Disable()
	endif
endFunction

function SetAskAboutEmogeneFlag(bool bAskedFlag)
	DN019.PlayerAskedAboutEmogene = bAskedFlag
endFunction