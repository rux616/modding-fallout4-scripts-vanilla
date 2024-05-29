Scriptname DLC06:DLC06E03Script extends Quest

ReferenceAlias Property Alias_Workshop Auto Const mandatory

Component property c_NuclearMaterial auto const mandatory 

int property iNuclearMaterialTotal = 25 auto const 
{ how much the player needs }

int property iNuclearMaterialObjectiveID = 150 auto const 
{ objective for obtaining nuclear material }

int property iNuclearMaterialStage = 150 auto const 
{ stage to set when objective is complete }

function CheckForNuclearMaterial()
	debug.trace(self + " CheckForNuclearMaterial")
	ObjectReference workshopRef = Alias_workshop.GetRef()
	; if player/workshop already has enough nuclear material, do nothing
	int currentCount = Game.GetPlayer().GetComponentCount(c_NuclearMaterial)
	currentCount += workshopRef.GetComponentCount(c_NuclearMaterial)
	debug.trace(self + " 	currentCount=" + currentCount)

	if currentCount >= iNuclearMaterialTotal
		; set completed stage
		SetStage(iNuclearMaterialStage)
		UnregisterForRemoteEvent(workshopRef, "OnWorkshopObjectDestroyed")
	else 
		; display objective and watch for nuclear material to be scrapped
		SetObjectiveDisplayed(iNuclearMaterialObjectiveID)
		RegisterForRemoteEvent(workshopRef, "OnWorkshopObjectDestroyed")
	endif
endFunction

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSource, ObjectReference akActionRef)
	debug.trace(self + " akSource=" + akSource + " akActionRef=" + akActionRef)
;	if akActionRef.GetBaseObject() is MiscObject 
;		if (akActionRef.GetBaseObject() as MiscObject).GetObjectComponentCount(c_NuclearMaterial) > 0
			CheckForNuclearMaterial()
;		endif
;	endif
endEvent