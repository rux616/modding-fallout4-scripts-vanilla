Scriptname ViciousAlphaDogDeathScript extends Actor Conditional

auto STATE waiting
	EVENT onDeath(actor killer)

		ObjectReference[] ViciousDogPack = self.FindAllReferencesWithKeyword(pActorTypeViciousDogPack, 400.0)

		Debug.Trace(self + ": Vicious Dog Alpha has died. " + ViciousDogPack.Length + " are in his pack.")

		int i = 0
		while i < ViciousDogPack.Length
			Debug.Trace(self + ": Vicious Dog " + ViciousDogPack[i] + " has been demoralized.")
			(ViciousDogPack[i] as Actor).SetCombatStyle(pcsViciousDogDemoralized)	; New demoralized combat style
			(ViciousDogPack[i] as Actor).SetValue( Game.GetConfidenceAV(), 0 )		; Make them flee
			(ViciousDogPack[i] as Actor).EvaluatePackage()
			i += 1
		endWhile

		; Wait a little while so the fear wears off
		Utility.Wait(8.0)
		Debug.Trace(self + ": Done waiting.")
		i = 0
		while i < ViciousDogPack.Length
			(ViciousDogPack[i] as Actor).SetValue( Game.GetConfidenceAV(), 4 )		; Make them come back
			i += 1
		endWhile

		;pViciousDogAlphaDebuff.Cast(self)
	endEVENT
endSTATE

Keyword Property pActorTypeViciousDogPack Auto Const
CombatStyle Property pcsViciousDogDemoralized Auto Const
