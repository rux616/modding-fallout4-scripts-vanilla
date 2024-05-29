Scriptname DLC04:AlienAnimatronicRaceScript extends activemagiceffect

Activator Property PDLC04AnimatronicAlienAshpile Auto Const Mandatory

Event OnDying(Actor akKiller)
    debug.trace(self + "OnDying")
    Actor mySelf = Self.GetTargetActor()
      mySelf.AttachAshPile(PDLC04AnimatronicAlienAshpile)
EndEvent