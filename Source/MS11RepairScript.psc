Scriptname MS11RepairScript extends ObjectReference Hidden

Quest Property MS11 Auto Const
Int Property StageToSetWhenFixed Auto Const
Form Property ItemNeededForRepair Auto Const

Event OnActivate(ObjectReference akActionRef)
    If (Game.GetPlayer().GetItemCount(ItemNeededForRepair) > 0) && (MS11.GetStageDone(StageToSetWhenFixed) == 0)
    	MS11.SetStage(StageToSetWhenFixed)
    	PlayAnimation("Stage2")
    endif
EndEvent