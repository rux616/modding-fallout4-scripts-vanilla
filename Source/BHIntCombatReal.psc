Scriptname BHIntCombatReal extends ObjectReference

;BOS Soldier Keyword
Keyword Property LinkCustom01 Auto Const

;RR Merc Keyword
Keyword Property LinkCustom02 Auto Const

;Turret Keyword
Keyword Property LinkCustom03 Auto Const

;Synth Keyword
Keyword Property LinkCustom04 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    Debug.trace(self+" Triggered")

	if akActionRef == Game.GetPlayer() 
	    ObjectReference[] BOS = GetLinkedRefChain(LinkCustom01)
	    int i = 0
	    while (i < BOS.length)
	    	Actor BOSActor = BOS[i] as Actor
	    	BOSActor.setGhost(false)
	    	if (i==0)
	    		debug.trace(BOSActor + "lower health")
	    		;BOSActor.SetValue( Game.GetHealthAV(), 7 )
	    	;else
	    	;	BOSActor.SetValue(game.getHealthAV(), 5)
	    	endif
	    	i += 1
	    endwhile

	    ObjectReference[] RRMerc = GetLinkedRefChain(LinkCustom02)
	    i = 0
	    while (i < RRMerc.length)
	    	Actor RRMercActor = RRMerc[i] as Actor
	    	RRMercActor.setGhost(False)
	    	i += 1
	    endwhile

	    ObjectReference[] Turret = GetLinkedRefChain(LinkCustom03)
	    i = 0
	    while (i < Turret.length)
	    	Actor TurretActor = Turret[i] as Actor
	    	TurretActor.setGhost(false)
	    	i +=1
	    endwhile
    	
    	ObjectReference[] Synths = GetLinkedRefChain(LinkCustom04)
    	i = 0
    	utility.wait(5.0)
    	while (i < Synths.Length)
    		
    		float randtime = utility.randomfloat(0.1, 0.5)
    		utility.wait(randtime)			
    		Synths[i].enable()
    		i += 1

    	endwhile

    	Delete()
    endif

EndEvent



