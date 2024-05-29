Scriptname REPrisonerScript extends ReferenceAlias

;This script pops a message box when activating the prisoner
;if player frees, adds captors, himself, and prisoner to factions to make people hate each other
;You should make sure elsewhere that the captors have aggression high enough to attack their enemies


Keyword Property RESharedDialoguePrisonerSetFree Auto const mandatory
Keyword Property AnimFlavorHandsBound Auto const mandatory

Message Property REPrisonerMessageBox Auto const
Faction Property REPrisonerFreedFaction Auto const

Faction Property REPrisonerFreedCombatCaptorFaction Auto const
Faction Property REPrisonerFreedCombatPrisonerFaction Auto const
Faction Property CaptiveFaction Auto const

RefCollectionAlias Property Captors Auto const
{ Try to get this from quest script REScript }

bool Property bUseRegisteredAliasesAsCaptors = false Auto const
{ if TRUE, will consider all registered aliases on quest's REScript as captors/prisoners for setting factions when prisoner is freed }
int Property CaptorGroupID = -1 Auto const
{ if > -1, this is the group ID that will look for in registered aliases when setting factions - should be Captors group 
  if == -1, all registered aliases will have their factions set }

int Property StageToSetWhenFreed = -1 auto const
{ this stage will be set when the prisoner is freed }
bool Property bSetStageOnlyIfPlayerFreed = true auto const
{ false is always set stage when prisoner is freed }

group CaptiveLocationData
	LocationAlias property CaptiveLocation auto const
	{ optional - when actor loads while in this location (and still a captive) will be snapped into the captive marker }

	ReferenceAlias property CaptiveMarker auto const
	{ optional - captive marker to snap prisoner to onLoad }
endGroup

bool bound = True

int iDoNothing = 0
int iSetFree = 1
int iSetFreeShareItems = 2

Event OnLoad()
	if bound
		GetActorReference().ChangeAnimFlavor(AnimFlavorHandsBound)
	EndIf
	RegisterForHitEvent(self, Game.GetPlayer())
	if CaptiveLocation && CaptiveMarker
		actor prisoner = GetActorRef()
		if prisoner && prisoner.GetCurrentLocation() == CaptiveLocation.GetLocation() && prisoner.IsInFaction(CaptiveFaction)
			prisoner.MoveTo(CaptiveMarker.GetRef())
			prisoner.SetRestrained(true)
		endif
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)

	if GetActorReference().IsDead() || GetActorReference().IsinCombat()
 		debug.trace(self + "OnActivate() IsDead() or IsInCombat() so not showing message box")	
	
	Elseif Bound == true	
 		debug.trace(self + "OnActivate() will call show message box")	
		Actor ActorRef = GetActorReference()

		int result = REPrisonerMessageBox.show()

		if result == iDoNothing
			debug.Notification("DO NOTHING")
			
		elseif result == iSetFree
			debug.Notification("SET FREE")	
			FreePrisoner(ActorRef, OpenInventory = False)
			
		elseif result == iSetFreeShareItems
			debug.Notification("SET FREE SHARE ITEMS")	
			FreePrisoner(ActorRef, OpenInventory = True)		
			
		EndIf
	
	EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
  	if AkAggressor == game.getPlayer()
		Game.GetPlayer().AddToFaction(REPrisonerFreedCombatPrisonerFaction)
		AddRemoveCaptorFaction(REPrisonerFreedCombatCaptorFaction)
	endif
	RegisterForHitEvent(self, Game.GetPlayer())
endEvent


Function FreePrisoner(Actor ActorRef, bool playerIsLiberator= true, bool OpenInventory = False)
 	debug.trace(self + "FreePrisoner(" + ActorRef + "," + playerIsLiberator + ", " + OpenInventory +")")	
	ActorRef.ChangeAnimFlavor()	
	ActorRef.RemoveFromFaction(CaptiveFaction)
	ActorRef.AddToFaction(REPrisonerFreedFaction)
	ActorRef.AddToFaction(REPrisonerFreedCombatPrisonerFaction)
	; in case at captive marker
	ActorRef.SetRestrained(false)

	ActorRef.EvaluatePackage()
	if playerIsLiberator
		Game.GetPlayer().AddToFaction(REPrisonerFreedCombatPrisonerFaction)
	EndIf
	
	if OpenInventory
		ActorRef.openInventory(True)
	EndIf
	
	ActorRef.SayCustom(RESharedDialoguePrisonerSetFree)
	bound = False

	AddRemoveCaptorFaction(REPrisonerFreedCombatCaptorFaction)
	
	if StageToSetWhenFreed > -1
		if playerIsLiberator || bSetStageOnlyIfPlayerFreed == false
			GetOwningQuest().SetStage(StageToSetWhenFreed)
		endif
	endif
	ActorRef.EvaluatePackage()
		
EndFunction

;call when quest shuts down
Function ClearFactions()

	Game.GetPlayer().RemoveFromFaction(REPrisonerFreedCombatPrisonerFaction)

	TryToRemoveFromFaction(CaptiveFaction)
	TryToRemoveFromFaction(REPrisonerFreedCombatCaptorFaction)
	
	AddRemoveCaptorFaction(REPrisonerFreedCombatCaptorFaction, false)
EndFunction

; function to add/remove faction from all captors
function AddRemoveCaptorFaction(Faction theFaction, bool bAddFaction = true)
	if Captors
		if bAddFaction
			Captors.AddToFaction(theFaction)
		else
			Captors.RemoveFromFaction(theFaction)
		endif
	EndIf
	; registered aliases?
	if bUseRegisteredAliasesAsCaptors
		; get RE quest script
		REScript myQuestScript = GetOwningQuest() as REScript
		if myQuestScript
			; get registered aliases
			if myQuestScript.registeredAliasCount > 0
				int i = 0
				while i < myQuestScript.registeredAliasCount
					REAliasScript theAlias = myQuestScript.RegisteredAliases[i] as REAliasScript
					if theAlias
						; if I'm in the captor group, OR we don't care about group ID, add to freed faction
						if (CaptorGroupID == -1 || theAlias.GroupIndex == CaptorGroupID) && theAlias.GetRef() != self.GetRef()
							if bAddFaction
								theAlias.TryToAddToFaction(theFaction)
							else
								theAlias.TryToRemoveFromFaction(theFaction)
							endif
						EndIf
					EndIf
					i += 1
				endWhile
			endif
			; get registered alias collections
			if myQuestScript.registeredRefCollectionCount > 0
				int i = 0
				while i < myQuestScript.registeredRefCollectionCount
					RECollectionAliasScript theCollection = myQuestScript.RegisteredCollectionAliases[i] as RECollectionAliasScript
					if theCollection
						; if I'm in the captor group, OR we don't care about group ID, add to freed faction
						if (CaptorGroupID == -1 || theCollection.GroupIndex == CaptorGroupID) && theCollection.Find(GetRef()) == -1
							if bAddFaction
								theCollection.AddToFaction(theFaction)
							else
								theCollection.RemoveFromFaction(theFaction)
							endif
						EndIf
					endif
					i += 1
				endWhile
			endif
		EndIf
	endif
EndFunction


