Scriptname FXaddItemOnEffectScript extends ActiveMagicEffect
{used to add a death item when this script effect is active}

MiscObject[] Property miscItemsToAdd Auto Const
LeveledItem[] Property leveledItemsToAdd Auto Const

float property fChanceToSpawn = 100.0 auto const

actor mySelf

Event OnEffectStart(Actor akTarget, Actor akCaster)
	mySelf = akTarget
EndEvent

Event OnDeath(Actor akKiller)

	debug.trace(mySelf+" has died, adding items to corpse...")

	float fDiceRoll = utility.randomFloat(0.0,100.0)
	debug.trace("... "+fChanceToSpawn+"% odds, rolled a "+fDiceRoll+"...")

    if (fChanceToSpawn >= fDiceRoll)
		if miscItemsToAdd
	    	int i = 0
	    	while i < miscItemsToAdd.length
	    		mySelf.addItem(miscItemsToAdd[i])
		    	debug.trace("   ....adding "+miscItemsToAdd[i])
		    	i += 1
	    	endWhile
    	endif

    	if leveledItemsToAdd
	    	int i = 0
	    	while i < leveledItemsToAdd.length
	    		mySelf.addItem(leveledItemsToAdd[i])
		    	debug.trace("   ....adding "+leveledItemsToAdd[i])
		    	i += 1
	    	endWhile
	    endif
    endif
EndEvent