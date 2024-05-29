Scriptname DN136_SynthProductionSCRIPT extends ObjectReference 

Quest Property DN136_Attack Auto Mandatory
Int Property myStage Auto Mandatory

Event onLoad()
    if(DN136_Attack.getStageDone(myStage))
    	self.PlayAnimation("StartOff01")
    endif
EndEvent