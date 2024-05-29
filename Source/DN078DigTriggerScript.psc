Scriptname DN078DigTriggerScript extends ObjectReference

ObjectReference dirtWall
faction property tunnelWorkerFaction auto 

Event OnInit()
    dirtwall = getLinkedRef()
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
     Actor Actronaut = akActionRef as Actor
     if Actronaut.isinfaction(tunnelWorkerFaction) == 1
     	utility.wait(3)
     	dirtWall.setOpen()
     endif
EndEvent