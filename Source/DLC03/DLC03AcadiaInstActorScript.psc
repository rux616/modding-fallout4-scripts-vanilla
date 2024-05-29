Scriptname DLC03:DLC03AcadiaInstActorScript extends ReferenceAlias

Quest Property DLC03Acadia_Institute Auto Const Mandatory



Event OnEnterBleedout()

(DLC03Acadia_Institute as DLC03AcadiaInstituteQuestScript).UpdateAcadiaStatus(Self.GetRef() as Actor)

EndEvent