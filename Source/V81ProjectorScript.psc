Scriptname V81ProjectorScript extends ObjectReference
{Script to control projector slides. Copied from Drew's ProjectorScript.}

Group SlideProperties
	Light[] Property Slides Auto Const

	int property startingSlide = -1 Auto
	{If this is set to -1, start with no slide shown
		0 is the first slide, not 1}
	float property timeBetweenSlides = 0.15 Auto Const
	ObjectReference[] Property mySlides Auto hidden
EndGroup

Group SoundProperties
	Sound property turnOnSlideSFX Auto
	Sound Property turnOffSlideSFX Auto
EndGroup

;Hidden properties
objectReference Property MyCurrentSlide Auto Hidden

;Internal Variables
bool doOnce = false
int currentSlideNumber
int updateTimer = 100
bool CurrentlyLooping = false
bool runningSlideShow

Event OnCellAttach()
	if !doOnce
		if startingSlide > -1 && startingSlide <= Slides.length
			ShowSlide(startingSlide)
		endif
		doOnce = true
	endif

	PlaceMyLights()

	if runningSlideShow
		ContinueSlideShow()
	endif
EndEvent

Event OnCellDetach()
	ClearMyLights()
EndEvent


Function ShowSlide(int SlideNumber)
	if SlideNumber > -1 && SlideNumber <= Slides.length
		ClearSlide()

		objectReference objSelf = self as ObjectReference
		turnOnSlideSFX.play(objSelf)
		myCurrentSlide = mySlides[slideNumber]
		myCurrentSlide.Enable(false)
		myCurrentSlide = getLinkedRef().PlaceatMe(Slides[SlideNumber])
		currentSlideNumber = SlideNumber
	else

	endif
EndFunction

Function ClearSlide()
	objectReference objSelf = self as ObjectReference
	turnOffSlideSFX.play(objSelf)
	if MyCurrentSlide
		MyCurrentSlide.Disable(false)
		;MyCurrentSlide.Delete()
	endif
	MyCurrentSlide = none
EndFunction


Function ShowNextSlide()
	ShowSlide(currentSlideNumber + 1)
EndFunction


Function ShutOff()
	ClearSlide()
	runningSlideShow = false
EndFunction

Function StartSlideShow(bool looping = true)
	ShowSlide(0)
	runningSlideShow = true
	CurrentlyLooping = looping
	StartTimer(timeBetweenSlides, updateTimer)
EndFunction

Function ContinueSlideShow()
	ShowSlide(currentSlideNumber)
	StartTimer(timeBetweenSlides, updateTimer)
EndFunction

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

Function ClearMyLights()
	int slideNumber = 0
	int count = mySlides.length
	while slideNumber <= count
		mySlides[slideNumber].Delete()
		slideNumber += 1
	EndWhile
	mySlides = none
EndFunction