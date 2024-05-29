Scriptname DLC03:VR_ShootObjectAliasScript extends ReferenceAlias Const

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
    ; update packages on everybody
    (GetOwningQuest() as DLC03:VR_ShootObjectsQuestScript).EvaluatePackages()
EndEvent