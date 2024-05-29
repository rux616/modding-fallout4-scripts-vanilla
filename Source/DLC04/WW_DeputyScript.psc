Scriptname DLC04:WW_DeputyScript extends ReferenceAlias

Book Property Password Auto Const Mandatory

Event OnDeath(Actor akKiller)
    
    Game.GetPlayer().AddItem(Password)

EndEvent
