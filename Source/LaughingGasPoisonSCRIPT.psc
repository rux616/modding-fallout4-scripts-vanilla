Scriptname LaughingGasPoisonSCRIPT extends ActiveMagicEffect

ReferenceAlias property SpellTarget Auto
Scene property LaughingGas01 Auto
Scene property LaughingGas02 Auto
Keyword[] property LaughingKey Auto
VoiceType property LaughVoice01 Auto
VoiceType property LaughVoice02 Auto
INT keyRand

KEYWORD PROPERTY pAnimFaceArchetypeNeutral Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	INT faceRand
		
	;// Randomly choose one of the faces //;
	faceRand = utility.RandomInt(0, 2)

	;// apply that face //;
	IF(faceRand == 0)
	;akTarget.ChangeAnimFaceArchetype("LaughingGas")

	ELSEIF(faceRand == 1)
	;akTarget.ChangeAnimFaceArchetype("LaughingGas1")

	ELSEIF(faceRand == 2)
	;akTarget.ChangeAnimFaceArchetype("LaughingGas2")	

	ENDIF

	keyRand = utility.RandomInt(0, LaughingKey.length - 1)

	SpellTarget.ForceRefTo(akTarget)
	
	akTarget.AddKeyword(LaughingKey[keyRand])
	akTarget.AttemptAnimationSetSwitch()

	IF(akTarget.GetVoiceType() == LaughVoice01)
	LaughingGas01.Start()
	
	ELSEIF(akTarget.GetVoiceType() == LaughVoice02)
	LaughingGas02.Start()

	ENDIF

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.ChangeAnimFaceArchetype(pAnimFaceArchetypeNeutral)
	akTarget.RemoveKeyword(LaughingKey[keyRand])
	akTarget.AttemptAnimationSetSwitch()
EndEvent
