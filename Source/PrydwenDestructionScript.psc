Scriptname PrydwenDestructionScript extends ObjectReference
{Claaed by the quest to handle the Prywen destruction sequence}




;Enable disable parens for Prydwen states.
ObjectReference Property PrydwenCrashEnableRef Auto Const
ObjectReference Property PrydwenDisableRef Auto Const
ObjectReference property BoSPrydwenVertibirdMainPerch001 Auto Const
ObjectReference property BoSPrydwenVertibirdMainPerchStatic Auto Const

;Quest responsible for managing the enable state of the airport.
Quest Property BoSEnable Auto Const

;enable parent for the crashed version of the prydewen
ObjectReference Property Bosdestroyed Auto Const

;Imods for playing during explosions
ImageSpaceModifier Property pExplosionFlash Auto Const
ImageSpaceModifier Property pExplosionFlashLarge Auto Const

;object to play fx for prime shooting the prydwen
ObjectReference Property LibertyPrimeHeadShootingRef Auto Const
ObjectReference Property BoSLibertyPrimeStaticRefLights Auto Const
ObjectReference Property Inst307PrimeRefHackingLightRef Auto Const

;super dusty weather to swap to after the explosion
Weather Property CommonwealthDusty Auto Const

CustomEvent PrydwenDestructionDone

bool useLasersLocal
;test to see if we can allow the post crash wether swap on trigger enter.
bool prydwenIsCrashed

Event OnLoad()
	;events coming from the crash art to trigger stuff in this script
	 RegisterForAnimationEvent(self, "impact")
	 RegisterForAnimationEvent(self, "flash")
	 registerForAnimationEvent(self, "flashLarge")
endEvent

;trigger based weather stuff---------------------------------------------------------------------------------------------------------------------
Event OnTriggerEnter(ObjectReference akActionRef)
	;if player enters the crash zone after the crash play the dusty weather. May need to set some kind of timer so this end eventually
	;trigger is built into the art
	if akActionRef == game.getPlayer() && prydwenIsCrashed == true
	debug.trace("player enter the crash zone!!1" )
   	 CommonwealthDusty.SetActive(true, true)
   	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	;remove weather if player leaves trigger.
    debug.trace("player exit the crash zone!!1" )
    Weather.ReleaseOverride()
EndEvent

;functions---------------------------------------------------------------------------------------------------------------------------------------------
function swapPrydwen()
	self.enable()
	PrydwenCrashEnableRef.enable()
	PrydwenDisableRef.disable()
	BoSPrydwenVertibirdMainPerch001.Enable()
endFunction

function swapDestroyedPrydwen()
	;Disable the normal state of the base, and enable the destroyed state.
	BoSEnable.SetStage(200)
	utility.wait(0.5)
	PrydwenCrashEnableRef.disable()
endFunction

function swapArm()
	BoSPrydwenVertibirdMainPerchStatic.Enable()
	BoSPrydwenVertibirdMainPerch001.Disable()
endFunction

Function StartCrash(bool withLasers)
	if (withLasers)
		StartTimer(0, 1)
		useLasersLocal = true
	Else
		StartTimer(0, 2)
		useLasersLocal = false
	endIf
endFunction

;timers and anim events---------------------------------------------------------------------------------------------------------------------------------------------
Event OnTimer(int timerID)
	if (timerID == 1)
		CrashPrydwenLaser()
	ElseIf (timerID == 2)
		CrashPrydwen()
	Else
		Debug.Trace("Invalid timerID")
	endIf
EndEvent

;not art fx to play during crash
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName =="impact"
    	;debug.trace("i got impact eventtttttttttttttttttttty " )
    	BoSPrydwenVertibirdMainPerchStatic.DisableNoWait()
    	Game.ShakeCamera(game.getPlayer(),0.5, 3.5)
    	Game.ShakeController(0.5, 0.5, 2.0)
    	swapDestroyedPrydwen()
		SendCustomEvent("PrydwenDestructionDone")	
		prydwenIsCrashed = true	
    endIf
    if asEventName =="flash"
    	;debug.trace("i got flashhhhhh eventtttttttttttttttttttty " )
    	pExplosionFlash.Apply()
    	Game.ShakeCamera(game.getPlayer(),0.2, 0.5)
    	Game.ShakeController(0.2, 0.2, 0.5)
    endIf
    if asEventName =="flashLarge"
    	;debug.trace("i got flashhhhhh eventtttttttttttttttttttty " )
    	pExplosionFlashLarge.Apply()
    	Game.ShakeCamera(game.getPlayer(),0.4, 1.0)
    	Game.ShakeController(0.4, 0.4, 1.0)
    endIf
EndEvent

;functions---------------------------------------------------------------------------------------------------------------------------------------------
function crashPrydwenLaser()
	while !Is3dLoaded()	
			utility.wait(0.1)
	endWhile
	if  self.WaitFor3DLoad()
		LibertyPrimeHeadShootingRef.PlayAnimation("PrimeShoot")
		BoSLibertyPrimeStaticRefLights.PlayAnimation("PrimeShoot")
		Inst307PrimeRefHackingLightRef.PlayAnimation("PrimeShoot")
		utility.wait(0.2) ;;this wait should be from the start of LP shooting off his laser until it starts the destruction of the Prydwen
		self.PlayAnimation("stage2")
	else
		;nothing
	endif


 	
endFunction

function crashPrydwen()
	if  self.WaitFor3DLoad()
		self.PlayAnimation("stage2")
	else
		;nothing
	endif


endFunction


function garageFX()
	if  self.WaitFor3DLoad()
		self.PlayAnimation("stage2")
	else
		;nothing
	endif
endFunction




