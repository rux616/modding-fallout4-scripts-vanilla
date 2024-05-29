Scriptname DLC01:DLC01_UnstableModQuestScript extends Quest
{Script on DLC01MasterQuest. Holds hardcoded data used by the other Unstable Mod scripts (so they don't all have to keep duplicate copies).}

;Unfortunately, some robot animation names aren't standardized, so we need to maintain a lookup table to determine the names of
;some animation events (eg., what counds as 'moving' for each robot).
Struct UnstableModReferenceData
	Race RaceKey				;Key: Race
	ActorValue AVKey			;Key: Actor Value
	String UseNodeName			;Data: When a mod is destroyed, the node we play explosion effects at.
	String UseAnimationName01	;Data: Animation events that correspond to 'using' this mod. When received, we roll for cripple.
	String UseAnimationName02
	String UseAnimationName03
EndStruct

UnstableModReferenceData[] property UnstableModData Auto Const Mandatory
{Lookup table of mod reference data.}


UnstableModReferenceData Function GetReferenceData(Race kRace, ActorValue kValue)
	if (UnstableModData != None)
		int firstAVMatch = UnstableModData.FindStruct("AVKey", kValue)
		int i = firstAVMatch
		While (i >= 0)
			if (UnstableModData[i].RaceKey == kRace)
				return UnstableModData[i]
			Else
				i = UnstableModData.FindStruct("AVKey", kValue, i+1)
			EndIf
		EndWhile
		;If we couldn't find a match for this specific Race / Actor Value combination, return
		;the first match on the Actor Value (alone).
		if (firstAVMatch >= 0)
			return UnstableModData[firstAVMatch]
		EndIf
	EndIf
	return None
EndFunction