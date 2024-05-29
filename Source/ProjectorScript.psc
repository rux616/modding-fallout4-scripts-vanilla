scriptName ProjectorScript Extends ObjectReference
{Script to control projector slides}

Group SlideProperties
	Light[] Property Slides Auto Const

	int property startingSlide = -1 Auto
	{If this is set to -1, start with no slide shown
		0 is the first slide, not 1}
	float property timeBetweenSlides = 0.15 Auto Const
	ObjectReference[] Property mySlides Auto hidden
EndGroup

Group SoundProperties collapsedOnRef

	Sound Property OBJProjectorRunLPM auto Const 	;running/idle
	Sound Property OBJProjectorNext Auto Const

EndGroup

;Hidden properties
objectReference Property MyCurrentSlide Auto Hidden

;Internal Variables
bool doOnce = false
int currentSlideNumber
int updateTimer = 100
bool CurrentlyLooping = false
bool runningSlideShow
int mySound
objectReference objSelf

bool powerOn
bool property isPoweredOn hidden
	bool Function Get()
		return powerOn
	EndFunction
	Function Set(bool newSetting)
		if newSetting == powerOn
		else
			powerOn = newSetting
			if powerOn
				mySound = OBJProjectorRunLPM.play(objSelf)
			else
				Sound.StopInstance(mySound)
			endif
		endif
	EndFunction
EndProperty

;Here we place the lights and show the starting slide if desired
Event OnCellAttach()
	PlaceMyLights()
	objSelf = self as ObjectReference
	if isPoweredOn
		mySound = OBJProjectorRunLPM.play(objSelf)
	endif
	if !doOnce
		if startingSlide > -1 && startingSlide <= Slides.length
			ShowSlide(startingSlide)
		endif
		doOnce = true
	endif

	if runningSlideShow
		ContinueSlideShow()
	endif

EndEvent

;This deletes and clears all the lights when they are no longer needed
Event OnCellDetach()
	ClearMyLights()
	objSelf = none
	Sound.StopInstance(mySound)
EndEvent


;The lights are placed on cell attach, then disabled so all this needs to do is enable them
;This is done to prevent delays from trying to place a new form
;This was broken out into a seperate function so it can be called from an external script to show a specific slide
Function ShowSlide(int SlideNumber)
	if !isPoweredOn
		isPoweredOn = true
	endif

	if SlideNumber > -1 && SlideNumber <= Slides.length
		ClearSlide()

		objSelf = self as ObjectReference
		OBJProjectorNext.play(objSelf)
		myCurrentSlide = mySlides[slideNumber]
		myCurrentSlide.Enable(false)
		currentSlideNumber = SlideNumber
	else

	endif
EndFunction

;Clear the current slide
Function ClearSlide()
	objSelf = self as ObjectReference
	;turnOffSlideSFX.play(objSelf)
	if MyCurrentSlide
		MyCurrentSlide.Disable(false)
	endif
	MyCurrentSlide = none
EndFunction

;Show the next slide in the order given by the array
Function ShowNextSlide()
	ShowSlide(currentSlideNumber + 1)
EndFunction

;Shut off the projector, this does not clear the lights so it can be turned on quickly
Function ShutOff()
	isPoweredOn = false
	ClearSlide()
	runningSlideShow = false
EndFunction

;Start the slideshow and just let it run, if it is looping it will continue till told to stop
Function StartSlideShow(bool looping = true)
	ShowSlide(0)
	runningSlideShow = true
	CurrentlyLooping = looping
	StartTimer(timeBetweenSlides, updateTimer)
EndFunction

;This continues the slideshow to the next slide, after being called by the timer
Function ContinueSlideShow()
	ShowSlide(currentSlideNumber)
	StartTimer(timeBetweenSlides, updateTimer)
EndFunction

;Here we recieve timer events for the auto running slideshow
Event OnTimer(int aiTimerID)
	if aiTimerID == updateTimer
		if is3dLoaded()
			int nextSlide = currentSlideNumber + 1
			if nextSlide > (Slides.length - 1)
				if CurrentlyLooping == True
					ShowSlide(0)
					StartTimer(timeBetweenSlides, updateTimer)
				else
					ShutOff()
				endif
			else
				ShowNextSlide()
				StartTimer(timeBetweenSlides, updateTimer)
			endif
		endif
	endif
EndEvent

Event OnActivate(objectReference akActionRef)
	StartSlideShow()
EndEvent

;This is the function that actually places the lights and pushes them into the objectReference array for control
;It is called in the OnCellAttach event
Function PlaceMyLights()
	int slideNumber = 0
	int count = Slides.length
	mySlides = new objectReference[0]
	mySlides
	while slideNumber <= count
		objectReference newLight = getLinkedRef().PlaceatMe(Slides[SlideNumber], 1, false, abInitiallyDisabled = true)
		mySlides.add(newLight)
		slideNumber += 1
	EndWhile
EndFunction

;This is where we clear out all the lights when unloaded.
;This way we are not keeping unnecessary objects that may cause bugs
Function ClearMyLights()
	int slideNumber = 0
	int count = mySlides.length
	while slideNumber <= count
		mySlides[slideNumber].Delete()
		slideNumber += 1
	EndWhile
	mySlides = none
EndFunction
