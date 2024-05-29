Scriptname DLC01:DLC01_AddFormsEffectScript extends ActiveMagicEffect
{A (very) general ActiveMagicEffect script that adds Perks, Spells, VisualEffects, Items, or Actor Values to an actor, and removes them when the effect ends.}
;
; - Many Unstable Mods do some combination of these things, so it made more sense to have one general script to do this than many specific ones.
; - OnEffectStart and OnEffectFinish call functions to handle adding and removing their forms so scripts that extend this one can also call those functions.

Form[] property FormsToAdd Auto Const
{Array of forms to add to the actor while the effect is active.}

ActorValueMod[] property ActorValuesToMod Auto
{Actor Values to modify when the effect starts, and restore when it ends.}

;Struct representing a change to an Actor Value.
Struct ActorValueMod
	ActorValue AV 			;The Actor Value to modify.
	float ValueToSetTo		;The value to set it to OnEffectStart.
	float ValueToClearTo	;The value to restore it to OnEffectFinish. (Automatically saved off during OnEffectStart.)
EndStruct


Event OnEffectStart(Actor akTarget, Actor akCaster)
	AddForms(akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	RemoveForms(akTarget)
EndEvent


Function AddForms(Actor akTarget)
	if (FormsToAdd != None)
		int i = 0
		While (i < FormsToAdd.Length)
			Form current = FormsToAdd[i]
			if (current == None)
				;Do nothing.
			ElseIf (current is Perk)
				akTarget.AddPerk(current as Perk)
			ElseIf (current is Spell)
				akTarget.AddSpell(current as Spell)
			ElseIf (current is VisualEffect)
				(current as VisualEffect).Play(akTarget)
			Else
				akTarget.AddItem(current)
			EndIf
			i = i + 1
		EndWhile
	EndIf
	if (ActorValuesToMod != None)
		int i = 0
		While (i < ActorValuesToMod.Length)
			if (ActorValuesToMod[i].ValueToClearTo == 0)
				ActorValuesToMod[i].ValueToClearTo = akTarget.GetValue(ActorValuesToMod[i].AV)
			EndIf
			akTarget.SetValue(ActorValuesToMod[i].AV, ActorValuesToMod[i].ValueToSetTo)
			i = i + 1
		EndWhile
	EndIf
EndFunction

Function RemoveForms(Actor akTarget)
	if (FormsToAdd != None)
		int i = 0
		While (i < FormsToAdd.Length)
			Form current = FormsToAdd[i]
			if (current == None)
				;Do nothing.
			ElseIf (current is Perk)
				akTarget.RemovePerk(current as Perk)
			ElseIf (current is Spell)
				akTarget.RemoveSpell(current as Spell)
			ElseIf (current is VisualEffect)
				(current as VisualEffect).Stop(akTarget)
			Else
				akTarget.RemoveItem(current)
			EndIf
			i = i + 1
		EndWhile
	EndIf
	if (ActorValuesToMod != None)
		int i = 0
		While (i < ActorValuesToMod.Length)
			akTarget.SetValue(ActorValuesToMod[i].AV, ActorValuesToMod[i].ValueToClearTo)
			i = i + 1
		EndWhile
	EndIf
EndFunction