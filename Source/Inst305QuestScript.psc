Scriptname Inst305QuestScript extends Quest Conditional

Int Property SpeechVar Auto Conditional

Bool Property AllowMicActivate Auto Conditional

ReferenceAlias Property BoardroomMarker1 Auto Conditional

ReferenceAlias Property BoardroomMarker2 Auto Conditional

ReferenceAlias Property Allie Auto Conditional

ReferenceAlias Property Alana Auto Conditional

ReferenceAlias Property Clayton Auto Conditional

ReferenceAlias Property Evan Auto Conditional

ReferenceAlias Property Justin Auto Conditional

ReferenceAlias Property Madison Auto Conditional

Quest Property BoS203 Auto Conditional

inputenablelayer Property Inst305Layer Auto Conditional




Function ControlDisable()
Inst305Layer = InputEnablelayer.Create()
Inst305Layer.DisablePlayerControls()

endFunction


Function ControlEnable()

Inst305Layer.EnablePlayerControls()


EndFunction



Function MeetingUpdate()

int DoOnce

	if DoOnce == 0

;Move Directorate Actors to the boardroom

		Allie.GetReference().Moveto(BoardroomMarker2.GetReference())
		Allie.GetActorReference().EvaluatePackage()
		Clayton.GetReference().MoveTo(BoardroomMarker2.GetReference())
		Clayton.GetActorReference().EvaluatePackage()
;Make sure Doctor Li hasn't been poached by BoS
		if BoS203.GetStageDone(255) == 0
			Madison.GetReference().MoveTo(BoardroomMarker1.GetReference())
			Madison.GetActorReference().EvaluatePackage()
		else
			Evan.GetReference().MoveTo(BoardroomMarker1.GetReference())
			Evan.GetActorReference().EvaluatePackage()
		endif
;And make sure Justin is still available
		if InstM02.GetStageDone(1800) == 0
			Justin.GetReference().Moveto(BoardroomMarker1.GetReference())
			Justin.GetActorReference().EvaluatePackage()
		else
			Alana.GetReference().MoveTo(BoardroomMarker1.GetReference())
			Alana.GetActorReference().EvaluatePackage()
		endif		
		DoOnce =1
	endif


EndFunction
Int Property Inst305DirectorateSceneTrigger Auto Const

Int Property FatherSpeechDone Auto Conditional

Int Property Inst305ReactorReady Auto Conditional

Int Property MeetingProgress Auto Conditional
;1 - meeting started
;2 - made it to 2nd scene
;3 - decision time
Quest Property InstM02 Auto Const Mandatory
