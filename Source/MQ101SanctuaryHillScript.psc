Scriptname MQ101SanctuaryHillScript extends Quest

ReferenceAlias Property VaultTecRep Auto

ObjectReference Property MQ101StreetSoldiersEnableMarker Auto
ObjectReference Property MQ101VertibirdAEnableMarker Auto
ObjectReference Property MQ101VertibirdBEnableMarker Auto
ObjectReference Property MQ101StreetNeighborsEnableMarker Auto
ObjectReference Property MQ101HillSoldiersEnableMarker Auto
ObjectReference Property MQ101VaultTecRepToVaultMarker Auto

;turn off everyone in the street, and now the player cannot cross the bridge again
Function PlayerCrossesBridge()
	MQ101HillSoldiersEnableMarker.DisableNoWait()

	MQ101StreetSoldiersEnableMarker.EnableNoWait()
	MQ101VertibirdAEnableMarker.EnableNoWait()
	MQ101VertibirdBEnableMarker.EnableNoWait()
	MQ101StreetNeighborsEnableMarker.EnableNoWait()

	Actor myVaultTecRep = VaultTecRep.GetActorRef()
	myVaultTecRep.ChangeAnimFlavor()
	myVaultTecRep.EvaluatePackage()
	myVaultTecRep.MoveTo(MQ101VaultTecRepToVaultMarker)
	myVaultTecRep.EnableNoWait()
EndFunction