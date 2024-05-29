ScriptName DefaultBlockFollowerActivation extends ObjectReference Const Default
{Prevents followers from using this object.}

Event OnLoad()
	Self.SetNoFavorAllowed()
EndEvent