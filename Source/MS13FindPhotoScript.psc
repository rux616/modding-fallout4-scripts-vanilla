Scriptname MS13FindPhotoScript extends Quest Conditional

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + "OnLocationChange " + akNewLoc)
	if akSender == Game.GetPlayer()
		if (akNewLoc == DiamondCityLocation && !DiamondCityLocation.IsChild(akOldLoc))
			; player is entering DC
			; Marowski sends thugs while alive after he knows player was involved in ambush
			if GetStageDone(420)
				if !Alias_Marowski.GetActorRef().IsDead() && (!Alias_HenryCooke.GetActorRef().IsDead() || !Alias_MalcolmLatimer.GetActorRef().IsDead())
					MS13ThugsPhotoKeyword.SendStoryEvent(akLoc = DiamondCityLocation)
				else
					; shut down the quest
					setstage(1000)
				endif
			endif
		endif
	endif
endEvent

function SetBlackmailReward(int reward)
	BlackmailReward = reward
	MS13FindPhotoDarcyReward.SetValue(reward/2)
endFunction

MS13Script Property MS13 Auto const

Location Property DiamondCityLocation auto const

Keyword Property MS13ThugsPhotoKeyword const auto

ReferenceAlias Property Alias_Marowski const auto
ReferenceAlias Property Alias_HenryCooke const auto
ReferenceAlias Property Alias_MalcolmLatimer const auto

int Property BlackmailReward auto conditional
{
	how much was player paid for photo blackmail?
	set when player is paid reward for turning in photo
}

GlobalVariable Property MS13FindPhotoDarcyReward auto
{
	half of BlackmailReward (used for dialogue conditions)
}