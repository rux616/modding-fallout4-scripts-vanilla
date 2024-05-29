Scriptname DLC01:DLC01_UnstableModEffectScript extends ActiveMagicEffect
{Script on Unstable Mod Enchantment Effects applied through the Object Mod system. Defines the properties of a specific Unstable Mod.}

Group Mod_Properties
	ActorValue property UnstableModActorValue Auto Const Mandatory
	{The Actor Value corresponding to the 'location' of this mod on the Actor (eg. RightAttackCondition for Right Arm). Crippling this condition will break the mod.}

	float property UnstableModBreakChance Auto Const Mandatory
	{Chance per animation event that this mod will break.}

	String property OverrideUseEventName Auto Const
	{OPTIONAL. If present, UnstableModActorScript will watch for this event name instead of the usual Race/AV-based animation events.}

	Form property AssociatedForm01 Auto
	{Form that needs to be removed via script when this mod breaks, if any. Often a Perk, Spell, etc.}

	Form property AssociatedForm02 Auto
	{Form that needs to be removed via script when this mod breaks, if any. Often a Perk, Spell, etc.}

	Form property AssociatedForm03 Auto
	{Form that needs to be removed via script when this mod breaks, if any. Often a Perk, Spell, etc.}
EndGroup

Group Autofill_Properties CollapsedOnRef
	DLC01:DLC01_UnstableModQuestScript property DLC01MasterQuest Auto Const Mandatory
EndGroup

;Local properties.
DLC01:DLC01_UnstableModActorScript:UnstableModData property myModData Auto Hidden
DLC01:DLC01_UnstableModActorScript property myUnstableModActor Auto Hidden


Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace(self + "OnEffectStart")
	myUnstableModActor = akTarget as DLC01:DLC01_UnstableModActorScript
	if (myUnstableModActor == None)
		Debug.Trace("ERROR: " + akTarget + " is missing DLC01:DLC01_UnstableModActorScript.", 2)
		return
	EndIf

	DLC01:DLC01_UnstableModQuestScript:UnstableModReferenceData myReferenceData = DLC01MasterQuest.GetReferenceData(myUnstableModActor.GetRace(), UnstableModActorValue)
	if (myReferenceData == None)
		Debug.Trace("ERROR: No reference data found for Unstable Mod " + Self + ".", 2)
		return
	EndIf

	;Assemble myModData from our properties and those of the associated reference data.
	myModData = new DLC01:DLC01_UnstableModActorScript:UnstableModData
	myModData.UnstableModEffect = Self
	myModData.UnstableModActorValue = UnstableModActorValue
	myModData.UnstableModBreakChance = UnstableModBreakChance
	myModData.AssociatedForm01 = AssociatedForm01
	myModData.AssociatedForm02 = AssociatedForm02
	myModData.AssociatedForm03 = AssociatedForm03
	myModData.UseNodeName = myReferenceData.UseNodeName
	if (OverrideUseEventName != "")
		myModData.UseAnimationName01 = OverrideUseEventName
	Else
		myModData.UseAnimationName01 = myReferenceData.UseAnimationName01
		myModData.UseAnimationName02 = myReferenceData.UseAnimationName02
		myModData.UseAnimationName03 = myReferenceData.UseAnimationName03
	EndIf

	;Check to make sure the effect is still active before adding it to the actor.
	if (Self.IsBoundGameObjectAvailable())
		myUnstableModActor.AddUnstableMod(myModData)
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	debug.trace(self + "OnEffectFinish")
	if (myUnstableModActor != None)
		myUnstableModActor.RemoveUnstableMod(Self)
	EndIf
EndEvent


Function AnimationEventReceived()
	;For most mods, we don't have anything to do here.
EndFunction