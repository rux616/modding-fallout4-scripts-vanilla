Scriptname RoboticsExpertFrenzy extends ActiveMagicEffect

ActorValue property IgnorePlayerWhileFrenzied auto
ActorValue property Aggression auto
int property iPrevAggression auto hidden
int property iPrevConfidence auto hidden

Event OnEffectStart(Actor akTarget, Actor akCaster)

RegisterForRemoteEvent(akCaster as ObjectReference, "OnUnload")
akTarget.stopcombat()
iPrevAggression = akTarget.GetValue(Aggression) as int
iPrevConfidence = akTarget.GetValue(Game.GetConfidenceAV()) as int
akTarget.setValue(Aggression , 3)
akTarget.setValue(Game.GetConfidenceAV(), 4)
akTarget.setValue(IgnorePlayerWhileFrenzied, 1)

endEvent

Event ObjectReference.OnUnload(ObjectReference akSender)
self.Dispel()
(akSender as Actor).stopcombat()
akSender.SetValue(IgnorePlayerWhileFrenzied, 0)
akSender.setValue(Aggression, iPrevAggression)
akSender.setValue(Game.GetConfidenceAV(), iPrevConfidence)

endEvent