Scriptname DefaultAliasOnLockStateChanged extends DefaultAlias Const Default
{Default script used for checking if an alias has been locked/unlocked}

Group Optional_Properties
	Bool Property CheckForUnlock = TRUE Const Auto
	{DEFAULT = TRUE.  If set to FALSE then stage will set on LOCK instead.}
EndGroup

Event OnLockStateChanged()
DefaultScriptFunctions.DefaultScriptTrace(self + ": OnLockStateChanged() Called on DefaultAliasOnLockStateChanged script.", ShowTraces)
	if (self.GetReference().IsLocked() == FALSE) && CheckForUnlock
		DefaultScriptFunctions.DefaultScriptTrace(self + ": Setting stage because lock was UNLOCKED, on DefaultAliasOnLockStateChanged script.", ShowTraces)
		TryToSetStage()
	elseif self.GetReference().IsLocked() && (CheckForUnlock == FALSE)
		DefaultScriptFunctions.DefaultScriptTrace(self + ": Setting stage because lock was LOCKED, on DefaultAliasOnLockStateChanged script.", ShowTraces)
		TryToSetStage()
	endif
EndEvent