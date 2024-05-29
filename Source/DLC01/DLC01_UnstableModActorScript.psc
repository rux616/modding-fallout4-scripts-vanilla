Scriptname DLC01:DLC01_UnstableModActorScript extends Actor
{Script on Actors that support Unstable Mods (player-created robots). Handles Unstable Mod event registrations and cripple behaviors.}

;Struct representing the data needed to manage an Unstable Mod.
Struct UnstableModData
	DLC01:DLC01_UnstableModEffectScript UnstableModEffect 	;Unstable Mods apply an enchantment with an UnstableModEffectScript, which tracks whether the mod is on the robot.
	ActorValue UnstableModActorValue					;Actor Value that we cripple when this mod is destroyed. When crippled, we remove the mod's effects. 							
	float UnstableModBreakChance						;Whenever one of the UseAnimation events is received, the chance the mod breaks. Often very low.
	String UseNodeName								;Node on the actor to play an explosion effect at when the mod breaks.							
	String UseAnimationName01						;Named events that correspond to 'using' this mod. When received, we roll for cripple.
	String UseAnimationName02						; These are typically animation events, and we register for all of them. However, mods may call ModUsed, below,
	String UseAnimationName03						; to force a cripple roll directly for mod events that aren't tied to animations (when a spell is cast, etc.).
	Form AssociatedForm01							;Forms we remove when UnstableModActorValue is crippled, and restore when it's no longer crippled.
	Form AssociatedForm02
	Form AssociatedForm03
EndStruct

Group Autofill_Properties CollapsedOnRef
	Explosion property ElectricalExplosionSmall Auto Const Mandatory 		;Tiny, no-damage explosion when single mods break.
	Explosion property ExplosionMissileShellSmallSentry Auto Const Mandatory	;Modest explosion when several mods break.
	Explosion property FragGrenadeExplosion Auto Const Mandatory			;Large explosion when a lot of mods break.
EndGroup


;Local variables.
UnstableModData[] myModData			;UnstableModData for our mods.
bool isRegisteredForAnimationEvents	;Are we currently registered for animation events from our mods?


;Create myModData once and once only, when the robot is created.
Event OnInit()
	myModData = new UnstableModData[0]
EndEvent

;Called by each mod when it's added to the robot (DLC01_UnstableModEffectScript's OnEffectStart)
Function AddUnstableMod(UnstableModData data)
	if (data != None)
		int i = myModData.Find(data)
		if (i < 0)
			myModData.Add(data)			
		EndIf
	EndIf
EndFunction

;Called by each mod when it's removed from the robot (DLC01_UnstableModEffectScript's OnEffectFinish)
Function RemoveUnstableMod(DLC01:DLC01_UnstableModEffectScript unstableModEffect)
	int i = myModData.FindStruct("UnstableModEffect", unstableModEffect)
	if (i >= 0)
		UnstableModData data = myModData[i]
		myModData.Remove(i)
		if (isRegisteredForAnimationEvents)
			if (data.UseAnimationName01 != "")
				if (!IsAnotherModUsingThisAnimation(data.UseAnimationName01))
					Self.UnregisterForAnimationEvent(Self, data.UseAnimationName01)
				EndIf
			EndIf
			if (data.UseAnimationName02 != "")
				if (!IsAnotherModUsingThisAnimation(data.UseAnimationName02))
					Self.UnregisterForAnimationEvent(Self, data.UseAnimationName02)
				EndIf
			EndIf
			if (data.UseAnimationName03 != "")
				if (!IsAnotherModUsingThisAnimation(data.UseAnimationName03))
					Self.UnregisterForAnimationEvent(Self, data.UseAnimationName03)
				EndIf
			EndIf
		EndIf
	EndIf

	;Safety check: If we have no Unstable Mods left, we can unregister for all of our (animation) events.
	if (myModData.Length == 0)
		Self.UnregisterForAllEvents()
	EndIf
EndFunction


bool Function IsAnotherModUsingThisAnimation(String animationName)
	return ((myModData.FindStruct("UseAnimationName01", animationName) >= 0) || \
		   (myModData.FindStruct("UseAnimationName02", animationName) >= 0) || \
		   (myModData.FindStruct("UseAnimationName03", animationName) >= 0))
EndFunction


