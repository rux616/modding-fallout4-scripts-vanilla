Scriptname BoS303WarningScript extends ReferenceAlias Conditional

Message Property BoS303WarningMessage Auto Const
Quest Property BoS303 Auto Const
GlobalVariable Property PlayerInstitute_KickedOut Auto Const
Int ButtonPressed = 0
Int PlayerBoards = 0
GlobalVariable Property BoS303IngramGoing Auto Const
ReferenceAlias Property BoS303Ingram Auto Const	 
GlobalVariable Property BoS303BoardGo Auto Const

Function LaunchVertibird()

	PlayerBoards = 1
	(GetActorRef() as VertibirdTurretScript).BlockPlayerActivation(false,true)
	GetActorRef().Activate(Game.GetPlayer())

	BoS303BoardGo.SetValue(1)

	if BoS303IngramGoing == None || BoS303IngramGoing.GetValue() == 1
		if BoS303Ingram.GetActorRef().IsOnMount() == 0
			BoS303Ingram.GetActorRef().SnapIntoInteraction(GetActorRef())
		endif
	endif

endFunction

Event OnActivate(ObjectReference akActionRef)
debug.trace("I am activating a vertibird")

if PlayerBoards == 0
	if akActionRef == Game.GetPlayer()
		if BoS303.IsObjectiveDisplayed(20)
			if PlayerInstitute_KickedOut.GetValue() == 0
				Debug.Trace("BoS303WarningScript Activated")
				ButtonPressed = BoS303WarningMessage.Show()
				if ButtonPressed == 0
					Debug.Trace("Button 0 Pressed")
					LaunchVertibird()
				elseif ButtonPressed == 1
					Debug.Trace("Button 1 Pressed")
					;do nothing
				endif
			elseif PlayerInstitute_KickedOut.GetValue() == 1
				LaunchVertibird()
			endif
		endif
	endif
endif


EndEvent