Scriptname StringHitScript extends ObjectReference

float Property fDelay auto
	{How long to delay after being activated?}
bool Property LowHit auto
	{Low pitch string hit?}
bool Property MediumHit auto
	{Mid pitch string hit?}
bool Property HighHit auto
	{High pitch string hit?}

Group CustomSettings CollapsedOnRef
	bool Property CustomHit auto
	{Using a CustomSFX?}
	Sound Property CustomSFX auto Const
	{Point to CustomSFX.}
	bool property bRumble auto
	{Should we rumble?}
	float property fRumbleLength = 0.0 auto
	{How long to rumble?}
	float property fRumbleIntensity = 0.0 auto
	{How intense to rumble? 0.001 - 1.0 (Even 0.5 is a lot)}

endGroup

	Sound Property QSTStringHitsMS05A Auto Const hidden
	Sound Property QSTStringHitsMS05B Auto Const hidden
	Sound Property QSTStringHitsMS05C Auto Const hidden

Event OnActivate(ObjectReference akActionRef)

	utility.wait(fDelay)
	if LowHit
		QSTStringHitsMS05A.play(Game.GetPlayer())

	elseif MediumHit
		QSTStringHitsMS05B.play(Game.GetPlayer())

	elseif HighHit
		QSTStringHitsMS05C.play(Game.GetPlayer())

	elseif CustomHit
		CustomSFX.play(Game.GetPlayer())

	endif

	if bRumble
		Game.GetPlayer().RampRumble(fRumbleIntensity, fRumbleLength, 512)

	endif

endEvent

