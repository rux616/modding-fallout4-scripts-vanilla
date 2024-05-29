Scriptname TestGoreBloodSprayGroundScript extends ObjectReference 
{This is a silly test script for blood splatter to appear under gore chunks.}

ImpactDataSet Property pBloodSprayImpactSetRed Auto Const
String Property sCastingNodeName Auto Const
bool Property bIsLeeky = false Auto Const

bool bImHoldingThis = false

Event OnLoad()
	ObjectReference obj = (Self as ObjectReference)
	utility.wait(0.6)
	obj.PlayImpactEffect(pBloodSprayImpactSetRed, sCastingNodeName, 0, 0, -1, 512, false, false)
	;debug.trace("This Script is running on: " + obj)
EndEvent

Event OnGrab()
	debug.trace("Noodle has been grabbed!")
	If bIsLeeky
		int spraycount = 0
		bImHoldingThis = true
		bool bSwitch

		while bImHoldingThis == true
			ObjectReference obj = (Self as ObjectReference)
			utility.wait(0.5)
			if bSwitch
				obj.PlayImpactEffect(pBloodSprayImpactSetRed, sCastingNodeName, 0, 0, -1, 320, false, true)
			else
				obj.PlayImpactEffect(pBloodSprayImpactSetRed, ("GoreSpray2"), 0, 0, -1, 320, false, true)
			endif
			bSwitch = !bSwitch
			spraycount += 1
			debug.trace("Noodle has Sprayed: " + spraycount + " times.")
		endWhile
	endif
EndEvent

Event OnRelease()
	utility.wait(0.6)
	bImHoldingThis = false
	debug.trace("Noodle has been dropped!")
EndEvent