;Unstable Mods only break down during combat.
;We register for each mod's animation events when combat begins, and unregister when it ends.
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if ((aeCombatState == 1) && (!isRegisteredForAnimationEvents))
		;If we're in combat, and we haven't registered for our events, do so now.
		RegisterForAllModAnimationEvents()
		GoToState("Ready")
	ElseIf ((aeCombatState != 1) && (isRegisteredForAnimationEvents))
		;If we're no longer in combat, but we registered for our events, unregister.
		UnregisterForAllModAnimationEvents()
		GoToState("Inactive")
	EndIf
EndEvent

Function RegisterForAllModAnimationEvents()
	int i = 0
	While (i < myModData.Length)
		;Debug.Trace("-Registering " + i + " " + myModData[i])
		if (myModData[i].UseAnimationName01 != "")
			;Debug.Trace("--Registered for " + myModData[i].UseAnimationName01)
			Self.RegisterForAnimationEvent(Self, myModData[i].UseAnimationName01)
		EndIf
		if (myModData[i].UseAnimationName02 != "")
			;Debug.Trace("--Registered for " + myModData[i].UseAnimationName02)
			Self.RegisterForAnimationEvent(Self, myModData[i].UseAnimationName02)
		EndIf
		if (myModData[i].UseAnimationName03 != "")
			;Debug.Trace("--Registered for " + myModData[i].UseAnimationName03)
			Self.RegisterForAnimationEvent(Self, myModData[i].UseAnimationName03)
		EndIf
		i = i + 1
	EndWhile
	isRegisteredForAnimationEvents = True
	;Safety check: If we're already out of combat, make sure to unregister.
	if (Self.GetCombatState() != 1)
		UnregisterForAllModAnimationEvents()
	EndIf
EndFunction

Function UnregisterForAllModAnimationEvents()
	UnregisterForAllEvents()
	isRegisteredForAnimationEvents = False
	;No corresponding safety check here; if we're back in combat, don't re-register.
	;There's relatively little harm in missing a registration, but a lot if we don't
	;unregister at the correct time.
EndFunction


;Normal State when we're not in combat. All incoming events are ignored.
Auto State Inactive
	Event OnAnimationEvent(ObjectReference akSource, String asEventName)
	EndEvent

	Function ModUsed(String modName)
	EndFunction
EndState

;Normal state when we are in combat. Animation events and ModUsed calls may cripple mods.
;Ready/Busy states are used to prevent OnAnimationEvent calls from backing up.
State Ready
	;When we receive one of the mod animation events we've registered for, roll to see if
	;we should break the associated mod. And maybe some other mods, too.
	Event OnAnimationEvent(ObjectReference akSource, String asEventName)
		GoToState("Busy")
		;Debug.Trace("Received AnimEvent " + akSource + ", " + asEventName)
		int i = 0

		float RandomChance = Utility.RandomFloat(0, 100)
		debug.trace( self + "RandomChance = " + RandomChance)
		debug.trace( self + "UnstableModBreakChance = " + myModData[i].UnstableModBreakChance)
		debug.trace( self + "myModData.Length = " + myModData.Length)

		While (i < myModData.Length)
			;We need to check each element in the array to see if any of its animation
			;names match, and we want to process each only once, even if there are multiple
			;matches. Easier and cleaner to do a manual search than to use FindStruct here.
			if ((myModData[i].UseAnimationName01 == asEventName) || \
				(myModData[i].UseAnimationName02 == asEventName) || \
				(myModData[i].UseAnimationName03 == asEventName))
				;We've found a match. Notify the mod that one of its events has fired.
				myModData[i].UnstableModEffect.AnimationEventReceived()

				;Then decide if we should cripple the mod.
				if (Self.GetValue(myModData[i].UnstableModActorValue) <= 0)
					;Do nothing, it's already broken.
				ElseIf (RandomChance < (myModData[i].UnstableModBreakChance * myModData.Length))					
					;Unstable Mods break more often, and more severely, if there are multiple unstable mods on the robot.
					;NOTE: UnstableModBreakChance is a float from 0-100. It's being multiplied here by myModData.Length, which means
					;the chance of unstable mods breaking increases significantly if there are more unstable mods on the robot.

					;The current mod breaks...
					Self.DamageValue(myModData[i].UnstableModActorValue, 10000)
					int modsBroken = 1

					;...then, if there are more unstable mods on the robot, those might break as well.
					if (myModData.Length > 1)
						;How many of the remaining mods are unbroken?
						int modsRemaining
						UnstableModData[] breakableMods = new UnstableModData[0]
						int j = 0
						While (j < myModData.Length)
							;Debug.Trace("TESTING: " + myModData[j] + ", " + myModData[j].UnstableModActorValue)
							if (Self.GetValue(myModData[j].UnstableModActorValue) > 0)
								modsRemaining = modsRemaining + 1
								breakableMods.Add(myModData[j])
							EndIf
							j = j + 1
						EndWhile

						if (modsRemaining > 0)
							;If we can break more mods, decide how many we want to break.
							int modsToBreak = Utility.RandomInt(-1, modsRemaining)
							modsBroken = modsBroken + (Math.Max(modsToBreak, 0) as Int)
							While ((modsToBreak > 0) && (breakableMods.Length > 0))
								int break = Utility.RandomInt(0, breakableMods.Length - 1)
								Self.DamageValue(breakableMods[break].UnstableModActorValue, 10000)
								breakableMods.Remove(break)
								modsToBreak = modsToBreak - 1
							EndWhile
						EndIf
					EndIf

					;Then spawn the appropriate explosion effect.
					if (modsBroken == 1)
						Self.PlaceAtNode(myModData[i].UseNodeName, ElectricalExplosionSmall)
					ElseIf (modsBroken == 2)
						Self.PlaceAtNode(myModData[i].UseNodeName, ExplosionMissileShellSmallSentry)
					Else
						Self.PlaceAtNode(myModData[i].UseNodeName, FragGrenadeExplosion)
					EndIf
					;Debug.Trace("--BREAKS " + modsBroken)
				Else
					;Debug.Trace("--SAFE")
				EndIf
			EndIf
			i = i + 1
		EndWhile
		if (Self.GetCombatState() == 1)
			GoToState("Ready")
		Else
			GoToState("Inactive")
		EndIf
	EndEvent

	;Function called by some mods to trigger a cripple roll, when those mods have an obvious use event
	;that isn't animation-based (eg. a spell).
	Function ModUsed(String modName)
		OnAnimationEvent(Self, modName)
	EndFunction
