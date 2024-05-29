Scriptname Hardcore:HC_DisableControlsEffectScript extends ActiveMagicEffect

Group Settings

bool Property DisableSprinting const auto
bool Property DisableRunning const auto
message Property MessageToDisplay const auto mandatory

imagespacemodifier Property IMOD const auto
float Property IMODMinStrength = 1.0 const auto
float Property IMODMaxStrength = 1.0 const auto
int Property IMODCountMin = 1 const auto
{how many times do we sequentially apply this IMOD}
int Property IMODCountMax = 1 const auto
{how many times do we sequentially apply this IMOD}

float Property IMODMIntervalMin = 0.0 const auto
{in seconds, min interval between apply IMOD sequentially}
float Property IMODMInternalMax = 3.0 const auto
{in seconds, max interval between apply IMOD sequentially}


float property TimerDuration = 30.0 const auto
{how long after IMOD sequence before we do it again}

float property MessageDelay = 2.0 const auto
{how long of a delay between showing message and when IMOD sequence completes}


EndGroup

InputEnableLayer inputLayer

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	inputLayer = InputEnableLayer.Create()

	if DisableRunning
		inputLayer.EnableRunning(false) 	;NOTE: i don't need to worry about unsetting this because the layer is thrown away when the spell effect ends and this script goes away
	elseif DisableSprinting
		inputLayer.EnableSprinting(false)
	endif

	ShowEffectAndMessageAndStartTimer()

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster) 
	inputLayer.EnableRunning(true)
	inputLayer.EnableSprinting(true)
EndEvent

Event OnTimer(int aiTimerID)
	ShowEffectAndMessageAndStartTimer()
EndEvent

Function ShowEffectAndMessageAndStartTimer()
	if IsBoundGameObjectAvailable() ;make sure the effect is still running
		
		int IMODCount = utility.RandomInt(IMODCountMin, IMODCountMax)
		int i = 0
		while (i < IMODCount)
			
			float IMODStrength = utility.RandomFloat(IMODMinStrength, IMODMaxStrength)
			IMOD.apply(IMODStrength)

			float IMODInterval = utility.RandomFloat(IMODMIntervalMin, IMODMInternalMax)
			utility.wait(IMODInterval)

			i += 1
		endwhile


		utility.wait(MessageDelay)
		MessageToDisplay.show()
		startTimer(TimerDuration)
	endif

EndFunction