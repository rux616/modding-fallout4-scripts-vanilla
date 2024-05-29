Scriptname DN015PuzzleScript extends Quest Conditional



ObjectReference Property DN015_PuzzleTerminalRef Auto Const
DN015SampleActivator Property DN015SampleActivatorRefR Auto Const
DN015SampleActivator Property DN015SampleActivatorRefL Auto Const

Group RefAliasesFakes
	ReferenceAlias Property FakeName01a Auto Const
	ReferenceAlias Property FakeName01m Auto Const
	ReferenceAlias Property FakeName02a Auto Const
	ReferenceAlias Property FakeName02m Auto Const
	ReferenceAlias Property FakeName03a Auto Const
	ReferenceAlias Property FakeName03m Auto Const
	ReferenceAlias Property FakeName04a Auto Const
	ReferenceAlias Property FakeName04m Auto Const
	ReferenceAlias Property FakeName05a Auto Const
	ReferenceAlias Property FakeName05m Auto Const
	ReferenceAlias Property FakeName06a Auto Const
	ReferenceAlias Property FakeName06m Auto Const
EndGroup

Group RefAliases 
	;01
	ReferenceAlias Property FalseSample1Activator Auto Const
	ReferenceAlias Property FalseSample1Object Auto Const
	;02
	ReferenceAlias Property LiHActivator Auto Const
	ReferenceAlias Property LiHSample Auto Const
	;03
	ReferenceAlias Property FalseSample3Activator Auto Const
	ReferenceAlias Property FalseSample3Object Auto Const
	;04
	ReferenceAlias Property GoldActivator Auto Const
	ReferenceAlias Property GoldSample Auto Const
	;05
	ReferenceAlias Property FalseSample5Activator Auto Const
	ReferenceAlias Property FalseSample5Object Auto Const
	;05
	ReferenceAlias Property FalseSample6Activator Auto Const
	ReferenceAlias Property FalseSample6Object Auto Const
EndGroup

Group Messages
	Message Property DN015_FakeSampleName01 Auto Const
	Message Property DN015_FakeSampleName02 Auto Const
	Message Property DN015_FakeSampleName03 Auto Const
	Message Property DN015_FakeSampleName04 Auto Const
	Message Property DN015_FakeSampleName05 Auto Const
	Message Property DN015_FakeSampleName06 Auto Const
EndGroup

Group CompoundsScanned CollapsedOnRef
	bool Property ScannedCompound1 Auto hidden Conditional
	bool Property ScannedCompound2 Auto hidden Conditional
	bool Property ScannedCompound3 Auto hidden Conditional
	bool Property ScannedCompound4 Auto hidden Conditional
	bool Property ScannedCompound5 Auto hidden Conditional
	bool Property ScannedCompound6 Auto hidden Conditional
EndGroup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function Init()
	RegisterForRemoteEvent(DN015_PuzzleTerminalRef, "onActivate")
	SetUpFakeNames()
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetUpFakeNames()
	;FakeName01a.ForceRefTo(LiHActivator.GetReference())
	;FakeName01m.ForceRefTo(LiHSample.GetReference())
	;FakeName02a.ForceRefTo(GoldActivator.GetReference())
	;FakeName02m.ForceRefTo(GoldSample.GetReference())
EndFunction
;/
Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	if akSender == DN015_PuzzleTerminalRef
		ClearFakeNames(DN015SampleActivatorRefR.CurrentSample, false)
		ClearFakeNames(DN015SampleActivatorRefL.CurrentSample, true)
	Endif
EndEvent
/;
Function RunScan()
	ClearFakeNames(DN015SampleActivatorRefR.CurrentSample, false)
	ClearFakeNames(DN015SampleActivatorRefL.CurrentSample, true)
EndFunction

