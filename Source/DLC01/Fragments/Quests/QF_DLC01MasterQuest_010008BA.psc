;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MasterQuest_010008BA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;---Runs on DLC01 Startup---

;Add DLC01 weapons to their respective formlists.
WeaponsRipperList.AddForm(DLC01MrHandyBuzzBlade)

;Add DLC01 projectiles to the trap formlists.
TrapExplOnHit.AddForm(DLC01LightningGunProjectile)
TrapExplOnHit.AddForm(DLC01LightningGunProjectileSizzle)
TrapExplOnHit.AddForm(DLC01LightningHazardProjectile)

;Set up faction relationships for DLC01.
DLC01MechanistFaction.SetAlly(CaptiveFaction, True, True)
DLC01MechanistFaction.SetAlly(PlayerFaction, True, True)
DLC01MechanistFaction.SetAlly(RobotFaction)
DLC01MechBotFaction.SetAlly(CaptiveFaction, True, True)
PlayerFaction.SetAlly(DLC01CaravanFaction)

;Prevent the player from renaming Codsworth, Curie, or Ada.
Alias_Codsworth.GetActorRef().AddKeyword(NoWorkbenchRenameKeyword)
Alias_Curie.GetActorRef().AddKeyword(NoWorkbenchRenameKeyword)
Alias_Ada.GetActorRef().AddKeyword(NoWorkbenchRenameKeyword)

;Allow the player to use Repair Kits on Codsworth, Curie, and Ada.
Alias_Codsworth.GetActorRef().AddKeyword(DLC01PlayerCanRepairKit)
Alias_Curie.GetActorRef().AddKeyword(DLC01PlayerCanRepairKit)
;This keyword is set on Ada's actor base.

;Prevent Codsworth, Curie, and Ada from disintegrating if they self-destruct.
Alias_Codsworth.GetActorRef().AddKeyword(robotNoDisintegrateOnSelfDestruct)
Alias_Curie.GetActorRef().AddKeyword(robotNoDisintegrateOnSelfDestruct)
;This keyword is set on Ada's actor base.

;Add Help Files
HelpManualPC.AddForm(DLC01HelpRobotWorkbenchPC)
HelpManualXBox.AddForm(DLC01HelpRobotWorkbenchXbox)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set on DLC01MQ02 Completion.
; - Allow the robot mods to spawn in the vendor chest. (Set ChanceNone to 0.)
DLC01_DN049VendorRobotMods_ChanceNone.SetValue(0)

; - Reset the chest so the mods will spawn. (This location doesn't normally reset.)
DN049_VendorChest_Outlet_Ref.Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set the associated global.
DLC01WorkshopSchematicResourceScanner_Global.SetValue(1)

;Display the associated notification.
DLC01WorkshopSchematicEyebotPod_Message.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Set the associated global.
DLC01WorkshopSchematicSpotlight_Global.SetValue(1)

;Display the associated notification.
DLC01WorkshopSchematicSpotlight_Message.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
;In this case, give the player the schematic.
Game.GetPlayer().AddItem(DLC01WorkshopSchematicWorkbench)

;No global to set; this recipe is conditioned based on a quest stage.

;Display the associated notification.
DLC01WorkshopSchematicWorkbench_Message.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CaptiveFaction Auto Const Mandatory

Faction Property RobotFaction Auto Const Mandatory

Faction Property DLC01MechanistFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Weapon Property DLC01MrHandyBuzzBlade Auto Const Mandatory

FormList Property WeaponsRipperList Auto Const Mandatory

ObjectReference Property DN049_VendorChest_Outlet_Ref Auto Const

GlobalVariable Property DLC01_DN049VendorRobotMods_ChanceNone Auto Const Mandatory

ReferenceAlias Property Alias_DLC01Mechanist Auto Const Mandatory

ReferenceAlias Property Alias_DLC01LairBossContainer Auto Const Mandatory

ObjectReference Property DLC01LairCC_MechanistArmorSpawnPoint Auto Const Mandatory

ObjectReference Property DLC01LairCC_MechanistHelmetSpawnPoint Auto Const Mandatory

Outfit Property DLC01MechanistOutfitArmor Auto Const Mandatory

GlobalVariable Property DLC01WorkshopSchematicResourceScanner_Global Auto Const Mandatory

GlobalVariable Property DLC01WorkshopSchematicSpotlight_Global Auto Const Mandatory

Message Property DLC01WorkshopSchematicEyebotPod_Message Auto Const Mandatory

Message Property DLC01WorkshopSchematicSpotlight_Message Auto Const Mandatory

ReferenceAlias Property Alias_Codsworth Auto Const Mandatory

ReferenceAlias Property Alias_Curie Auto Const Mandatory

ReferenceAlias Property Alias_Ada Auto Const Mandatory

Keyword Property NoWorkbenchRenameKeyword Auto Const Mandatory

FormList Property TrapExplOnHit Auto Const Mandatory

PROJECTILE Property DLC01LightningHazardProjectile Auto Const Mandatory

PROJECTILE Property DLC01LightningGunProjectile Auto Const Mandatory

PROJECTILE Property DLC01LightningGunProjectileSizzle Auto Const Mandatory

Message Property DLC01HelpRobotWorkbenchPC Auto Const Mandatory

Message Property DLC01HelpRobotWorkbenchXbox Auto Const Mandatory

FormList Property HelpManualPC Auto Const Mandatory

FormList Property HelpManualXBox Auto Const Mandatory

MiscObject Property DLC01WorkshopSchematicWorkbench Auto Const Mandatory

Message Property DLC01WorkshopSchematicWorkbench_Message Auto Const Mandatory

Keyword Property DLC01PlayerCanRepairKit Auto Const Mandatory

Keyword Property robotNoDisintegrateOnSelfDestruct Auto Const Mandatory

Faction Property DLC01MechBotFaction Auto Const Mandatory

Faction Property DLC01CaravanFaction Auto Const Mandatory
