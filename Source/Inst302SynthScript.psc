Scriptname Inst302SynthScript extends ReferenceAlias Conditional

Quest Property Inst302 Auto Const


Event OnDeath(Actor Killer)


Inst302QuestScript QuestScript = Inst302 as Inst302QuestScript

	if Killer == Game.GetPlayer()
	
	;update variable 	
		(Inst302 as Inst302QuestScript).SynthsKilled += 1

	;update synth state

	if Self.GetReference() == Inst302B2Ref
		QuestScript.B2State=1
	elseif Self.GetReference() == Inst302F6Ref
		QuestScript.F6State=1
	elseif Self.GetReference() == Inst302Y9Ref
		QuestScript.Y9State =1
	elseif Self.GetReference() == Inst302Z3Ref
		QuestScript.Z3State=1
	endif


	;if Courser hasn't been killed
	;run appropriate scene based on how many are killed
	;1 is warning, 2 results in combat

		if Inst302.GetStageDone(95) == 0

			if (Inst302 as Inst302QuestScript).SynthsKilled == 1
				Inst302Stage60CourserKilledSynth01.Start()
			elseif (Inst302 as Inst302QuestScript).SynthsKilled == 2
				Inst302Stage60CourserKilledSynth02.Start()	
			endif
		endif
	;update quest function in case last one was killed
		(Inst302 as Inst302QuestScript).UpdateSynthStatus()


	endif

EndEvent
Scene Property Inst302Stage60CourserKilledSynth01 Auto Const

Scene Property Inst302Stage60CourserKilledSynth02 Auto Const

ObjectReference Property Inst302B2Ref Auto Const

ObjectReference Property Inst302F6Ref Auto Const

ObjectReference Property Inst302Y9Ref Auto Const

ObjectReference Property Inst302Z3Ref Auto Const
