Scriptname DLC03:DLC03FarHarborFF02_PowerModuleScript extends ReferenceAlias
{Sets stage 200 when 3 power modules are picked up}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  ;declare variables
  Actor PlayerRef = Game.GetPlayer()
  MiscObject PowerModule = GetReference().GetBaseObject() as MiscObject
  int PowerModuleCount = PlayerRef.GetItemCount(PowerModule)
      debug.Trace("How many modules does the player have" + PowerModuleCount)
  if akNewContainer == PlayerRef && PowerModuleCount == 3
  	GetOwningQuest().SetStage(200)
  endIf
endEvent