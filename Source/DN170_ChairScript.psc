Scriptname DN170_ChairScript extends ObjectReference

ObjectReference Property Pencil1 Auto Const
ObjectReference Property Pencil2 Auto Const
ObjectReference Property DustFX Auto Const
ObjectReference Property EnableMarker Auto Const
ObjectReference Property MainLight auto Const
ObjectReference Property FillLight auto Const
Sound Property AMBElectricArcSmall auto Const

ObjectReference Property MirelurkAmbush auto Const

auto State Waiting
	Event OnActivate(Objectreference akActionRef)
		GoToState("Done")

		utility.wait(1.65)
		EnableMarker.Enable()
		utility.wait(1.95)
		FillLight.Disable()
		FlickerAmbush()


	endEvent


endState


State Done
	Event OnActivate(Objectreference akActionRef)
		;do nothing

	endEvent


endState

Function FlickerAmbush()

	int Flickers = 16
	bool Pencil1Pushed = false
	bool Pencil2Pushed = false
	while Flickers > 0
		if MainLight.IsDisabled()
			MainLight.Enable()

		else
			MainLight.Disable()

		endif
		AMBElectricArcSmall.play(self)

		if Flickers < 12 && Pencil1Pushed == false
			Pencil1.ApplyHavokImpulse(5.0, 0.0, 1.0, 30.0)

			Pencil1Pushed = true
		endif

		if Flickers < 7 && Pencil2Pushed == false
			Pencil2.ApplyHavokImpulse(-5.0, 0.0, 1.0, 10.0)
			DustFX.RampRumble(1.0, 0.25, 512)
			DustFX.PlayAnimation("Stage2")

			Pencil2Pushed = true
		endif

		utility.wait(utility.RandomFloat(0.05, 0.2))

		Flickers -= 1
	endWhile

	MirelurkAmbush.Activate(Game.GetPlayer())

	if MainLight.IsDisabled()
		MainLight.Enable()

	endif

	FillLight.Enable()


endFunction