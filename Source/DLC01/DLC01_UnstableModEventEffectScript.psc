Scriptname DLC01:DLC01_UnstableModEventEffectScript extends ActiveMagicEffect
{When an Unstable Mod generates a magic effect with this script on it, this script finds the actor with the mod and notifies them it that the mod was 'used'.}

String property UseAnimationName01 Auto Const Mandatory
{Name of the event DLC01_UnstableModActorScript is waiting for.}

bool property userIsTarget Auto Const
{Default=False. Is the robot with the mod the Target or the Caster of this effect?}

Event OnEffectStart(Actor Target, Actor Caster)
	DLC01:DLC01_UnstableModActorScript unstableModActor
	if (userIsTarget)
		unstableModActor = Target as DLC01:DLC01_UnstableModActorScript
	Else
		unstableModActor = Caster as DLC01:DLC01_UnstableModActorScript
	EndIf
	if (unstableModActor == None)
		Debug.Trace("ERROR: Unable to find an UnstableModActor for " + Self + ", " + UseAnimationName01, 2)
	Else
		unstableModActor.ModUsed(UseAnimationName01)
	EndIf
EndEvent
