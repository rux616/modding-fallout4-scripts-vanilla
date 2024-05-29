Scriptname DLC03:DLC03AcadiaDialogueScript extends Quest Conditional

Int Property DLC03AcadiaFlowersGiven Auto

Int Property DLC03AcadiaFaradayConfront Auto Conditional

GlobalVariable Property DLC03AcadiaFlowerPrice Auto Const Mandatory

Potion Property Aster Auto Const Mandatory



Function FlowerTurnIn()

int FlowerCount
int FlowerPayout

	FlowerCount=Game.GetPlayer().GetItemCount(Aster)
	FlowerPayout=FlowerCount*(DLC03AcadiaFlowerPrice.GetValueInt())
	Game.GetPlayer().RemoveItem(Aster, FlowerCount)
	Game.GetPlayer().AddItem(Caps001, FlowerPayout)

EndFunction
MiscObject Property Caps001 Auto Const Mandatory
