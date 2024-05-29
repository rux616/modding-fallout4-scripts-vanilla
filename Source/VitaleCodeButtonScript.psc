Scriptname VitaleCodeButtonScript extends ObjectReference

bool property isUpButton = true auto const
int property beginningValue = 1 auto const

float property boxScale = 0.22 auto const
{How much should we scale the box art?  Default = 0.22}

int property currentValue auto
objectReference property myCurrentArt = NONE auto

keyword property linkCustom01 auto const

Activator Property NumberBox01 Auto Const Mandatory
Activator Property NumberBox02 Auto Const Mandatory
Activator Property NumberBox03 Auto Const Mandatory
Activator Property NumberBox04 Auto Const Mandatory
Activator Property NumberBox05 Auto Const Mandatory
Activator Property NumberBox06 Auto Const Mandatory
Activator Property NumberBox07 Auto Const Mandatory
Activator Property NumberBox08 Auto Const Mandatory
Activator Property NumberBox09 Auto Const Mandatory
Activator Property NumberBox10 Auto Const Mandatory

;Event OnCellAttach()
Event OnLoad()  
	debug.trace("Number Puzzle Box: Loading...")	
    setBox(beginningValue)    	
    int i 

    while (myCurrentArt.getScale() != boxScale) && (i < 100)
    	debug.trace("    ..."+i)
    	myCurrentArt.setScale(boxScale)
    	utility.wait(0.1)
    	i += 1
    endWhile

    myCurrentArt.disable()
    myCurrentArt.enable()

    debug.trace("Number Puzzle Box: Loading Complete, myCurrent Art "+myCurrentArt+" scale to "+myCurrentArt.getScale())
EndEvent

Event OnActivate(ObjectReference akActionRef)

	debug.trace("Number Puzzle Box: Changing value...")
	debug.trace("    current value = "+currentValue)

    if isUpButton
    	currentValue += 1
    else
    	currentValue -= 1
    endif

    if currentValue >= 11
    	currentValue = 1
    endif

    if currentValue <= 0
    	currentValue = 10
    endif

    setBox(currentValue)

	debug.trace("    new value = "+currentValue)

	if (getLinkedRef(linkCustom01) as vitaleCodeMaster).checkForSolution()
		blockActivation()
		setDestroyed()
	endif

EndEvent


Function setBox(int newValue)

	ObjectReference myDummy = self.getLinkedRef()

	if myCurrentArt != NONE
		; disable any current art boxes, if they exist
		myCurrentArt.disable()
	endif

	if newValue == 1
		myCurrentArt = myDummy.placeAtMe(NumberBox01)
	endif
		if newValue == 2
		myCurrentArt = myDummy.placeAtMe(NumberBox02)
	endif
		if newValue == 3
		myCurrentArt = myDummy.placeAtMe(NumberBox03)
	endif
		if newValue == 4
		myCurrentArt = myDummy.placeAtMe(NumberBox04)
	endif
		if newValue == 5
		myCurrentArt = myDummy.placeAtMe(NumberBox05)
	endif
		if newValue == 6
		myCurrentArt = myDummy.placeAtMe(NumberBox06)
	endif
		if newValue == 7
		myCurrentArt = myDummy.placeAtMe(NumberBox07)
	endif
		if newValue == 8
		myCurrentArt = myDummy.placeAtMe(NumberBox08)
	endif
		if newValue == 9
		myCurrentArt = myDummy.placeAtMe(NumberBox09)
	endif
		if newValue == 10
		myCurrentArt = myDummy.placeAtMe(NumberBox10)
	endif

	myCurrentArt.setScale(boxScale)

endFunction