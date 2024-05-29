Scriptname DN102_LabDemoEffectScript extends ActiveMagicEffect
{Script on the DN102_LabDemo magic effects. Forces affected actors into an alias so they can play a reaction scene.}

Scene property DN102_LabDemoAffectedEnemyScene Auto Const Mandatory
{Scene to play when an actor is affected by this magic effect.}

ReferenceAlias property DN102_LabDemoAffectedEnemy Auto Const Mandatory
{Force the actor into this alias for the scene.}

bool property shouldKillAtEndOfEffect = False Auto Const
{Should we kill the enemy when the effect ends? Default: False}

LocationRefType property DN102_LabDemoEnemyRefType Auto Const Mandatory
{Used as a safety check for shouldKillAtEndOfEffect. Only kill enemies with this ref type.}


Event OnEffectStart(Actor akTarget, Actor akCaster)
	;Debug.Trace("Effect started on " + akTarget)
	if (!DN102_LabDemoAffectedEnemyScene.IsPlaying())
		;Debug.Trace("Force Ref To: " + akTarget)
		DN102_LabDemoAffectedEnemy.ForceRefTo(akTarget)
		DN102_LabDemoAffectedEnemyScene.Start()
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if (shouldKillAtEndOfEffect && akTarget.HasRefType(DN102_LabDemoEnemyRefType))
		akTarget.Kill()
	EndIf
EndEvent
