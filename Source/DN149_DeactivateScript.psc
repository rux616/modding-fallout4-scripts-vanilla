Scriptname DN149_DeactivateScript extends ObjectReference Hidden Const

;Faction Property DN149_RobotFaction Auto Const

Keyword Property LinkCustom01 Auto Const


Function DN149_Deactivate()	
	 ObjectReference[] DN149_Robots = GetLinkedRefChain(LinkCustom01)
	    int i = 0
	    while (i < DN149_Robots.length)
	    	Actor RobotActor = DN149_Robots[i] as Actor
	    	RobotActor.Kill()
	    	i += 1
	    endwhile
endFunction

