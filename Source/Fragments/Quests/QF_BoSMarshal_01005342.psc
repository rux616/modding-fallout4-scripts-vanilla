;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSMarshal_01005342 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Remove all of the named NPCs-- use only the generic guys.
Alias_Maxson.ForceRefTo(Alias_Maxson_Alt.GetReference())
Alias_Kells.ForceRefTo(Alias_Kells_Alt.GetReference())
Alias_Cade.ForceRefTo(Alias_Cade_Alt.GetReference())
Alias_Ingram.ForceRefTo(Alias_Ingram_Alt.GetReference())
Alias_Teagan.ForceRefTo(Alias_Teagan_Alt.GetReference())
Alias_Quinlan.ForceRefTo(Alias_Quinlan_Alt.GetReference())
Alias_Haylen.ForceRefTo(Alias_Haylen_Alt.GetReference())
Alias_Rhys.ForceRefTo(Alias_Rhys_Alt.GetReference())
Alias_Brandis.ForceRefTo(Alias_Brandis_Alt.GetReference())
Alias_Gavil.ForceRefTo(Alias_Gavil_Alt.GetReference())
Alias_Lucia.ForceRefTo(Alias_Lucia_Alt.GetReference())
Alias_Clarke.ForceRefTo(Alias_Clarke_Alt.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Force Brandis.
BoSM01Postquest.Start()
Alias_Brandis.ForceRefTo(Alias_Brandis_Real.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Force Gavil and Lucia.
BoSM02Postquest.Start()
Alias_Gavil.ForceRefTo(Alias_Gavil_Real.GetReference())
Alias_Lucia.ForceRefTo(Alias_Lucia_Real.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Force Gavil, Lucia, and Clarke.
SetStage(2)
Alias_Clarke.ForceRefTo(Alias_Clarke_Real.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Move all of the aliased actors to the player.
Alias_Maxson.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Kells.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Cade.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Ingram.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Teagan.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Quinlan.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Haylen.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Rhys.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Brandis.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Gavil.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Lucia.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Clarke.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set up all the NPCs or their alternates.

;Maxson
Actor Maxson = Alias_Maxson_Real.GetActorRef()
Actor MaxsonNoncombat = Alias_Maxson_Noncombat.GetActorRef()
if ((Maxson != None) && !Maxson.IsDead() && (MaxsonNoncombat != None) && !MaxsonNoncombat.IsDead())
     Alias_Maxson.ForceRefTo(Maxson)
     Maxson.Enable()
     MaxsonNoncombat.Disable()
Else
     Alias_Maxson.ForceRefTo(Alias_Maxson_Alt.GetActorRef())
EndIf

;Brandis
Actor Brandis = Alias_Brandis_Real.GetActorRef()
Actor BrandisQuest = Alias_Brandis_Quest.GetActorRef()
Actor BrandisPostquest = Alias_Brandis_Postquest.GetActorRef()
if ((Brandis != None) && !Brandis.IsDead() && (BrandisQuest != None) && !BrandisQuest.IsDead() && (BrandisPostquest != None) && !BrandisPostquest.IsDead() && BoSM01Postquest.IsRunning())
     Alias_Brandis.ForceRefTo(Brandis)
     Brandis.Enable()
     BrandisQuest.Disable()
     BrandisPostquest.Disable()
Else
     Alias_Brandis.ForceRefTo(Alias_Brandis_Alt.GetActorRef())
EndIf

;Gavil, Lucia, Clarke
if (BoSM02Postquest.IsRunning())
     Actor Gavil = Alias_Gavil_Real.GetActorRef()
     if ((Gavil != None) && !Gavil.IsDead())
          Alias_Gavil.ForceRefTo(Gavil)
          Gavil.Enable()
     EndIf
     Actor Lucia = Alias_Lucia_Real.GetActorRef() 
     if ((Lucia != None) && !Lucia.IsDead())
          Alias_Lucia.ForceRefTo(Lucia)
          Lucia.Enable()
     EndIf
     Actor Clarke = Alias_Clarke_Real.GetActorRef() 
     if ((Clarke != None) && !Clarke.IsDead() && (BoSM02Postquest.GetStage() < 20))
          Alias_Clarke.ForceRefTo(Clarke)
          Clarke.Enable()
     EndIf
EndIf

;Fill the remaining aliases with their alternates if empty.
FillAliasIfNeeded(Alias_Kells, Alias_Kells_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Cade, Alias_Cade_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Ingram, Alias_Ingram_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Teagan, Alias_Teagan_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Quinlan, Alias_Quinlan_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Haylen, Alias_Haylen_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Rhys, Alias_Rhys_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Brandis, Alias_Brandis_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Gavil, Alias_Gavil_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Lucia, Alias_Lucia_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Clarke, Alias_Clarke_Alt.GetActorRef())

;Give combat outfits to Rhys and Clarke.
UpdateOutfitForActor(Alias_Rhys.GetActorRef(), Alias_Rhys_Real.GetActorRef(), BoSMarshal_BoSSoldierOutfit)
UpdateOutfitForActor(Alias_Clarke.GetActorRef(), Alias_Clarke_Real.GetActorRef(), BoSMarshal_BoSSoldierOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;For Inst307, remove the Essential and Protected flags from all actors except Maxson,
;who remains Protected (only).
RemoveProtection(Alias_Maxson.GetActorRef(), True)
RemoveProtection(Alias_Kells.GetActorRef())
RemoveProtection(Alias_Cade.GetActorRef())
RemoveProtection(Alias_Ingram.GetActorRef())
RemoveProtection(Alias_Teagan.GetActorRef())
RemoveProtection(Alias_Quinlan.GetActorRef())
RemoveProtection(Alias_Haylen.GetActorRef())
RemoveProtection(Alias_Rhys.GetActorRef())
RemoveProtection(Alias_Brandis.GetActorRef())
RemoveProtection(Alias_Gavil.GetActorRef())
RemoveProtection(Alias_Lucia.GetActorRef())
RemoveProtection(Alias_Clarke.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;For RR302, remove the Essential and Protected flags from all actors except Maxson,
;who remains Protected (only).
RemoveProtection(Alias_Maxson.GetActorRef(), True)
RemoveProtection(Alias_Kells.GetActorRef())
RemoveProtection(Alias_Cade.GetActorRef())
RemoveProtection(Alias_Ingram.GetActorRef())
RemoveProtection(Alias_Teagan.GetActorRef())
RemoveProtection(Alias_Quinlan.GetActorRef())
RemoveProtection(Alias_Haylen.GetActorRef())
RemoveProtection(Alias_Rhys.GetActorRef())
RemoveProtection(Alias_Brandis.GetActorRef())
RemoveProtection(Alias_Gavil.GetActorRef())
RemoveProtection(Alias_Lucia.GetActorRef())
RemoveProtection(Alias_Clarke.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
;For MQ302, remove the Protected and Essential flags from noncritical NPCs only.
;;;RemoveProtection(Alias_Maxson.GetActorRef(), True)
;;;RemoveProtection(Alias_Kells.GetActorRef())
;;;RemoveProtection(Alias_Cade.GetActorRef())
;;;RemoveProtection(Alias_Ingram.GetActorRef())
;;;RemoveProtection(Alias_Teagan.GetActorRef()
;;;RemoveProtection(Alias_Quinlan.GetActorRef())
RemoveProtection(Alias_Haylen.GetActorRef())
RemoveProtection(Alias_Rhys.GetActorRef())
RemoveProtection(Alias_Brandis.GetActorRef())
RemoveProtection(Alias_Gavil.GetActorRef())
RemoveProtection(Alias_Lucia.GetActorRef())
RemoveProtection(Alias_Clarke.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
;For the Minutemen, remove the Protected and Essential flags from noncritical NPCs only.
;;;RemoveProtection(Alias_Maxson.GetActorRef(), True)
;;;RemoveProtection(Alias_Kells.GetActorRef())
;;;RemoveProtection(Alias_Cade.GetActorRef())
;;;RemoveProtection(Alias_Ingram.GetActorRef())
;;;RemoveProtection(Alias_Teagan.GetActorRef()
;;;RemoveProtection(Alias_Quinlan.GetActorRef())
RemoveProtection(Alias_Haylen.GetActorRef())
RemoveProtection(Alias_Rhys.GetActorRef())
RemoveProtection(Alias_Brandis.GetActorRef())
RemoveProtection(Alias_Gavil.GetActorRef())
RemoveProtection(Alias_Lucia.GetActorRef())
RemoveProtection(Alias_Clarke.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;When the Prydwen is destroyed, disable and delete all of the named actors.
CleanupActor(Alias_Maxson.GetActorRef())
CleanupActor(Alias_Kells.GetActorRef())
CleanupActor(Alias_Cade.GetActorRef())
CleanupActor(Alias_Ingram.GetActorRef())
CleanupActor(Alias_Teagan.GetActorRef())
CleanupActor(Alias_Quinlan.GetActorRef())
CleanupActor(Alias_Haylen.GetActorRef())
CleanupActor(Alias_Rhys.GetActorRef())
CleanupActor(Alias_Brandis.GetActorRef())
CleanupActor(Alias_Gavil.GetActorRef())
CleanupActor(Alias_Lucia.GetActorRef())
CleanupActor(Alias_Clarke.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Cleanup dead actors. Return living actors to their editor locations.
ResetActor(Alias_Maxson.GetActorRef())
ResetActor(Alias_Kells.GetActorRef())
ResetActor(Alias_Cade.GetActorRef())
ResetActor(Alias_Ingram.GetActorRef())
ResetActor(Alias_Teagan.GetActorRef())
ResetActor(Alias_Quinlan.GetActorRef())
ResetActor(Alias_Haylen.GetActorRef())
ResetActor(Alias_Rhys.GetActorRef())
ResetActor(Alias_Brandis.GetActorRef())
ResetActor(Alias_Gavil.GetActorRef())
ResetActor(Alias_Lucia.GetActorRef())
ResetActor(Alias_Clarke.GetActorRef())

;Reset Maxson and Brandis to their pre-combat states.
;Maxson
Actor Maxson = Alias_Maxson_Real.GetActorRef()
Actor MaxsonNoncombat = Alias_Maxson_Noncombat.GetActorRef()
if (!Maxson.IsDead())
     MaxsonNoncombat.Enable()
     Maxson.Disable()
EndIf

;Brandis
Actor Brandis = Alias_Brandis_Real.GetActorRef()
Actor BrandisPostquest = Alias_Brandis_Postquest.GetActorRef()
if (!Brandis.IsDead())
     Brandis.Disable()
     BrandisPostquest.Enable()
EndIf

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Function ResetActor(Actor a)
	if (a != None)
		if (!a.IsDead() && !a.IsDisabled())
			Debug.Trace(a + " RESETS")
			a.GetActorBase().SetProtected(True)
			a.EvaluatePackage()
			a.MoveToMyEditorLocation()
			a.MoveToPackageLocation()
		Else
			a.Disable()
			a.Delete()
		EndIf
	EndIf
EndFunction

Function CleanupActor(Actor a)
	if (a != None)
		a.Disable()
		a.Delete()
	EndIf
EndFunction

Function RemoveProtection(Actor a, bool shouldBeProtected = False)
	ActorBase aBase = a.GetActorBase()
	aBase.SetEssential(False)
	if (shouldBeProtected)
		aBase.SetProtected(True)
	Else
		aBase.SetProtected(False)
	EndIf
EndFunction

Function FillAliasIfNeeded(ReferenceAlias aliasToFill, Actor a)
	Actor current = aliasToFill.GetActorRef()
	if ((current == None) || (current.IsDead()))
		aliasToFill.ForceRefTo(a)
	EndIf
	aliasToFill.TryToEnable()
EndFunction

Function UpdateOutfitForActor(Actor a1, Actor a2, Outfit newOutfit)
	if (a1 == a2)
		a1.SetOutfit(newOutfit)
	EndIf
EndFunction

ReferenceAlias Property Alias_Maxson Auto Const
ReferenceAlias Property Alias_Kells Auto Const
ReferenceAlias Property Alias_Cade Auto Const
ReferenceAlias Property Alias_Ingram Auto Const
ReferenceAlias Property Alias_Teagan Auto Const
ReferenceAlias Property Alias_Brandis Auto Const
ReferenceAlias Property Alias_Quinlan Auto Const
ReferenceAlias Property Alias_Haylen Auto Const
ReferenceAlias Property Alias_Rhys Auto Const
ReferenceAlias Property Alias_Gavil Auto Const
ReferenceAlias Property Alias_Lucia Auto Const
ReferenceAlias Property Alias_Clarke Auto Const
ReferenceAlias Property Alias_Malachi Auto Const
ReferenceAlias Property Alias_Neriah Auto Const

ReferenceAlias Property Alias_Maxson_Alt Auto Const
ReferenceAlias Property Alias_Kells_Alt Auto Const
ReferenceAlias Property Alias_Cade_Alt Auto Const
ReferenceAlias Property Alias_Ingram_Alt Auto Const
ReferenceAlias Property Alias_Teagan_Alt Auto Const
ReferenceAlias Property Alias_Quinlan_Alt Auto Const
ReferenceAlias Property Alias_Haylen_Alt Auto Const
ReferenceAlias Property Alias_Rhys_Alt Auto Const
ReferenceAlias Property Alias_Brandis_Alt Auto Const
ReferenceAlias Property Alias_Gavil_Alt Auto Const
ReferenceAlias Property Alias_Lucia_Alt Auto Const
ReferenceAlias Property Alias_Clarke_Alt Auto Const
ReferenceAlias Property Alias_Malachi_Alt Auto Const
ReferenceAlias Property Alias_Neriah_Alt Auto Const

ReferenceAlias Property Alias_Maxson_Real Auto Const
ReferenceAlias Property Alias_Maxson_Noncombat Auto Const
ReferenceAlias Property Alias_Kells_Real Auto Const
ReferenceAlias Property Alias_Cade_Real Auto Const
ReferenceAlias Property Alias_Ingram_Real Auto Const
ReferenceAlias Property Alias_Teagan_Real Auto Const
ReferenceAlias Property Alias_Quinlan_Real Auto Const
ReferenceAlias Property Alias_Haylen_Real Auto Const
ReferenceAlias Property Alias_Rhys_Real Auto Const
ReferenceAlias Property Alias_Brandis_Real Auto Const
ReferenceAlias Property Alias_Brandis_Postquest Auto Const
ReferenceAlias Property Alias_Brandis_Quest Auto Const
ReferenceAlias Property Alias_Gavil_Real Auto Const
ReferenceAlias Property Alias_Lucia_Real Auto Const
ReferenceAlias Property Alias_Clarke_Real Auto Const
ReferenceAlias Property Alias_Malachi_Real Auto Const
ReferenceAlias Property Alias_Neriah_Real Auto Const

Quest Property BoSM01Postquest Auto Const
Quest Property BoSM02Postquest Auto Const

Outfit Property BoSMarshal_BoSSoldierOutfit Auto Const
