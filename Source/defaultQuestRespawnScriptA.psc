Scriptname defaultQuestRespawnScriptA extends defaultQuestRespawnScript  Default
{Simple script to respawn Aliases that have the DefaultAliasRespawnScriptA on them.}

import Utility
import debug

; call this when you want to try to respawn
function TryToRespawn(ReferenceAlias aliasToRespawn)
	Debug.Trace("Catch")
 	DefaultScriptFunctions.DefaultScriptTrace(self + " Respawn called by " + aliasToRespawn, ShowTraces)
	if ( startStage == 0 || (startStage > 0 && GetStageDone(startStage)) ) && ( doneStage == 0 || ( doneStage > 0 && !GetStageDone(doneStage) ) ) && ( respawnPool == 0 || (respawnPool > 0 && respawnCount < respawnPool ) )
		respawnCount = respawnCount + 1
		; wait for respawn time
 		DefaultScriptFunctions.DefaultScriptTrace(self + " Waiting to respawn...", ShowTraces)
		Wait( RandomInt(respawnTimeMin, respawnTimeMax) )
 		DefaultScriptFunctions.DefaultScriptTrace(self + " Finding a respawn spot", ShowTraces)
		if (aliasToRespawn as defaultAliasRespawnScriptA).bRespawningOn
			Respawn(aliasToRespawn)
		else
 			DefaultScriptFunctions.DefaultScriptTrace(self + " Didn't respawn " + aliasToRespawn + " - current actor no longer set to respawn", ShowTraces)
		endif
	endif
endFunction