Scriptname DefaultRefOnLockStateChanged extends DefaultRef Const Default
{Default script used for checking if a ref has been locked/unlocked}

Group Optional_Properties
	Bool Property CheckForUnlock = TRUE Const Auto
	{DEFAULT = TRUE.  If set to FALSE then stage will set on LOCK instead.}
EndGroup

Event OnLockStateChanged()
DefaultScriptFunctions.DefaultScriptTrace(self + ": OnLockStateChanged() Called on DefaultRefOnLockStateChanged script.", ShowTraces)
	if (IsLocked() == FALSE) && CheckForUnlock
		DefaultScriptFunctions.DefaultScriptTrace(self + ": Setting stage because lock was UNLOCKED, on DefaultRefOnLockStateChanged script.", ShowTraces)
		TryToSetStage()
	elseif IsLocked() && (CheckForUnlock == FALSE)
		DefaultScriptFunctions.DefaultScriptTrace(self + ": Setting stage because lock was LOCKED, on DefaultRefOnLockStateChanged script.", ShowTraces)
		TryToSetStage()
	endif
EndEvent