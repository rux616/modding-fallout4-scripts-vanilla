Scriptname DLC03:DLC03AtomM01EncounterAliasScript extends ReferenceAlias

Quest Property DLC03AtomM01 Auto Const Mandatory
{Used to manage turning off the NPC's}

ReferenceAlias Property SpringTrigger Auto Const Mandatory
{The trigger around the spring}

int Property iFailStage = 750 Auto Const
{Stage in DLC03AtomM01 where quest fails}

int Property iCompletionStage = 60 Auto Const
{Stage in DLC03AtomM01 where hallucinations should disappear}

int Property iFailSafeStage = 100 Auto Const
{Backup stage in DLC03AtomM01 where hallucinations should disappear}

Event OnAliasInit()
	;When alias inits, register for OnStageSet event on DLC03AtomM01 quest and effect ending 
	DLC03:DLC03AtomSpringScript myTrigger = (SpringTrigger.GetRef() as DLC03AtomSpringScript)
	RegisterforCustomEvent(myTrigger, "EffectExpired")
	RegisterforRemoteEvent(DLC03AtomM01, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)
	;If the player has failed or completed this stage of the quest, disable me and unregister for custom events
	if aksender == DLC03AtomM01 && (auiStageID == iFailStage || auiStageID == iCompletionStage || auiStageID == iFailSafeStage)
		GetRef().Disable(true)
	endif
EndEvent

Event DLC03:DLC03AtomSpringScript.EffectExpired(DLC03:DLC03AtomSpringScript akSender, Var[] akArgs)
	ObjectReference Obj = GetRef()

	if !Obj.IsDisabled()
		;If I'm not disabled when the effect wears off, disable me.
		Obj.Disable(true)
	endif
EndEvent