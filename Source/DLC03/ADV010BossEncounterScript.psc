Scriptname DLC03:ADV010BossEncounterScript extends ObjectReference Hidden

Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Keyword Property LinkCustom03 Auto Const
Keyword Property LinkCustom04 Auto Const
Keyword Property LinkCustom05 Auto Const

Event OnActivate(ObjectReference akActionRef)

    ObjectReference Door1 = GetLinkedRef(LinkCustom01)
    ObjectReference Door2 = GetLinkedRef(LinkCustom02)
    ObjectReference BossEnabler = GetLinkedRef(LinkCustom03)
    ObjectReference MinigunBoss = GetLinkedRef(LinkCustom04)
    ObjectReference Suicider = GetLinkedRef(LinkCustom05)

    BossEnabler.EnableNoWait()

    utility.Wait(1)

    Door1.SetAnimationVariableFloat("fvalue", 1)
    Door1.SetAnimationVariableFloat("fspeed", 2)
    Door1.PlayAnimation("Play01")

    Door2.SetAnimationVariableFloat("fvalue", 1)
    Door2.SetAnimationVariableFloat("fspeed", 1.5)
    Door2.PlayAnimation("Play01")

    (MinigunBoss as Actor).StartCombat(Game.GetPlayer())
    (Suicider as Actor).StartCombat(Game.GetPlayer())

EndEvent