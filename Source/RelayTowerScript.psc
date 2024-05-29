Scriptname RelayTowerScript extends ObjectReference Hidden conditional

ObjectReference Property Transmitter01 auto
ObjectReference Property Transmitter02 auto
ObjectReference Property Transmitter03 auto
ObjectReference Property Receiver01 auto
ObjectReference Property Receiver02 auto
ObjectReference Property Receiver03 auto
ObjectReference Property RelayTowerLOD auto
ObjectReference Property MapMarker auto
Message Property DashMessage auto
Message Property OfflineMessage auto
Message Property BlankMessage auto
Keyword Property LinkCustom01 auto
GlobalVariable Property RelayTowerTransmitter01Distance auto
GlobalVariable Property RelayTowerTransmitter02Distance auto
GlobalVariable Property RelayTowerTransmitter03Distance auto
Message Property UnitOfMeasurement auto

Quest Property UFOCrashQuest auto
Quest Property RelayTowerQuest auto
bool Property bCareAboutUFO = FALSE auto

bool TowerIsUp = FALSE conditional
bool IsMoving = FALSE conditional

auto State DownPosition
	Function MoveTower()
		;GetLinkedRef().BlockActivation()
		GoToState("MovingUp")
		IsMoving = TRUE
		TowerIsUp = TRUE
		RegisterForAnimationEvent(self, "done")
		PlayAnimation("Play01")
	EndFunction
EndState


State UpPosition
	Function MoveTower()
		;GetLinkedRef().BlockActivation()
		GoToState("MovingDown")
		IsMoving = TRUE
		TowerIsUp = FALSE
		RelayTowerLOD.DisableNoWait()
		RegisterForAnimationEvent(self, "done")
		PlayAnimation("Play01")
	EndFunction

	Event OnBeginState(string asOldState)
			;int TIndex = 0 ;Transmitter Index
			;while TIndex < 3
				TransmitterTextReplacement(Transmitter01, "Frequency1")
				TransmitterTextReplacement(Transmitter02, "Frequency2")
				TransmitterTextReplacement(Transmitter03, "Frequency3")
				;TIndex += 1
			;endwhile
	endEvent
EndState


State MovingUp
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if asEventName == "done"
			;GetLinkedRef().BlockActivation(FALSE)
			UnRegisterForAnimationEvent(self, "done")
			RelayTowerQuest.SetStage(0)
			RelayTowerLOD.EnableNoWait()
			;MapMarker.EnableNoWait()
			if Receiver01
				if Receiver01.IsRadioOn()	;if radio 1 is on
					Transmitter01.EnableNoWait()	;enable transmitter 1
				endif
			endif
			if Receiver02
				if Receiver02.IsRadioOn()	;if radio 2 is on
					Transmitter02.EnableNoWait()	;enable transmitter 2
				endif
			endif
			if Receiver03
				if bCareAboutUFO
					if UFOCrashQuest.IsStageDone(10)
						if Receiver03.IsRadioOn()	;if radio 3 is on
							Transmitter03.EnableNoWait()	;enable transmitter 3
						endif
					endif
				else
					if Receiver03.IsRadioOn()	;if radio 3 is on
						Transmitter03.EnableNoWait()	;enable transmitter 3
					endif
				endif
			endif
			GoToState("UpPosition")
		endif
	EndEvent
EndState


State MovingDown
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if asEventName == "done"
			;GetLinkedRef().BlockActivation(FALSE)
			GoToState("DownPosition")
			UnRegisterForAnimationEvent(self, "done")
			IsMoving = FALSE
			if Transmitter01
				Transmitter01.DisableNoWait()
			endif
			if Transmitter02
				Transmitter02.DisableNoWait()
			endif
			if Transmitter03
				Transmitter03.DisableNoWait()
			endif
				TransmitterTextReplacement(none, "Frequency1")
				TransmitterTextReplacement(none, "Frequency2")
				TransmitterTextReplacement(none, "Frequency3")
		endif
	EndEvent
