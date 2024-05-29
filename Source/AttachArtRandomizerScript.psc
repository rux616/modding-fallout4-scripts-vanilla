Scriptname AttachArtRandomizerScript extends Actor
{Takes in a group of attach art and add 1 at random. Made for attachind random horns to brahmin and radstags.}

VisualEffect Property slotA01 Auto Const
{Put a visual effect for slot 01 here}

VisualEffect Property slotA02 Auto Const
{Put a visual effect for slot 02 here}

VisualEffect Property slotA03 Auto Const
{Put a visual effect for slot 03 here}

VisualEffect  mySlotAArt

int mySlotASelection

VisualEffect Property slotB01 Auto Const
{Put a visual effect for slot 01 here}

VisualEffect Property slotB02 Auto Const
{Put a visual effect for slot 02 here}

VisualEffect Property slotB03 Auto Const
{Put a visual effect for slot 03 here}

VisualEffect  mySlotBArt

int mySlotBSelection


Event OnLoad()


	if  !mySlotAArt
		mySlotASelection = Utility.RandomInt(1, 3)

		if mySlotASelection == 1
			mySlotAArt = slotA01
		endif

		if mySlotASelection == 2
			mySlotAArt = slotA02
		endif

		if mySlotASelection == 3
			mySlotAArt = slotA03
		endif
	endif   

    mySlotAArt.play(self)


    if  !mySlotBArt
		mySlotBSelection = Utility.RandomInt(1, 3)

		if mySlotBSelection == 1
			mySlotBArt = slotB01
		endif

		if mySlotBSelection == 2
			mySlotBArt = slotB02
		endif

		if mySlotBSelection == 3
			mySlotBArt = slotB03
		endif
	endif   



    mySlotBArt.play(self)

EndEvent