Function ClearFakeNames(ObjectReference CurrentSample, bool isLeftSample)
	Form NameReplace
	if CurrentSample == FalseSample1Activator.GetReference() && !ScannedCompound1
		FakeName01a.ForceRefTo(FalseSample1Activator.GetReference())
		FakeName01m.ForceRefTo(FalseSample1Object.GetReference())
		NameReplace = (DN015_FakeSampleName01 as form)
		ScannedCompound1 = True
	elseif CurrentSample == LiHActivator.GetReference() && !ScannedCompound2
		FakeName02a.ForceRefTo(LiHActivator.GetReference())
		FakeName02m.ForceRefTo(LiHSample.GetReference())
		NameReplace = (DN015_FakeSampleName02 as form)
		ScannedCompound2 = True
	elseif CurrentSample == FalseSample3Activator.GetReference() && !ScannedCompound3
		FakeName03a.ForceRefTo(FalseSample3Activator.GetReference())
		FakeName03m.ForceRefTo(FalseSample3Object.GetReference())
		NameReplace = (DN015_FakeSampleName03 as form)
		ScannedCompound3 = True
	elseif CurrentSample == GoldActivator.GetReference() && !ScannedCompound4
		FakeName04a.ForceRefTo(GoldActivator.GetReference())
		FakeName04m.ForceRefTo(GoldSample.GetReference())
		NameReplace = (DN015_FakeSampleName04 as form)
		ScannedCompound4 = True
	elseif CurrentSample == FalseSample5Activator.GetReference() && !ScannedCompound5
		FakeName05a.ForceRefTo(FalseSample5Activator.GetReference())
		FakeName05m.ForceRefTo(FalseSample5Object.GetReference())
		NameReplace = (DN015_FakeSampleName05 as form)
		ScannedCompound5 = True
	elseif CurrentSample == FalseSample6Activator.GetReference() && !ScannedCompound6
		FakeName06a.ForceRefTo(FalseSample6Activator.GetReference())
		FakeName06m.ForceRefTo(FalseSample6Object.GetReference())
		NameReplace = (DN015_FakeSampleName06 as form)
		ScannedCompound6 = True
	Endif
	if isLeftSample
        DN015_PuzzleTerminalRef.AddTextReplacementData("DN015LeftCompound", NameReplace)
    else
        DN015_PuzzleTerminalRef.AddTextReplacementData("DN015RightCompound", NameReplace)
    endif
EndFunction
ObjectReference Property DN015_MusicReward Auto Const

Function CheckScanned(ObjectReference CurrentSample, bool isLeftSample)
	Form NameReplace
	bool previouslyScanned = false
	if CurrentSample == FalseSample1Activator.GetReference() && ScannedCompound1
		FakeName01a.ForceRefTo(FalseSample1Activator.GetReference())
		FakeName01m.ForceRefTo(FalseSample1Object.GetReference())
		NameReplace = (DN015_FakeSampleName01 as form)
		previouslyScanned = true
	elseif CurrentSample == LiHActivator.GetReference() && ScannedCompound2
		FakeName02a.ForceRefTo(LiHActivator.GetReference())
		FakeName02m.ForceRefTo(LiHSample.GetReference())
		NameReplace = (DN015_FakeSampleName02 as form)
		previouslyScanned = true
	elseif CurrentSample == FalseSample3Activator.GetReference() && ScannedCompound3
		FakeName03a.ForceRefTo(FalseSample3Activator.GetReference())
		FakeName03m.ForceRefTo(FalseSample3Object.GetReference())
		NameReplace = (DN015_FakeSampleName03 as form)
		previouslyScanned = true
	elseif CurrentSample == GoldActivator.GetReference() && ScannedCompound4
		FakeName04a.ForceRefTo(GoldActivator.GetReference())
		FakeName04m.ForceRefTo(GoldSample.GetReference())
		NameReplace = (DN015_FakeSampleName04 as form)
		previouslyScanned = true
	elseif CurrentSample == FalseSample5Activator.GetReference() && ScannedCompound5
		FakeName05a.ForceRefTo(FalseSample5Activator.GetReference())
		FakeName05m.ForceRefTo(FalseSample5Object.GetReference())
		NameReplace = (DN015_FakeSampleName05 as form)
		previouslyScanned = true
	elseif CurrentSample == FalseSample6Activator.GetReference() && ScannedCompound6
		FakeName06a.ForceRefTo(FalseSample6Activator.GetReference())
		FakeName06m.ForceRefTo(FalseSample6Object.GetReference())
		NameReplace = (DN015_FakeSampleName06 as form)
		previouslyScanned = true
	Endif

	if previouslyScanned
		if isLeftSample
	        DN015_PuzzleTerminalRef.AddTextReplacementData("DN015LeftCompound", NameReplace)
	    else
	        DN015_PuzzleTerminalRef.AddTextReplacementData("DN015RightCompound", NameReplace)
	    endif
	 else 	;previouslyScanned == false
	 	if isLeftSample
	        DN015_PuzzleTerminalRef.AddTextReplacementData("DN015LeftCompound", CurrentSample.GetBaseObject())
	    else
	        DN015_PuzzleTerminalRef.AddTextReplacementData("DN015RightCompound", CurrentSample.GetBaseObject())
	    endif
	 endif
EndFunction

GlobalVariable Property DN015_PlacedSampleLeft Auto Const
GlobalVariable Property DN015_PlacedSampleRight Auto Const
GlobalVariable Property DN015_IsotopePlaced Auto Const
GlobalVariable Property DN015_AllComponentsPlaced Auto Const
Function CheckForAllItemsPlaced()
	if DN015_PlacedSampleLeft.GetValue() == 1 && DN015_PlacedSampleRight.GetValue() == 1 && DN015_IsotopePlaced.GetValue() == 1
		DN015_AllComponentsPlaced.SetValue(1)
	else
		DN015_AllComponentsPlaced.SetValue(0)
	endif
EndFunction