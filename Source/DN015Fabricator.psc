ScriptName DN015Fabricator Extends ObjectReference

Form Property DN015_PowerArmorDummy Auto Const
Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Keyword Property LinkCustom03 Auto Const
Keyword Property LinkCustom04 Auto Const
Keyword Property LinkCustom05 Auto Const
Keyword Property LinkCustom06 Auto Const
Keyword Property LinkCustom07 Auto Const
GlobalVariable Property DN015_FabricationBusy Auto Const
GlobalVariable Property DN015_FabricationComplete Auto Const

ReferenceAlias Property CompletedArmor Auto Const

Quest Property DN015 Auto Const

ObjectReference Translator
ObjectReference CurrentLaser
ObjectReference LaserLight
ObjectReference myArmor
DN158SubDoorLightController DispenserLight
ObjectReference DispenserWindow
ObjectReference FlashyLight
bool Initialized
ObjectReference FirstLaser

Event OnLoad()
	;Set our properties
	
	Init()
	if DN015_FabricationBusy.GetValue() == 0
		CurrentLaser = FirstLaser
		While CurrentLaser
			(CurrentLaser as DN015LaserEmmitterScript).SetArmed(False)
			CurrentLaser = CurrentLaser.GetLinkedRef(LinkCustom01)
		endWhile


	endif
EndEvent

Function Init()
	if !Initialized
		Translator = GetLinkedRef(LinkCustom06)
		FirstLaser = GetLinkedRef(LinkCustom01)
		LaserLight = GetLinkedRef(LinkCustom02)
		myArmor = GetLinkedRef()
		DispenserLight = (GetLinkedRef(LinkCustom05) as DN158SubDoorLightController)
		DispenserWindow = GetLinkedRef(LinkCustom04)
		FlashyLight = GetLinkedRef(LinkCustom07)
		Initialized = true
	endif
EndFunction

Function StartFabrication()
	;If fabricator is not busy
	Init()
	if DN015_FabricationBusy.GetValue() == 0
		DN015_FabricationBusy.SetValue(1)
		;/
		ObjectReference Translator = GetLinkedRef(LinkCustom06)
		ObjectReference CurrentLaser = GetLinkedRef(LinkCustom01)
		ObjectReference LaserLight = GetLinkedRef(LinkCustom02)
		ObjectReference myArmor = GetLinkedRef()
		DN158SubDoorLightController DispenserLight = (GetLinkedRef(LinkCustom05) as DN158SubDoorLightController)
		/;
		utility.wait(1.0)
		;Enable the lasers
		
		CurrentLaser = FirstLaser
		While CurrentLaser
			(CurrentLaser as DN015LaserEmmitterScript).SetArmed()
			CurrentLaser = CurrentLaser.GetLinkedRef(LinkCustom01)
			;utility.wait(0.5)
		endWhile

		;Enable the laser light
		LaserLight.Enable(abFadein = false)

		;Set the dispenser light to yellow
		DispenserLight.EZLightState("yellow")

		utility.wait(1.0)
		;ObjectReference TranslateTarget = GetNthLinkedRef(1)
		myArmor.Enable()

		Translator.Activate(Translator)
		;myArmor.SplineTranslateToRef(TranslateTarget, 5.0, 5.0)
		;RegisterForRemoteEvent(myArmor, "OnTranslationComplete")

;/
	endif
EndFunction	
	
	
Event ObjectReference.OnTranslationComplete(ObjectReference akSender)
	if akSender == myArmor

/;
		utility.Wait(10.0)

		;Disable the Lasers
		CurrentLaser = FirstLaser
		While CurrentLaser
			(CurrentLaser as DN015LaserEmmitterScript).SetArmed(False)
			CurrentLaser = CurrentLaser.GetLinkedRef(LinkCustom01)
			;utility.wait(0.5)
		endWhile

		;Disable the laser light
		LaserLight.Disable()
	
		;UnregisterForRemoteEvent(myArmor, "OnTranslationComplete")
		myArmor.Disable()
		;myArmor.Delete()
		;myArmor = None
		

		;Set Fabricator to not busy
		DN015_FabricationBusy.SetValue(0)
		
		;Dispense Armor
		DispenseArmor()
		DN015_MusicReward.Activate(DN015_MusicReward)
	Endif
EndFunction	
;EndEvent
	
Function DispenseArmor()
	DN015_FabricationComplete.SetValue(1)
	if DN015.isRunning()
		DN015.SetStage(90)
	endif
	ObjectReference DispenserArmor = CompletedArmor.GetReference()
	DispenserArmor.Moveto(GetLinkedRef(LinkCustom03))
	DispenserArmor.Enable()
	FlashyLight.Enable()
	;DispenserWindow.SetOpen(true)
	DispenserLight.EZLightState("green")
	DispenserWindow.PlayAnimation("Play03")

EndFunction

ObjectReference Property DN015_MusicReward Auto Const
