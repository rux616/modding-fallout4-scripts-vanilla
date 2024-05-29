;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSMarshal_00172298 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Remove all of the named NPCs-- use only the generic guys.
Alias_Maxson.ForceRefTo(Alias_Maxson_Alt.GetReference())
Alias_Kells.ForceRefTo(Alias_Kells_Alt.GetReference())
Alias_Danse.ForceRefTo(Alias_Danse_Alt.GetReference())
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
Alias_Neriah.ForceRefTo(Alias_Neriah_Alt.GetReference())
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
BoSM02.SetStage(30)
BoSM02.SetStage(401)
BoSM02.SetStage(500)
BoSM02Postquest.SetStage(20)
Alias_Gavil.ForceRefTo(Alias_Gavil_Real.GetReference())
Alias_Lucia.ForceRefTo(Alias_Lucia_Real.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Force Gavil, Lucia, and Clarke.
BoSM02.SetStage(30)
BoSM02.SetStage(401)
BoSM02.SetStage(500)
BoSM02Postquest.SetStage(10)
Alias_Clarke.ForceRefTo(Alias_Clarke_Real.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Force Brandis, Gavil, Lucia, and Clarke.
SetStage(1)
BoSM02.SetStage(30)
BoSM02.SetStage(401)
BoSM02.SetStage(500)
BoSM02Postquest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Move all of the aliased actors to the player.
Alias_Maxson.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Kells.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Danse.GetActorRef().MoveTo(Game.GetPlayer())
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
Alias_Neriah.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set up all the NPCs or their alternates.

;Maxson
Actor Maxson = Alias_Maxson_Real.GetActorRef()
ObjectReference MaxsonGun = Alias_MaxsonGun.GetReference()
if ((Maxson != None) && !Maxson.IsDead())
     Alias_Maxson.ForceRefTo(Maxson)
Else
     Alias_Maxson.ForceRefTo(Alias_Maxson_Alt.GetActorRef())
EndIf
if ((Maxson != None) && (!Maxson.IsDead()) && (MaxsonGun != None) && (Maxson.GetItemCount(MaxsonGun) > 0))
     BoSAliasLockerRef.AddItem(MaxsonGun)
EndIf
Alias_Maxson.TryToReset()
if ((Maxson != None) && (!Maxson.IsDead()) && (MaxsonGun != None) && (BoSAliasLockerRef.GetItemCount(MaxsonGun) > 0))
     Maxson.AddItem(AmmoFusionCore, 3)
     Maxson.AddItem(MaxsonGun)
EndIf
Alias_Maxson.TryToEnable()

;Danse
Actor Danse = Alias_Danse_Real.GetActorRef()
if ((Danse != None) && (!Danse.IsDead()) && (!Danse.IsDisabled()) && (!Danse.Is3DLoaded()) \
	&& (!Danse.IsInFaction(CurrentCompanionFaction)) && (BoS302.GetStage() == 0))
     Alias_Danse.ForceRefTo(Danse)
Else
     Alias_Danse.ForceRefTo(Alias_Danse_Alt.GetActorRef())
EndIf
Alias_Danse.TryToReset()
Alias_Danse.TryToEnable()

;Brandis
Actor Brandis = Alias_Brandis_Real.GetActorRef()
if (BoSM01Postquest.IsRunning() && (Brandis != None) && !Brandis.IsDead())
     Alias_Brandis.ForceRefTo(Brandis)
     Alias_Brandis.TryToReset()
     Brandis.SwitchToPowerArmor(BoSMarshal_BrandisPowerArmor)
Else
     Alias_Brandis.ForceRefTo(Alias_Brandis_Alt.GetActorRef())
     Alias_Brandis.TryToReset()
EndIf
Alias_Brandis.TryToEnable()

;Gavil
Actor Gavil = Alias_Gavil_Real.GetActorRef()
if ((BoSM02Postquest.IsRunning() || (PlayerBoS_KickedOut.GetValueInt() > 0)) \
	&& (BoSM02.GetStage() > 0) \
	&& (Gavil != None) && (!Gavil.IsDead()))
     Alias_Gavil.ForceRefTo(Gavil)
     Alias_Gavil.TryToReset()
     Gavil.SwitchToPowerArmor(BoSMarshal_GavilPowerArmor)
Else
     Alias_Gavil.ForceRefTo(Alias_Gavil_Alt.GetActorRef())
     Alias_Gavil.TryToReset()
EndIf
if ((PlayerBoS_KickedOut.GetValueInt() > 0) && (Alias_Gavil.GetActorRef() != Gavil))
     Gavil.Disable()
EndIf
Alias_Gavil.TryToEnable()

;Lucia
Actor Lucia = Alias_Lucia_Real.GetActorRef() 
if ((BoSM02Postquest.IsRunning() || (PlayerBoS_KickedOut.GetValueInt() > 0)) \
	&& (BoSM02.GetStage() > 0) \
	&& (Lucia != None) && (!Lucia.IsDead()))
     Alias_Lucia.ForceRefTo(Lucia)
     Alias_Lucia.TryToReset()
     Alias_Lucia.TryToEnable()
EndIf
if ((PlayerBoS_KickedOut.GetValueInt() > 0) && (Alias_Lucia.GetActorRef() != Lucia))
     Lucia.Disable()
EndIf

;Clarke
Actor Clarke = Alias_Clarke_Real.GetActorRef() 
if (((BoSM02Postquest.IsRunning() && (BoSM02Postquest.GetStage() < 20)) || (PlayerBoS_KickedOut.GetValueInt() > 0)) \
	&& (BoSM02.GetStage() > 0) \
	&& (Clarke != None) && (!Clarke.IsDead()))
	Alias_Clarke.ForceRefTo(Clarke)
	Alias_Clarke.TryToReset()
	Alias_Clarke.TryToEnable()
EndIf
if ((PlayerBoS_KickedOut.GetValueInt() > 0) && (BoSM02Postquest.GetStage() < 20) && (Alias_Clarke.GetActorRef() != Clarke))
     Clarke.Disable()
EndIf


;Fill the remaining aliases with their alternates if empty.
FillAliasIfNeeded(Alias_Kells, Alias_Kells_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Cade, Alias_Cade_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Ingram, Alias_Ingram_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Teagan, Alias_Teagan_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Quinlan, Alias_Quinlan_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Haylen, Alias_Haylen_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Rhys, Alias_Rhys_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Lucia, Alias_Lucia_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Clarke, Alias_Clarke_Alt.GetActorRef())
FillAliasIfNeeded(Alias_Neriah, Alias_Neriah_Alt.GetActorRef())

;Give combat outfits to Brandis, Rhys, and Clarke, since they don't have them on their base.
UpdateOutfitForActor(Alias_Brandis.GetActorRef(), Alias_Brandis_Real.GetActorRef(), BoSMarshal_BoSCombatArmorPaladinOutfitAll)
UpdateOutfitForActor(Alias_Rhys.GetActorRef(), Alias_Rhys_Real.GetActorRef(), BoSMarshal_BoSCombatArmorKnightOutfitAll)
UpdateOutfitForActor(Alias_Clarke.GetActorRef(), Alias_Clarke_Real.GetActorRef(), BoSMarshal_BoSCombatArmorKnightOutfitAll)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;If we're using the real Maxson, push him into Power Armor for Inst307Fight.
Actor Maxson = Alias_Maxson.GetActorRef()
if (Maxson == Alias_Maxson_Real.GetActorRef())
     Maxson.SwitchToPowerArmor(BoSMarshal_MaxsonPowerArmor)
EndIf

;Disable Li or Scara if the BoS recruited them in BoS301. They don't participate in the fight.
if (BoS301.GetStageDone(75) || BoS301.GetStageDone(76))
     Alias_MadisonLi_Real.GetActorRef().DisableNoWait()
EndIf
if (BoS301.GetStageDone(65))
     Alias_ProfessorScara_Real.GetActorRef().DisableNoWait()
EndIf

;For Inst307, remove the Essential and Protected flags from all actors except
;Maxson, who remains Protected (only).
RemoveProtection(Alias_Maxson.GetActorRef(), True)
RemoveProtection(Alias_Kells.GetActorRef())
RemoveProtection(Alias_Danse.GetActorRef())
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
RemoveProtection(Alias_Neriah.GetActorRef())

Alias_Maxson.TryToDisable()
Alias_Kells.TryToDisable()
Alias_Danse.TryToDisable()
Alias_Cade.TryToDisable()
Alias_Ingram.TryToDisable()
Alias_Teagan.TryToDisable()
Alias_Quinlan.TryToDisable()
Alias_Haylen.TryToDisable()
Alias_Rhys.TryToDisable()
Alias_Brandis.TryToDisable()
Alias_Gavil.TryToDisable()
Alias_Gavil_Real.TryToDisable()
Alias_Lucia.TryToDisable()
Alias_Clarke.TryToDisable()
Alias_Neriah.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Disable Li or Scara if the BoS recruited them in BoS301. They don't participate in the fight.
if (BoS301.GetStageDone(75) || BoS301.GetStageDone(76))
     Alias_MadisonLi_Real.GetActorRef().DisableNoWait()
EndIf
if (BoS301.GetStageDone(65))
     Alias_ProfessorScara_Real.GetActorRef().DisableNoWait()
EndIf

;For RR302, remove the Essential and Protected flags from all actors except
;Maxson and Danse, who remain Protected (only).
RemoveProtection(Alias_Maxson.GetActorRef(), True)
RemoveProtection(Alias_Kells.GetActorRef())
RemoveProtection(Alias_Danse.GetActorRef(), True)
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
RemoveProtection(Alias_Neriah.GetActorRef())

;TEMP: Just disable Danse.
Alias_Danse.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;For MQ302, remove the Protected and Essential flags from minor NPCs only.
RemoveProtection(Alias_Brandis.GetActorRef())
RemoveProtection(Alias_Gavil.GetActorRef())
RemoveProtection(Alias_Lucia.GetActorRef())
RemoveProtection(Alias_Clarke.GetActorRef())

;SetEssential on all named BoS NPCs
Alias_Maxson.GetActorRef().GetActorBase().SetEssential()
Alias_Kells.GetActorRef().GetActorBase().SetEssential()
Alias_Cade.GetActorRef().GetActorBase().SetEssential()
Alias_Ingram.GetActorRef().GetActorBase().SetEssential()
Alias_Teagan.GetActorRef().GetActorBase().SetEssential()
Alias_Quinlan.GetActorRef().GetActorBase().SetEssential()
Alias_Haylen.GetActorRef().GetActorBase().SetEssential()
Alias_Rhys.GetActorRef().GetActorBase().SetEssential()
Alias_Neriah.GetActorRef().GetActorBase().SetEssential()

Brandis_BoSKickout.Clear()
Gavil_BoSKickout.Clear()
Clarke_BoSKickout.Clear()
Lucia_BoSKickout.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;If we're using the real Maxson, push him into Power Armor for MinDestBoS.
Actor Maxson = Alias_Maxson.GetActorRef()
if (Maxson == Alias_Maxson_Real.GetActorRef())
     Maxson.SwitchToPowerArmor(BoSMarshal_MaxsonPowerArmor)
EndIf

;For the Minutemen, remove the Protected and Essential flags from minor NPCs only.
;;;RemoveProtection(Alias_Maxson.GetActorRef(), True)
;;;RemoveProtection(Alias_Kells.GetActorRef())
;;;RemoveProtection(Alias_Danse.GetActorRef())
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
RemoveProtection(Alias_Neriah.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;For Inst307, when the Prydwen is destroyed, disable and delete all of the actors.
CleanupActor(Alias_Maxson.GetActorRef(), True)
CleanupActor(Alias_Kells.GetActorRef(), True)
CleanupActor(Alias_Danse.GetActorRef(), True)
CleanupActor(Alias_Cade.GetActorRef(), True)
CleanupActor(Alias_Ingram.GetActorRef(), True)
CleanupActor(Alias_Teagan.GetActorRef(), True)
CleanupActor(Alias_Quinlan.GetActorRef(), True)
CleanupActor(Alias_Haylen.GetActorRef(), True)
CleanupActor(Alias_Rhys.GetActorRef(), True)
CleanupActor(Alias_Brandis.GetActorRef(), True)
CleanupActor(Alias_Gavil.GetActorRef(), True)
CleanupActor(Alias_Lucia.GetActorRef(), True)
CleanupActor(Alias_Clarke.GetActorRef(), True)
CleanupActor(Alias_Neriah.GetActorRef(), True)

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;For RR303, when the Prydwen is destroyed, disable and delete all of the actors.
CleanupActor(Alias_Maxson.GetActorRef(), True)
CleanupActor(Alias_Kells.GetActorRef(), True)
CleanupActor(Alias_Danse.GetActorRef(), True)
CleanupActor(Alias_Cade.GetActorRef(), True)
CleanupActor(Alias_Ingram.GetActorRef(), True)
CleanupActor(Alias_Teagan.GetActorRef(), True)
CleanupActor(Alias_Quinlan.GetActorRef(), True)
CleanupActor(Alias_Haylen.GetActorRef(), True)
CleanupActor(Alias_Rhys.GetActorRef(), True)
CleanupActor(Alias_Brandis.GetActorRef(), True)
CleanupActor(Alias_Gavil.GetActorRef(), True)
CleanupActor(Alias_Lucia.GetActorRef(), True)
CleanupActor(Alias_Clarke.GetActorRef(), True)
CleanupActor(Alias_Neriah.GetActorRef(), True)

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
;For MQ302, cleanup dead actors and return living actors to their editor locations.
;RevertActor(Alias_Maxson.GetActorRef()) ;Handled by MQ302.
RevertActor(Alias_Kells.GetActorRef())
;RevertActor(Alias_Danse.GetActorRef()) ;Could be player companion.
RevertActor(Alias_Cade.GetActorRef())
RevertActor(Alias_Ingram.GetActorRef())
RevertActor(Alias_Teagan.GetActorRef())
RevertActor(Alias_Quinlan.GetActorRef())
RevertActor(Alias_Haylen.GetActorRef())
RevertActor(Alias_Rhys.GetActorRef())
RevertActor(Alias_Brandis.GetActorRef())
RevertActor(Alias_Gavil.GetActorRef())
RevertActor(Alias_Lucia.GetActorRef())
RevertActor(Alias_Clarke.GetActorRef())
RevertActor(Alias_Neriah.GetActorRef())

;Reset Gavil, and Brandis to their pre-combat states.
Actor Gavil = Alias_Gavil.GetActorRef()
if (!Gavil.IsDead())
     Gavil.SwitchToPowerArmor(None)
     BoSMarshal_GavilPowerArmor.MoveToMyEditorLocation()
EndIf

;Brandis
Actor Brandis = Alias_Brandis.GetActorRef()
if (!Brandis.IsDead())
     Brandis.SwitchToPowerArmor(None)
     Brandis.MoveToMyEditorLocation()
EndIf

Brandis_BoSKickout.ForceRefTo(Alias_Brandis.getActorRef())
Gavil_BoSKickout.ForceRefTo(Alias_Gavil.getActorRef())
Clarke_BoSKickout.ForceRefTo(Alias_Clarke.getActorRef())
Lucia_BoSKickout.ForceRefTo(Alias_Lucia.getActorRef())

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;For MinDestBoS, at the moment, do nothing.
; - For any actors that aren't used in the attack on the castle, call CleanupActor
;   (see Stage 220 above) to disable and delete them. 

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN AUTOCAST TYPE BoSMarshalQuestScript
Quest __temp = self as Quest
BoSMarshalQuestScript kmyQuest = __temp as BoSMarshalQuestScript
;END AUTOCAST
;BEGIN CODE
;If the player is kicked out of the faction whose quest was using BoSMarshal, abort and shut down
;so a subsequent faction can restart this quest. BeginRevertingActors will stop the quest when done.
kMyQuest.BeginRevertingActors()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Function RevertActor(Actor a)
	if (a != None)
		if (!a.IsDead() && !a.IsDisabled())
			;Debug.Trace(a + " RESETS")
			a.GetActorBase().SetProtected(True)
			a.Reset()
			a.EvaluatePackage()
			a.MoveToMyEditorLocation()
			a.MoveToPackageLocation()
		Else
			a.Disable()
			a.Delete()
		EndIf
	EndIf
EndFunction

Function CleanupActor(Actor a, bool shouldDelete = False)
	if (a != None)
		a.Disable()
		if (shouldDelete)
			a.Delete()
		EndIf
	EndIf
EndFunction

Function RemoveProtection(Actor a, bool shouldBeProtected = False)
	a.SetRestrained(False)
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
	Else

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
ReferenceAlias Property Alias_Neriah Auto Const
ReferenceAlias Property Alias_Danse Auto Const

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
ReferenceAlias Property Alias_Neriah_Alt Auto Const
ReferenceAlias Property Alias_Danse_Alt Auto Const

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
ReferenceAlias Property Alias_Neriah_Real Auto Const
ReferenceAlias Property Alias_Danse_Real Auto Const

Quest Property BoS301 Auto Const
Quest Property BoS302 Auto Const
Quest Property BoSM02 Auto Const
Quest Property BoSM01Postquest Auto Const
Quest Property BoSM02Postquest Auto Const

ObjectReference Property BoSMarshal_GavilPowerArmor Auto Const
ObjectReference Property BoSMarshal_MaxsonPowerArmor Auto Const
ObjectReference Property BoSMarshal_BrandisPowerArmor Auto Const

GlobalVariable Property PlayerBoS_KickedOut Auto Const

Outfit Property BoSMarshal_BoSSoldierOutfit Auto Const
Outfit Property BoSMarshal_BoSCombatArmorKnightOutfitAll Auto Const
Outfit Property BoSMarshal_BoSCombatArmorPaladinOutfitAll Auto Const

Faction Property CurrentCompanionFaction Auto Const

ReferenceAlias Property Brandis_BoSKickout Auto Const
ReferenceAlias Property Gavil_BoSKickout Auto Const
ReferenceAlias Property Clarke_BoSKickout Auto Const
ReferenceAlias Property Lucia_BoSKickout Auto Const

ReferenceAlias Property Alias_MaxsonGun Auto Const
Ammo Property AmmoFusionCore Auto Const

Container Property BoSAliasLocker Auto Const

ObjectReference Property BoSAliasLockerRef Auto Const

ReferenceAlias Property Alias_MadisonLi_Real Auto Const

ReferenceAlias Property Alias_ProfessorScara_Real Auto Const