EndState

;When we're processing an event, ignore any further events.
State Busy
	Event OnAnimationEvent(ObjectReference akSource, String asEventName)
	EndEvent

	Function ModUsed(String modName)
	EndFunction
EndState

Function ModUsed(String modName)
EndFunction




;When the Actor Value associated with the Unstable Mod is crippled (by this system or just normally),
;we remove any forms associated with the mod (spells, perks, etc.). When healed, we reinstate them.
Event OnCripple(ActorValue akActorValue, bool abCrippled)
	;Debug.Trace("Received Cripple " + akActorValue + ", " + abCrippled)
	int i = myModData.FindStruct("UnstableModActorValue", akActorValue, 0)
	While (i >= 0)
		if (abCrippled)
			Self.RemoveAssociatedForm(myModData[i].AssociatedForm01)
			Self.RemoveAssociatedForm(myModData[i].AssociatedForm02)
			Self.RemoveAssociatedForm(myModData[i].AssociatedForm03)
		Else
			Self.AddAssociatedForm(myModData[i].AssociatedForm01)
			Self.AddAssociatedForm(myModData[i].AssociatedForm02)
			Self.AddAssociatedForm(myModData[i].AssociatedForm03)
		EndIf
		i = i + 1
		if (i < myModData.Length)
			i = myModData.FindStruct("UnstableModActorValue", akActorValue, i)
		Else
			i = -1
		EndIf
	EndWhile
EndEvent

Function AddAssociatedForm(Form associatedForm)
	;Debug.Trace("- Adding form: " + associatedForm)
	if (associatedForm == None)
		return
	ElseIf (associatedForm is Spell)
		Self.AddSpell(associatedForm as Spell)
	ElseIf (associatedForm is Perk)
		Self.AddPerk(associatedForm as Perk)	
	Else
		Self.AddItem(associatedForm)
	EndIf
EndFunction

Function RemoveAssociatedForm(Form associatedForm)
	;Debug.Trace("- Removing form: " + associatedForm)
	if (associatedForm == None)
		return
	ElseIf (associatedForm is Spell)
		Self.RemoveSpell(associatedForm as Spell)
	ElseIf (associatedForm is Perk)
		Self.RemovePerk(associatedForm as Perk)			
	Else
		Self.RemoveItem(associatedForm)
	EndIf
EndFunction