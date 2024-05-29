Scriptname DLC03:DLC03V118BlockFollowerActivation extends ReferenceAlias

Event OnLoad()
	;When this alias loads, prevent the companion from activating it (set up the same as DefaultBlockFollowerActivation)
	Self.GetRef().SetNoFavorAllowed()
EndEvent