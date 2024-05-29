Scriptname DLC04:AbPerkGhoulish04EffectScript extends activemagiceffect Const

; PROPERTIES
;///////////////////////////////////////////////////////////////////////////;
ActorValue Property Rads                                 Auto Const Mandatory
ActorValue Property Health                               Auto Const Mandatory
float      Property MaxRadPercentToRecyle        = 0.005 Auto Const
float      Property GameTimerInterval_RadRecycle = 0.033 Auto Const
;///////////////////////////////////////////////////////////////////////////;

; GLOBALS
;///////////////////////////////////////////////////////////////////////////;
int GameTimerID_RadRecycle = 1 const
;///////////////////////////////////////////////////////////////////////////;

; EVENTS
;///////////////////////////////////////////////////////////////////////////;
Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace("AbPerkGhoulish04EffectScript.OnEffectStart()")
	StartTimerGameTime(GameTimerInterval_RadRecycle, GameTimerID_RadRecycle)
EndEvent

Event OnTimerGameTime(int aiTimerID)
	debug.trace("AbPerkGhoulish04EffectScript.OnTimerGameTime()")
	if aiTimerID == GameTimerID_RadRecycle
		debug.trace("AbPerkGhoulish04EffectScript.OnTimerGameTime() aiTimerID: = GameTimerID_RadRecycle @ " + Utility.GetCurrentGameTime())
		
		; Get Variables
		Actor PlayerRef          = Game.GetPlayer()
		float RadPercentToRecyle = MaxRadPercentToRecyle
		float CurrentRadPercent  = PlayerRef.GetValue(Rads) / 1000.0
		
		; Find out what how much we are healing
		if CurrentRadPercent < MaxRadPercentToRecyle
			RadPercentToRecyle = CurrentRadPercent
		endif
		debug.trace("AbPerkGhoulish04EffectScript.OnTimerGameTime(): RadPercentToRecyle("+RadPercentToRecyle+"), CurrentRadPercent("+CurrentRadPercent+")")

		; Math... Careful not to get kicked off any planes.
		float RadsToRestore   = RadPercentToRecyle * 1000.0
		float HealthToRestore = RadPercentToRecyle * ((1.0 / PlayerRef.GetValuePercentage(Health)) * PlayerRef.GetValue(Health))
		debug.trace("AbPerkGhoulish04EffectScript.OnTimerGameTime(): RadsToRestore("+RadsToRestore+"), HealthToRestore("+HealthToRestore+")")		
	
		; Heal	
		PlayerRef.RestoreValue(Rads,   RadsToRestore)
		PlayerRef.RestoreValue(Health, HealthToRestore)

		; Restart
		StartTimerGameTime(GameTimerInterval_RadRecycle, GameTimerID_RadRecycle)
	endif
EndEvent
;///////////////////////////////////////////////////////////////////////////;
