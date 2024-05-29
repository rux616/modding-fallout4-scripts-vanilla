;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM02Postquest_000BDC04 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;If Clarke is alive, and the player covered for him, move him back to the supply depot.
Actor Clarke = Alias_BoSInitiateClarke.GetActorRef()
if (!Clarke.IsDead())
     Clarke.Enable()
     Clarke.ChangeAnimArchetype()
     Clarke.ChangeAnimFaceArchetype()
     Clarke.MoveToMyEditorLocation()
     Clarke.EvaluatePackage()
     Clarke.AddToFaction(BrotherhoodOfSteelFaction)
     BoSKickout_BoSInitiateClarke.ForceRefTo(Clarke)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;If Clarke is alive, and the player turned him in, move him to the Police Station.
Actor Clarke = Alias_BoSInitiateClarke.GetActorRef()
if (!Clarke.IsDead())
     ;Close his cell door and impossible-lock it.
     DN130_CambridgePDClarkeCellDoor.SetOpen(False)
     DN130_CambridgePDClarkeCellDoor.Lock()
     DN130_CambridgePDClarkeCellDoor.SetLockLevel(255)

     ;Enable sandbox markers in his cell.
     BoSM02Postquest_ClarkeCellEnableMarker.Enable()

     ;Move Clarke into the cell.
     Clarke.Enable()
     Clarke.ChangeAnimArchetype()
     Clarke.ChangeAnimFaceArchetype()
     Clarke.MoveTo(BoSM02ClarkeCellMarker)
     Clarke.RemoveAllItems()
     Clarke.SetValue(Aggression, 0)
     Clarke.SetValue(Confidence, 0)
     Clarke.EvaluatePackage()
     Clarke.AddToFaction(BrotherhoodOfSteelFaction)
     BoSKickout_BoSInitiateClarke.ForceRefTo(Clarke)

     ;Set Clarke as the owner of the bed, so he can sleep in it, but no one else will.
     BoSM02Postquest_ClarkeCellBed.SetActorOwner(Clarke.GetActorBase())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;If Clarke is alive, and the player told him to flee, disable him for now.
Actor Clarke = Alias_BoSInitiateClarke.GetActorRef()
if (!Clarke.IsDead())
     Clarke.Disable()
     Clarke.ChangeAnimArchetype()
     Clarke.ChangeAnimFaceArchetype()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Handling for the railroad attack on Cambridge PD (RR302).
Actor Clarke = Alias_BoSInitiateClarke.GetActorRef()

if (GetStageDone(20) && !Clarke.IsDead())
     ;Start the scene with Clarke begging to be released.
     BoSM02_Clarke_RRAttack.Start()

     ;Make sure Clarke is in his cell (just in case).
     Clarke.MoveTo(BoSM02ClarkeCellMarker)

     ;Close his cell door and novice-lock it.
     DN130_CambridgePDClarkeCellDoor.SetOpen(False)
     DN130_CambridgePDClarkeCellDoor.Lock()
     DN130_CambridgePDClarkeCellDoor.SetLockLevel(1)

     ;Set up the Lockup Terminal (it's novice locked).
     DN130_LockupTerminalRef_RR302Clarke.EnableNoWait()
     DN130_LockupTerminalRef_Normal.DisableNoWait()

     ;Remove Clarke from the BoS, though it probably doesn't matter at this point.
     Clarke.RemoveFromFaction(BrotherhoodOfSteelFaction)
     BoSKickout_BoSInitiateClarke.Clear()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
;Player unlocks Clarke's cell. Play his release scene.
BoSM02_Clarke_RRAttack.Stop()
BoSM02_Clarke_RRRelease.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0046_Item_00
Function Fragment_Stage_0046_Item_00()
;BEGIN CODE
;Once the release scene finished, EVP Clarke; he flees from the Police Station.
Alias_BoSInitiateClarke.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0049_Item_00
Function Fragment_Stage_0049_Item_00()
;BEGIN CODE
;Disable Clarke when he unloads.
Alias_BoSInitiateClarke.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Actor Clarke = Alias_BoSInitiateClarke.GetActorRef()
if (GetStageDone(20) && !Clarke.IsDead())
     ;Disable Clarke.
     Clarke.Disable()
EndIf

;Remove ownership from Clarke's bed.
BoSM02Postquest_ClarkeCellBed.SetActorOwner(None)

;Disable sandbox markers in his cell.
BoSM02Postquest_ClarkeCellEnableMarker.Disable()

;Update Lockup Terminal.
DN130_LockupTerminalRef_RR302Clarke.DisableNoWait()
DN130_LockupTerminalRef_Normal.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoSInitiateClarke Auto Const
ReferenceAlias Property BoSKickout_BoSInitiateClarke Auto Const

ObjectReference Property BoSM02ClarkeCellMarker Auto Const
ObjectReference Property BoSM02ClarkeSandboxMarker Auto Const
ObjectReference Property DN130_CambridgePDClarkeCellDoor Auto Const
ObjectReference Property DN130_LockupTerminalRef Auto Const

ActorValue Property Aggression Auto Const
ActorValue Property Confidence Auto Const

Scene Property BoSM02_Clarke_RRAttack Auto Const
Scene Property BoSM02_Clarke_RRRelease Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Keyword Property LinkTerminalDoor Auto Const

Quest Property DN130 Auto Const

ObjectReference Property DN130_LockupTerminalRef_RR302Clarke Auto Const

ObjectReference Property DN130_LockupTerminalRef_Normal Auto Const

ObjectReference Property BoSM02Postquest_ClarkeCellBed Auto Const Mandatory

ObjectReference Property BoSM02Postquest_ClarkeCellEnableMarker Auto Const Mandatory
