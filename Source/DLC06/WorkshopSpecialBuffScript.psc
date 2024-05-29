Scriptname DLC06:WorkshopSpecialBuffScript extends ObjectReference

FormList property DLC06SpecialBuffs auto const mandatory
{ form list of spells to remove when new one is applied }

Spell property mySpell auto const mandatory 
{ spell to apply }

bool property bRequiresPower = false auto const 
{ TRUE = IsPowered must be true in order to get the buff }

bool property bWaitForSitting = false auto const 

auto state waiting
Event OnActivate(ObjectReference akActionRef)
    gotoState("busy")
    debug.trace(self + " Onactivate " + akActionRef)
    if akActionRef == Game.GetPlayer()
        if bRequiresPower == false || IsPowered()
        	actor player = Game.GetPlayer()
        	int i = 0
        	while i < DLC06SpecialBuffs.GetSize()
        		Spell spellToRemove = DLC06SpecialBuffs.GetAt(i) as Spell 
        		if spellToRemove && spellToRemove != mySpell
        			player.RemoveSpell(spellToRemove)
        		endif
        		i += 1
        	endWhile

            if bWaitForSitting
                int failsafeCount = 0
                while failsafeCount < 10 
                    debug.trace(self + " waiting for sit: GetSitState()=" + player.GetSitState() + " menumode=" + Utility.IsInMenuMode())
                    if player.GetSitState() == 3 && Utility.IsInMenuMode()
                        failsafeCount = 10
                    else
                        utility.WaitMenuMode(1.0)
                    endif
                    failsafeCount += 1
                endWhile
                debug.trace(self + " DONE waiting for sit: GetSitState()=" + player.GetSitState() + " menumode=" + Utility.IsInMenuMode())
                ; now wait for menu mode to end
                utility.wait(1.0)
            endif
        	; add new buff
            debug.trace(self + " adding spell " + mySpell)
        	player.AddSpell(mySpell)
        endif
    endif
    gotoState("waiting")
EndEvent
endState 

state busy
    Event OnActivate(ObjectReference akActionRef)
        debug.trace(self + " OnActivate - BUSY")
    endEvent
endState
