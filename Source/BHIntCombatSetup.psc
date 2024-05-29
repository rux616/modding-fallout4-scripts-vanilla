Scriptname BHIntCombatSetup extends ObjectReference 

Faction Property BunkerHillBoSFaction Auto Const   
Faction Property BunkerHillRRFaction Auto Const 
Faction Property BunkerHillInstituteFaction Auto Const 
Faction Property PlayerFaction Auto Const


;BOS Soldier Keyword
Keyword Property LinkCustom01 Auto Const

;RR Merc Keyword
Keyword Property LinkCustom02 Auto Const

;Turret Keyword
Keyword Property LinkCustom03 Auto Const

GlobalVariable Property BHIntCombatDoonce Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    Debug.trace(self+" Triggered in Bunker Hill")

	if ((akActionRef == Game.GetPlayer()) && (BHIntCombatDoonce.GetValue() == 0))

        BHIntCombatDoonce.SetValue(1.0)

        BunkerHillBoSFaction.SetEnemy(BunkerHillRRFaction) 
        BunkerHillBoSFaction.SetEnemy(BunkerHillInstituteFaction) 
        BunkerHillRRFaction.SetEnemy(BunkerHillInstituteFaction)
        BunkerHillRRFaction.SetEnemy(PlayerFaction) 

        LoadBattle()
    
    endif


EndEvent

function LoadBattle()

    ObjectReference[] BOS = GetLinkedRefChain(LinkCustom01)
    int i = 0
    while (i < BOS.length)
        Actor BOSActor = BOS[i] as Actor
        BOSActor.enable()
        BOSActor.setGhost()
        i += 1
    endwhile

    ObjectReference[] RRMerc = GetLinkedRefChain(LinkCustom02)
    i = 0
    while (i < RRMerc.length)
        Actor RRMercActor = RRMerc[i] as Actor
        RRMercActor.enable()
        RRMercActor.setGhost()
        i += 1
    endwhile

    ObjectReference[] Turret = GetLinkedRefChain(LinkCustom03)
    i = 0
    while (i < Turret.length)
        Actor TurretActor = Turret[i] as Actor
        TurretActor.enable()
        TurretActor.setGhost()
        i +=1
    endwhile

endFunction


