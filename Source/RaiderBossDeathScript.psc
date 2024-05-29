Scriptname RaiderBossDeathScript extends Actor Const

Struct RaiderBossInfo
	Location BossLocation
	GlobalVariable EnemyBossEntryGlobal
EndStruct

Group DisablingQuestProperties
	Quest Property DisablingQuest Auto Const
	int Property iQuestStage = -1 Auto Const
EndGroup

RaiderBossInfo [] Property EnemyBossInfos Auto Const

Event OnInit()
	
	int iCount = 0

	;If the specified location has been cleared already, set the appropriate global for 
	;this boss' terminal. Otherwise, register the location for being cleared
	while (iCount < EnemyBossInfos.Length)
		if EnemyBossInfos[iCount].BossLocation.HasEverBeenCleared() && !self.isDead() ;&& !DisablingQuest.GetStageDone(iQuestStage)
			EnemyBossInfos[iCount].EnemyBossEntryGlobal.SetValue(1)
		elseif !self.isDead() ;&& !DisablingQuest.GetStageDone(iQuestStage)
			RegisterForRemoteEvent(EnemyBossInfos[iCount].BossLocation, "OnLocationCleared")
		endif
		iCount += 1
	endwhile
	
endEvent

Event Location.OnLocationCleared(Location akSender)
	;If this character is still alive and enabled...
	if !self.isDead() ;&& !DisablingQuest.GetStageDone(iQuestStage)
		int iCount = 0
		 
		;Figure out what location has been cleared, set the matching boss terminal global
		;then unregister the clearance event
		while (iCount < EnemyBossInfos.Length)

			if EnemyBossInfos[iCount].BossLocation == akSender
				EnemyBossInfos[iCount].EnemyBossEntryGlobal.SetValue(1)
				UnregisterForRemoteEvent(EnemyBossInfos[iCount].BossLocation, "OnLocationCleared")
				return
			endif

			iCount += 1
		endwhile
	elseif self.isDead()
		;If he's dead, unreigster all location cleanance events, cuz no more entry updates for you, pal!
		UnregisterForAllRemoteEvents()
	endif
EndEvent

Event OnDeath(Actor akKiller)
	;On Death, unregister all remote events
	UnregisterForAllRemoteEvents()
EndEvent