EndState

Function MoveTower()
	;Cause I have to
EndFunction

Event OnLoad()
	if GetLinkedRef(LinkCustom01) != none
		RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnActivate")
	endif
	if Receiver01
		RegisterForRemoteEvent(Receiver01, "OnActivate")
	endif
	if Receiver02
		RegisterForRemoteEvent(Receiver02, "OnActivate")
	endif
	if Receiver03
		RegisterForRemoteEvent(Receiver03, "OnActivate")
	endif

EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	ObjectReference LinkTerminal = GetLinkedRef(LinkCustom01)
	debug.trace("RelayTowerScriptinOnActivate")
	if akSender == LinkTerminal
		if Transmitter01 != none && Transmitter01.IsEnabled()
			;debug.trace(self + " transmitter01 is enabled by " + akActionRef)
			RelayTowerTransmitter01Distance.SetValue(Transmitter01.GetTransmitterDistance()/70)
			LinkTerminal.AddTextReplacementData("OfflineMessage01", BlankMessage)
			LinkTerminal.AddTextReplacementData("DashMessage01", DashMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter01Distance", RelayTowerTransmitter01Distance)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement01", UnitOfMeasurement)
		elseif Transmitter01 != none && Transmitter01.IsDisabled()
			;debug.trace(self + " transmitter01 is disabled")
			RelayTowerTransmitter01Distance.SetValue(Transmitter01.GetTransmitterDistance()/70)
			LinkTerminal.AddTextReplacementData("OfflineMessage01", OfflineMessage)
			LinkTerminal.AddTextReplacementData("DashMessage01", DashMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter01Distance", BlankMessage)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement01", BlankMessage)
		elseif Transmitter01 == none
			LinkTerminal.AddTextReplacementData("OfflineMessage01", BlankMessage)
			LinkTerminal.AddTextReplacementData("DashMessage01", BlankMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter01Distance", BlankMessage)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement01", BlankMessage)
	    endif
		if Transmitter02 != none && Transmitter02.IsEnabled()
			RelayTowerTransmitter02Distance.SetValue(Transmitter02.GetTransmitterDistance()/70)
			LinkTerminal.AddTextReplacementData("OfflineMessage02", BlankMessage)
			LinkTerminal.AddTextReplacementData("DashMessage02", DashMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter02Distance", RelayTowerTransmitter02Distance)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement02", UnitOfMeasurement)
		elseif Transmitter02 != none && Transmitter02.IsDisabled()
			RelayTowerTransmitter02Distance.SetValue(Transmitter02.GetTransmitterDistance()/70)
			LinkTerminal.AddTextReplacementData("OfflineMessage02", OfflineMessage)
			LinkTerminal.AddTextReplacementData("DashMessage02", DashMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter02Distance", BlankMessage)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement02", BlankMessage)
		elseif Transmitter02 == none
			LinkTerminal.AddTextReplacementData("OfflineMessage02", BlankMessage)
			LinkTerminal.AddTextReplacementData("DashMessage02", BlankMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter02Distance", BlankMessage)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement02", BlankMessage)
		
		endif
		if Transmitter03 != none && Transmitter03.IsEnabled()
			RelayTowerTransmitter03Distance.SetValue(Transmitter03.GetTransmitterDistance()/70)
			LinkTerminal.AddTextReplacementData("OfflineMessage03", BlankMessage)
			LinkTerminal.AddTextReplacementData("DashMessage03", DashMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter03Distance", RelayTowerTransmitter03Distance)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement03", UnitOfMeasurement)
		elseif Transmitter03 != none && Transmitter03.IsDisabled() && bCareAboutUFO == FALSE
			RelayTowerTransmitter03Distance.SetValue(Transmitter03.GetTransmitterDistance()/70)
			LinkTerminal.AddTextReplacementData("OfflineMessage03", OfflineMessage)
			LinkTerminal.AddTextReplacementData("DashMessage03", DashMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter03Distance", BlankMessage)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement03", BlankMessage)
		elseif Transmitter03 != none && Transmitter03.IsDisabled() && bCareAboutUFO
			RelayTowerTransmitter03Distance.SetValue(Transmitter03.GetTransmitterDistance()/70)
			LinkTerminal.AddTextReplacementData("OfflineMessage03", BlankMessage)
			LinkTerminal.AddTextReplacementData("DashMessage03", BlankMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter03Distance", BlankMessage)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement03", BlankMessage)
		elseif Transmitter03 == none
			LinkTerminal.AddTextReplacementData("OfflineMessage03", BlankMessage)
			LinkTerminal.AddTextReplacementData("DashMessage03", BlankMessage)
			LinkTerminal.AddTextReplacementData("RelayTowerTransmitter03Distance", BlankMessage)
			LinkTerminal.AddTextReplacementData("UnitOfMeasurement03", BlankMessage)
		
		endif

	endif
	if akSender == Receiver01	;if radio 1 is activated
		HandleReceiverActivate(Receiver01, Transmitter01)
	endif
	if akSender == Receiver02	;if radio 2 is activated
		HandleReceiverActivate(Receiver02, Transmitter02)
	endif
	if akSender == Receiver03	;if radio 3 is activated
		HandleReceiverActivate(Receiver03, Transmitter03)
	
	endif
