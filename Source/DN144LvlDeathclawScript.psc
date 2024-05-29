Scriptname DN144LvlDeathclawScript extends Actor Hidden Conditional

Bool Property bShouldHide = False Auto Conditional

Location Property SalemLocation Auto Const

Event OnDeath(Actor akKiller)
    SalemLocation.SetCleared()
EndEvent
