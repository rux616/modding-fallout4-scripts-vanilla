Scriptname TutorialOnEffectScript extends ActiveMagicEffect

Quest Property Tutorial Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)

	if !Tutorial.GetStageDone(3010) && akTarget == Game.GetPlayer()
		Tutorial.SetStage(3000)
	endif

EndEvent