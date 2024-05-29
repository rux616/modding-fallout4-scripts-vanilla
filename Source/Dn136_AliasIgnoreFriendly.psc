Scriptname Dn136_AliasIgnoreFriendly extends ReferenceAlias
{script to set actor to Ignore Friendly Hits on load - for DN136_Attack}

Event OnLoad()
    Actor myActor = self.getActorRef()
    myActor.IgnoreFriendlyHits(TRUE)
EndEvent