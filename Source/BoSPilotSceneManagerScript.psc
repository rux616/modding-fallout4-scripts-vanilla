Scriptname BoSPilotSceneManagerScript extends Quest Const

Struct SceneData

int Stage 
{When this stage is set, force LocalAlias into ExternalAlias and start ExternalScene}

ReferenceAlias LocalAlias 
{Alias in this quest that you want to force into the other quest that has the scene to play}

ReferenceAlias ExternalAlias 
{Alias in the other quest with the scene to play}

Scene ExternalScene 
{Scene to start in the other quest
NOTE: if you want to force more than one alias into the other quest before you start the scene, leave this blank except
for the last SceneData definition in the array.}

EndStruct

Struct VertibirdTakeDamageData

Keyword BoS_VBirdOnHit_DialogueSubtype
{AUTOFILL; keyword associated with Custom Player Dialogue Topic to say when HealthPercentage reached}

EndStruct


Group Properties
SceneData[] Property SceneDataSettings const auto


ReferenceAlias Property VertibirdAlias const auto
{Alias in this quest for the Vertibird}

ReferenceAlias Property PilotAlias const auto
{Alias in this quest for the Vertibird}

Keyword Property BoS_VBirdOnHit_DialogueSubtype const auto
{keyword associated with Custom Player Dialogue Topic to say when HealthPercentage reached
Conditionalize dialogue line for:
RUNON TARGET GetAVPercentage Health <= 25
}

Endgroup



Event OnQuestInit()
	RegisterForHitEvent(VertibirdAlias)

EndEvent

Event OnStageSet(int auiStageID, int auiItemID)
	Debug.Trace("This quest is running stage " + auiStageID + " item " + auiItemID)

	;look for stage in the array
	int i = 0
	while (i < SceneDataSettings.length)

	if SceneDataSettings[i].Stage == auiStageID

		SceneDataSettings[i].ExternalAlias.ForceRefTo(SceneDataSettings[i].LocalAlias.GetReference())
		SceneDataSettings[i].ExternalScene.Start()

	endif

  	i += 1
	endwhile
endEvent


Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	
	debug.trace("Ouch - I am Hit!")
	debug.trace("--" + VertibirdAlias.GetReference() + akTarget)
	
	objectReference vbirdRef = VertibirdAlias.GetReference()

	if akTarget == vbirdRef
		debug.trace(self + "OnHit() akTarget: " + akTarget)

		PilotAlias.GetActorReference().SayCustom(BoS_VBirdOnHit_DialogueSubtype, akTarget = vbirdRef)

	endif

	RegisterForHitEvent(VertibirdAlias)

EndEvent