EndEvent

Function UFOSetup()

		TransmitterTextReplacement(Transmitter03, "Frequency3")

endFunction


Function HandleReceiverActivate(ObjectReference ReceiverToHandle, ObjectReference TransmitterToHandle)
	;utility.wait(1)
	if TowerIsUp && ReceiverToHandle.IsRadioOn()	;if tower is raised and the radio is on
		TransmitterToHandle.EnableNoWait()	;enable transmitter
	elseif TowerIsUp && !ReceiverToHandle.IsRadioOn()	;if tower is raised and radio is off
		TransmitterToHandle.DisableNoWait()	;disable transmitter

	endif
EndFunction

Function TransmitterTextReplacement(ObjectReference TransmitterToHandle, string AliasTokenName)
			int FIndex = 0 ;This is index for reference aliases in quest
			ObjectReference LinkTerminal = GetLinkedRef(LinkCustom01)	
						;VerifiedRadioTowerFrequencies.Clear()
			while FIndex < RadioTowerFrequencies.length
				if TransmitterToHandle == RadioTowerFrequencies[FIndex].GetReference() && TransmitterToHandle != none && ((FIndex != 9 && !TransmitterToHandle.IsDisabled()) || UFOCrashQuest.IsStageDone(10)); && TransmitterToHandle.IsEnabled()	
						int VIndex = 0
						while VIndex < VerifiedRadioTowerFrequencies.length
							if TransmitterToHandle == VerifiedRadioTowerFrequencies[VIndex]
								;Do nothing
							else
								debug.trace(FIndex)
								LinkTerminal.AddTextReplacementData(AliasTokenName, RadioTowerFrequencyNames[FIndex])

								VerifiedRadioTowerFrequencies.Add(TransmitterToHandle)
								FIndex = RadioTowerFrequencies.Length
								VIndex = VerifiedRadioTowerFrequencies.Length
								;`debug.trace(RadioTowerFrequencies[FIndex].GetReference())
							endif
							VIndex += 1
						endwhile
				else
					LinkTerminal.AddTextReplacementData(AliasTokenName, BlankMessage)

				endif
				FIndex += 1
			endwhile
			IsMoving = FALSE
EndFunction


ReferenceAlias[] Property RadioTowerFrequencies Auto Const
ObjectReference[] Property VerifiedRadioTowerFrequencies Auto
Message[] Property RadioTowerFrequencyNames Auto Const
