Scriptname MS07aScript extends Quest Conditional

ReferenceAlias Property pEarlsBody Auto Const

Int Property iPlayerThreatenedCrocker Auto Conditional
Bool Property bEllieHeardNickShout Auto Conditional
Bool Property bSunKnowsAboutEarl Auto Conditional


Function DismemberEarl()

pEarlsBody.GetActorRef().Dismember("Head1", false, true)
pEarlsBody.GetActorRef().Dismember("LeftArm1", false, true)
pEarlsBody.GetActorRef().Dismember("LeftLeg1", false, true)
pEarlsBody.GetActorRef().Dismember("RightLeg1", false, true)

EndFunction