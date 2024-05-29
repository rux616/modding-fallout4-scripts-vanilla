Scriptname DLC04:DLC04DismemberEffectScript extends activemagiceffect

int Property ChanceToDismember = 4 Auto Const
{chance to dismember a body part}

string[] Property BodyParts Auto Const Mandatory
{body parts that could be dismembered, will pick randomly between these if ChanceToDismember is rolled}

bool Property KillOnDismember = true Auto Const
{This almost most certainly should always be true}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Debug.Trace(self + "OnEffectStart akTarget: " + akTarget)

	if SuccessfulRoll(ChanceToDismember)
		Dismember(akTarget, GetBodyPart(), akCaster)
	endif

EndEvent

bool Function SuccessfulRoll(int Chance)
		Debug.Trace(self + "SuccessfulRoll() Chance: " + Chance)

		bool returnVal = false
		if Chance > 0
			int roll = Utility.RandomInt(1, 100)
			Debug.Trace(self + "SuccessfulRoll() roll: " + roll)

			if roll <= Chance
				Debug.Trace(self + "SuccessfulRoll() SUCCESS!!!")
				returnVal = True
			else
				Debug.Trace(self + "SuccessfulRoll() FAIL!!!")
			endif
		endif

		return returnVal
EndFunction


string Function GetBodyPart()
	
	int iMax = BodyParts.length - 1
	int roll = Utility.RandomInt(0, iMax) 

	string returnVal = BodyParts[roll]

	Debug.Trace(self + "GetBodyPart() iMax: " + iMax + ", roll: " + roll + ", returnVal: " + returnVal)

	return returnVal

EndFunction

Function Dismember(actor ActorToDismember, string BodyPart, actor Aggressor)
	Debug.Trace(self + "Dismember() ActorToDismember: " + ActorToDismember + ", BodyPart: " + BodyPart + ", Aggressor: " + Aggressor)
	ActorToDismember.Dismember(BodyPart, abForceDismember = true)

	if KillOnDismember
		Debug.Trace(self + "Dismember() KILLing ActorToDismember")
		ActorToDismember.Kill(akKiller = Aggressor)
	endif

EndFunction