Scriptname DLC04:DLC04KickOutHandlerScript extends Quest

int Property ShutdownStage = 1500 Auto Const
DLC04KOQuestScript DLC04RaiderKickout

Event OnInit()
	DLC04RaiderKickOut = Game.GetFormFromFile(0x01027704, "DLCNukaWorld.esm") as DLC04KOQuestScript
    RegisterForCustomEvent(DLC04RaiderKickout, "DLC04KickOut")
EndEvent

Event DLC04:DLC04KOQuestScript.DLC04KickOut(DLC04KOQuestScript akSender, Var[] akArgs)
	SetStage(ShutdownStage)
EndEvent