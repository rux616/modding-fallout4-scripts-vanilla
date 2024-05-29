;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN084_0006D646 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Call the main quickstart.
SetStage(0)

;Start the BoS path.
BoSKickout.SetStage(10)
BoS303.SetStage(10)
BoS303.SetStage(15)
BoS303.SetStage(20)
BoS303.SetStage(30)
BoS303.SetStage(35)
SetStage(11)

;The player is a member of the Brotherhood.
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)

;Force Ingram as your quest companion.
Actor Ingram = Alias_DN084_QuestCompanion_Ingram.GetActorRef()
Alias_DN084_QuestCompanion.ForceRefTo(Ingram)
Ingram.Enable()

;Set up Cait as your companion.
Actor Cait = Alias_DN084_CompanionCait.GetActorRef()
(Followers as FollowersScript).SendCompanionChangeEvent(Cait, True)
Companion.ForceRefTo(Cait)
Cait.Enable()
Cait.EvaluatePackage()

;Warp to the roof of Mass Fusion
Game.GetPlayer().MoveTo(DN084_BoS303QuickstartMarker)
Ingram.MoveTo(DN084_BoS303CompanionQuickstartMarker)
Cait.MoveTo(DN084_BoS303CompanionQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Call the main quickstart.
SetStage(0)

;Start the Inst path.
SetStage(12)
InstMassFusion.SetStage(10)
InstMassFusion.SetStage(15)
InstMassFusion.SetStage(20)
InstMassFusion.SetStage(30)

;Add player to Institute and kick from BoS.
Game.GetPlayer().AddToFaction(InstituteFaction)
BoSKickout.SetStage(30)

;Force Filmore as your quest companion.
Alias_DN084_QuestCompanion.ForceRefTo(Alias_DN084_QuestCompanion_Filmore.GetActorRef())

;Set up X6 as your companion.
Actor X6 = Alias_DN084_CompanionX688.GetActorRef()
(Followers as FollowersScript).SendCompanionChangeEvent(X6, True)
Companion.ForceRefTo(X6)
X6.Enable()
X6.EvaluatePackage()

;Move the player to the roof with Filmore.
;InstMassFusion stage 30 takes care of this.
Utility.Wait(2)
X6.MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Call the main quickstart.
SetStage(0)

;Set prior stages.
BoSKickout.SetStage(10)
BoS303.SetStage(10)
BoS303.SetStage(15)
BoS303.SetStage(20)
BoS303.SetStage(30)
BoS303.SetStage(35)
BoS303.SetStage(40)
BoS303.SetStage(50)
BoS303.SetStage(60)
BoS303.SetStage(70)
SetStage(11)
SetStage(20)
Setstage(100)
Setstage(110)
Setstage(120)
Game.GetPlayer().AddItem(Alias_DN084_ExecutiveIDCard.GetReference())
DN084_ElevatorLoadActive.SetValue(1)
DN084_DescentFloor.SetValue(22)

;The player is a member of the Brotherhood.
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)

;Force Ingram as your quest companion.
Actor Ingram = Alias_DN084_QuestCompanion_Ingram.GetActorRef()
Alias_DN084_QuestCompanion.ForceRefTo(Ingram)
Ingram.Enable()
Ingram.MoveTo(Game.GetPlayer())

;Set up Cait as your companion.
Actor Cait = Alias_DN084_CompanionCait.GetActorRef()
(Followers as FollowersScript).SendCompanionChangeEvent(Cait, True)
Companion.ForceRefTo(Cait)
Cait.Enable()
Cait.MoveTo(Game.GetPlayer())
Cait.EvaluatePackage()
Utility.Wait(2)

;Where is the player starting?
if (!GetStageDone(9))
     Game.GetPlayer().MoveTo(DN084_DescentQuickstartMarker)
Else
     Game.GetPlayer().MoveTo(BoS303TempNPC01Marker)
EndIf

;Start the Descent.
;Reminder: This quickstart does Not Work in MassFusion01 due to elevator timing issues.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Call the main quickstart.
SetStage(0)

;Set prior stages.
InstMassFusion.SetStage(10)
InstMassFusion.SetStage(15)
InstMassFusion.SetStage(20)
InstMassFusion.SetStage(40)
InstMassFusion.SetStage(50)
InstMassFusion.SetStage(60)
InstMassFusion.SetStage(70)
SetStage(12)
SetStage(20)
Setstage(100)
Setstage(110)
Setstage(120)
Game.GetPlayer().AddItem(Alias_DN084_ExecutiveIDCard.GetReference())
DN084_ElevatorLoadActive.SetValue(1)
DN084_DescentFloor.SetValue(22)

;Add player to Institute and kick from BoS.
Game.GetPlayer().AddToFaction(InstituteFaction)
BoSKickout.SetStage(30)

;Force Filmore as your quest companion.
Actor Filmore = Alias_DN084_QuestCompanion_Filmore.GetActorRef()
Alias_DN084_QuestCompanion.ForceRefTo(Filmore)
Filmore.Enable()
Filmore.EvaluatePackage()
Filmore.MoveTo(Game.GetPlayer())
Utility.Wait(2)

;Set up X6 as your companion.
Actor X6 = Alias_DN084_CompanionX688.GetActorRef()
(Followers as FollowersScript).SendCompanionChangeEvent(X6, True)
Companion.ForceRefTo(X6)
X6.Enable()
X6.EvaluatePackage()

;Where is the player starting?
if (!GetStageDone(9))
     Game.GetPlayer().MoveTo(DN084_DescentQuickstartMarker)
Else
     Game.GetPlayer().MoveTo(BoS303TempNPC01Marker)
EndIf

;Start the Descent.
if (Game.GetPlayer().GetParentCell() == MassFusion01)
     if (DN084_InteriorGlassElevator1.IsActiveElevator)
          DN084_InteriorGlassElevator1.OnCellAttach()
     Else
          DN084_InteriorGlassElevator2.OnCellAttach()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Call the main quickstart.
SetStage(0)

;Set prior stages.
BoSKickout.SetStage(10)
BoS303.SetStage(10)
BoS303.SetStage(15)
BoS303.SetStage(20)
BoS303.SetStage(30)
BoS303.SetStage(35)
BoS303.SetStage(40)
BoS303.SetStage(50)
BoS303.SetStage(60)
BoS303.SetStage(70)
BoS303.SetStage(80)
BoS303.SetStage(90)
BoS303.SetStage(100)
SetStage(11)
SetStage(20)
Setstage(100)
Setstage(110)
Setstage(120)
Setstage(200)
Setstage(220)
Setstage(260)
Setstage(280)
Game.GetPlayer().AddItem(Alias_DN084_ExecutiveIDCard.GetReference())

;The player is a member of the Brotherhood.
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)

;Force Ingram as your quest companion.
Actor Ingram = Alias_DN084_QuestCompanion_Ingram.GetActorRef()
Alias_DN084_QuestCompanion.ForceRefTo(Ingram)
Ingram.Enable()

;Set up Cait as your companion.
Actor Cait = Alias_DN084_CompanionCait.GetActorRef()
(Followers as FollowersScript).SendCompanionChangeEvent(Cait, True)
Companion.ForceRefTo(Cait)
Cait.Enable()
Cait.EvaluatePackage()

;Move to the Labs quickstart marker.
Game.GetPlayer().MoveTo(DN084_LabQuickstartMarker)
Ingram.MoveTo(DN084_LabQuickstartMarker)
Cait.MoveTo(DN084_LabQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Call the main quickstart.
SetStage(0)

;Set prior stages.
InstMassFusion.SetStage(10)
InstMassFusion.SetStage(15)
InstMassFusion.SetStage(20)
InstMassFusion.SetStage(40)
InstMassFusion.SetStage(50)
InstMassFusion.SetStage(60)
InstMassFusion.SetStage(70)
InstMassFusion.SetStage(80)
InstMassFusion.SetStage(90)
InstMassFusion.SetStage(100)
SetStage(12)
SetStage(20)
Setstage(100)
Setstage(110)
Setstage(120)
Setstage(200)
Setstage(220)
Setstage(260)
Setstage(280)
Game.GetPlayer().AddItem(Alias_DN084_ExecutiveIDCard.GetReference())

;Add player to Institute and kick from BoS.
Game.GetPlayer().AddToFaction(InstituteFaction)
BoSKickout.SetStage(30)

;Force Filmore as your quest companion.
Actor Filmore = Alias_DN084_QuestCompanion_Filmore.GetActorRef()
Alias_DN084_QuestCompanion.ForceRefTo(Filmore)

;Set up X6 as your companion.
Actor X6 = Alias_DN084_CompanionX688.GetActorRef()
(Followers as FollowersScript).SendCompanionChangeEvent(X6, True)
Companion.ForceRefTo(X6)
X6.Enable()
X6.EvaluatePackage()

;Move to the Labs quickstart marker.
Game.GetPlayer().MoveTo(DN084_LabQuickstartMarker)
Filmore.MoveTo(DN084_LabQuickstartMarker)
X6.MoveTo(DN084_LabQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Call the main quickstart.
SetStage(0)

;Set prior stages.
BoSKickout.SetStage(10)
BoS303.SetStage(10)
BoS303.SetStage(15)
BoS303.SetStage(20)
BoS303.SetStage(30)
BoS303.SetStage(35)
BoS303.SetStage(40)
BoS303.SetStage(50)
BoS303.SetStage(60)
BoS303.SetStage(70)
BoS303.SetStage(80)
BoS303.SetStage(90)
BoS303.SetStage(100)
BoS303.SetStage(120)
BoS303.SetStage(130)
BoS303.SetStage(140)
BoS303.SetStage(150)
BoS303.SetStage(160)
BoS303.SetStage(170)
SetStage(11)
SetStage(20)
Setstage(100)
Setstage(110)
Setstage(120)
Setstage(200)
Setstage(220)
Setstage(260)
Setstage(280)
Setstage(290)
Setstage(300)
Setstage(310)
Setstage(320)
Setstage(360)
Setstage(390)
Setstage(399)
Game.GetPlayer().AddItem(Alias_DN084_ExecutiveIDCard.GetReference())
Game.GetPlayer().AddItem(Alias_DN084_BerylliumAgitator.GetReference())
DN084_ReactorLabSecurityDoor.SetOpenNoWait(True)

;The player is a member of the Brotherhood.
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)

;Force Ingram as your quest companion.
Actor Ingram = Alias_DN084_QuestCompanion_Ingram.GetActorRef()
Alias_DN084_QuestCompanion.ForceRefTo(Ingram)
Ingram.Enable()

;Set up Cait as your companion.
Actor Cait = Alias_DN084_CompanionCait.GetActorRef()
(Followers as FollowersScript).SendCompanionChangeEvent(Cait, True)
Companion.ForceRefTo(Cait)
Cait.Enable()
Cait.EvaluatePackage()

;Move to the Final Battle Quickstart marker.
Game.GetPlayer().MoveTo(DN084_FinalBattleQuickstartMarker)
Ingram.MoveTo(DN084_FinalBattleQuickstartMarker)
Cait.MoveTo(DN084_FinalBattleQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Call the main quickstart.
SetStage(0)

;Set prior stages.
InstMassFusion.SetStage(10)
InstMassFusion.SetStage(15)
InstMassFusion.SetStage(20)
InstMassFusion.SetStage(40)
InstMassFusion.SetStage(50)
InstMassFusion.SetStage(60)
InstMassFusion.SetStage(70)
InstMassFusion.SetStage(80)
InstMassFusion.SetStage(90)
InstMassFusion.SetStage(100)
InstMassFusion.SetStage(120)
InstMassFusion.SetStage(130)
InstMassFusion.SetStage(140)
InstMassFusion.SetStage(150)
InstMassFusion.SetStage(160)
InstMassFusion.SetStage(170)
SetStage(12)
SetStage(20)
Setstage(100)
Setstage(110)
Setstage(120)
Setstage(200)
Setstage(220)
Setstage(260)
Setstage(280)
Setstage(290)
Setstage(300)
Setstage(310)
Setstage(320)
Setstage(360)
Setstage(390)
Setstage(399)
Game.GetPlayer().AddItem(Alias_DN084_ExecutiveIDCard.GetReference())
Game.GetPlayer().AddItem(Alias_DN084_BerylliumAgitator.GetReference())
DN084_ReactorLabSecurityDoor.SetOpenNoWait(True)

;Add player to Institute and kick from BoS.
Game.GetPlayer().AddToFaction(InstituteFaction)
BoSKickout.SetStage(30)

;Force Filmore as your quest companion.
Actor Filmore = Alias_DN084_QuestCompanion_Filmore.GetActorRef()
Alias_DN084_QuestCompanion.ForceRefTo(Filmore)

;Set up X6 as your companion.
Actor X6 = Alias_DN084_CompanionX688.GetActorRef()
(Followers as FollowersScript).SendCompanionChangeEvent(X6, True)
Companion.ForceRefTo(X6)
X6.Enable()
X6.EvaluatePackage()

;Move to the Final Battle Quickstart marker.
Game.GetPlayer().MoveTo(DN084_FinalBattleQuickstartMarker)
Filmore.MoveTo(DN084_FinalBattleQuickstartMarker)
X6.MoveTo(DN084_FinalBattleQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
;Temporary quickstart to the midlevel encounter, or whatever else requires testing.
DN084_InteriorGlassElevator1.isMidlevelQuickstart = True
DN084_InteriorGlassElevator2.isMidlevelQuickstart = True
SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Startup Stage: Triggers regardless of faction when the player commits to BoS303/Inst303 or
;teleports to the roof during MQ302.
;No need to set this stage directly. Setting 11, 12, or 13 automatically sets it.

;Reset MassFusion01
MassFusionLocation.Reset()

;Start the Overrides quest.
DN084_Overrides.Start()

;Enable the map marker on the roof.
MassFusionBuildingRoofMapMarkerRef.Enable()

;Enable the Sentry Bot on the Reactor Level.
;He isn't initially enabled (or enabled any earlier) so the dungeon can be cleared pre-quest.
int i = 0
Debug.Trace("EnemyGroup02 Enabling Count " + Alias_DN084_MR_EnemyGroup02_ControlRoom.GetCount())
While (i < Alias_DN084_MR_EnemyGroup02_ControlRoom.GetCount())
     Debug.Trace("EnemyGroup02 Enabling " + Self + ", " + i)
     Alias_DN084_MR_EnemyGroup02_ControlRoom.GetAt(i).EnableNoWait()
     i = i + 1
EndWhile


;If the player is here for BoS303/Inst303, disable the Gunners and their traps inside.
if (!GetStageDone(13))
     ;Disable the prequest encounters.
     i = 0
     While (i < Alias_DN084_PrequestEncounterMarkers.GetCount())
          Alias_DN084_PrequestEncounterMarkers.GetAt(i).Disable()
          i = i + 1
     EndWhile
     i = 0
     While (i < Alias_DN084_PrequestEncounterTriggers.GetCount())
          Alias_DN084_PrequestEncounterTriggers.GetAt(i).Disable()
          i = i + 1
     EndWhile

     ;Disable the prequest traps.
     DN084_PrequestTrapsDisableMarker.Disable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Startup - Player has committed to BoS303.
;Set this stage when the player has committed to BoS303 and is in transit there.

;Disable the Prequest encounters. (Handled by Stage 10, which gets set automatically)

;Enable the roof encounters.
DN084_BoS303_RoofEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
;Startup - Player has committed to Inst303.
;Set this stage when the player has committed to Inst303 and is in transit there.

;Disable the Prequest encounters. (Handled by Stage 10, which gets set automatically)

;Stop Allie Filmore's intro dialogue.
DialogueInstitute.SetStage(20)

;Enable the roof encounters.
DN084_Inst303_RoofEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
;Kickout - Player has been kicked from the Brotherhood during BoS303.
;This stage acts as a flag where necessary, and also handles some minor cleanup.

;Remove the quest companion.
Alias_DN084_QuestCompanion.Clear()

;Disable the 'Agitator not Available' trigger, since we can no longer respond to it.
DN084_BerylliumAgitatorNotAvailableActivatorRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
;Kickout - Player has been kicked from the Institute during Inst303.
;This stage acts as a flag where necessary, and also handles some minor cleanup.

;Remove the quest companion.
Alias_DN084_QuestCompanion.Clear()

;Disable the 'Agitator not Available' trigger, since we can no longer respond to it.
DN084_BerylliumAgitatorNotAvailableActivatorRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Startup - Handles an edge case: The player has completed MQ302 (presumably with the Minutemen)
;without first completing Mass Fusion. This stage is set during the escape from the Institute.

;Re-enable the Gunners (if previously disabled by Stage 10) so the building isn't empty.
if (!GetStageDone(20))
     ;Re-enable the prequest encounters.
     int i = 0
     While (i < Alias_DN084_PrequestEncounterTriggers.GetCount())
          Alias_DN084_PrequestEncounterTriggers.GetAt(i).Enable()
          i = i + 1
     EndWhile

     ;Enable the prequest traps.
     DN084_PrequestTrapsDisableMarker.Enable()
EndIf

;Put the dungeon into its Postquest state, which should disable any other enemies.
SetStage(500)

;Disable the 'Agitator not Available' trigger, since we can no longer respond to it.
DN084_BerylliumAgitatorNotAvailableActivatorRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
;When the player enters the office with the Freefall Boots, add them to the safe.
DN084_FreefallSafe.AddItem(DN084_LL_Armor_Freefall_BothLegs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player hits a trigger on the Mass Fusion roof.
;Player has jumped down onto the roof from the Vertibird (BoS) or been teleported there (Inst)

;BoS: Disable the 'Jump from the Vertibird' tutorial message, if it was visible.
if (GetStageDone(11))
     Tutorial.SetStage(2405)
EndIf

;Make sure the elevators are in position.
DN084_ExteriorGlassElevator1.ReadyElevator()
DN084_ExteriorGlassElevator2.ReadyElevator()

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(40)
     ;Disable Fast Travel from the Mass Fusion Roof
     DN084_DisableFastTravelTriggerRef.Enable()
Else
     InstMassFusion.SetStage(40)
     ;Disable Fast Travel from the Mass Fusion Roof
     DN084_DisableFastTravelTriggerRef.Enable()
EndIf

;Enable the triggers for the lower-level enemies.
if (GetStageDone(500))
     ;Do nothing.
Else
     DN084_QuestLowerEnableMarker.Enable()
DEBUG.TRACE("DN084 is DISABLING " +  DN084_QuestLowerDisableMarker)
     DN084_QuestLowerDisableMarker.Disable()
     if ((GetStageDone(11)))
          DN084_BoS303_LowerEncEnableMarker5F.Enable()
          DN084_BoS303_LowerEncEnableMarker3F.Enable()
          DN084_BoS303_LowerEncEnableMarker2F.Enable()
          DN084_BoS303_LowerEncEnableMarker1F.Enable()
     Else
          DN084_Inst303_LowerEncEnableMarker5F.Enable()
          DN084_Inst303_LowerEncEnableMarker3F.Enable()
          DN084_Inst303_LowerEncEnableMarker2F.Enable()
          DN084_Inst303_LowerEncEnableMarker1F.Enable()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player tries to use the executive elevator without the keycard.

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303_Z01_ElevatorNoCode.Start()
ElseIf (GetStageDone(12))
     InstMassFusion_Z01_ElevatorNoCode.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Switch the Quest Companion to the 'Near' follow distance to keep them with the player.
Actor questCompanionAct = Alias_DN084_QuestCompanion.GetActorRef()
if (questCompanionAct != None)
     questCompanionAct.FollowerSetDistanceNear()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player enters the Agitator development lab.

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(50)
ElseIf (GetStageDone(12))
     InstMassFusion.SetStage(50)
EndIf

;Switch the Quest Companion back to the 'Medium' follow distance.
Actor questCompanionAct = Alias_DN084_QuestCompanion.GetActorRef()
if (questCompanionAct != None)
     questCompanionAct.FollowerSetDistanceMedium()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player has read the entry about the Agitator on the CEO's terminal.

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(60)
ElseIf (GetStageDone(12))
     InstMassFusion.SetStage(60)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player has taken the Executive ID Card.

;Play player voice scene if no quest companion is present.
if (Alias_DN084_QuestCompanion.GetActorRef() == None)
     DN084_Player_00_FindKeycard.Start()
EndIf

;Open the Reactor Lab exterior security door, so hacking the terminal is no longer required.
DN084_ReactorLabSecurityDoor.SetOpenNoWait(True)

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(70)
ElseIf (GetStageDone(12))
     InstMassFusion.SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE dn084_questscript
Quest __temp = self as Quest
dn084_questscript kmyQuest = __temp as dn084_questscript
;END AUTOCAST
;BEGIN CODE
;BoS303 / Inst303: Once inside, start the Descent Sequence.
;This stage is set by the elevator itself (DN084_GlassElevatorScript), and will not be set
;in the postquest or post-M302 states.

;Unlock the descent sequence doors.
kmyQuest.UpdateDescentDoors(True)

;Enable Fast Travel from the Mass Fusion Roof from this point forward.
DN084_DisableFastTravelTriggerRef.Disable()
(DN084_DisableFastTravelTriggerRef as DN084_DisableFastTravelTriggerScript).FastTravelFailsafe()

;Enable the enemies.
if (GetStageDone(11))
     DN084_BoS303_DescentEnableMarker.Enable()
ElseIf (GetStageDone(12))
     DN084_Inst303_DescentEnableMarker.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player hits a trigger on 20F.
;The first enemy in the descent sequence has just emerged and is about to fire.

;Make absolutely sure that door opens. (Sometimes it's late, or never opens at all.)
DN084_DescentFirstDoor.SetOpen(True)

;Update the quest.
if (GetStageDone(11))
     BoS303.SetStage(80)
ElseIf (GetStageDone(12))
     InstMassFusion.SetStage(80)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player hits a trigger on 10F.
;The elevator nears the midlevel lobby. An enemy yells out to stop it - kill the power.

if (GetStageDone(11))
     DN084_Stage220_SynthsKillPower.Start()
ElseIf (GetStageDone(12))
     DN084_Stage220_BoSKillsPower.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Called from the Descent Kill Power scene.

;Enable the char in the Generator Room.
DN084_DescentGeneratorRoomChar.Enable()

;Kill the power with the appropriate visual and sound effects.
DN084_GeneratorRoomExplosionSource.PlaceAtMe(GeneratorExplosion)
Utility.Wait(0.5)
;Trigger the Stinger music activator.
DN084_MassFusionPowerStopStinger.Activate(DN084_MassFusionPowerStopStinger)
Utility.Wait(1)
QSTMassFusionPowerDown.Play(DN084_QSTMassFusionPowerSoundSource)
DN084_DescentEnableOffLightsMarker.Enable()
DN084_DescentDisablePowerCloseMarker.Disable()
Utility.Wait(1)
DN084_DescentDisablePowerMidrangeMarker.Disable()
Utility.Wait(1)
DN084_DescentDisablePowerFarMarker.Disable()
Utility.Wait(1)

;Force the circuit breaker to the Off position.
DN084_GeneratorRoomCircuitBreaker.LockToOnPosition = False
DN084_GeneratorRoomCircuitBreaker.HandleSwitch(Game.GetPlayer())

;Disable the elevator on 5F, which also loses power.
(DN084_5FElevatorMaster as ElevatorMasterScript).MakeElevatorNonfunctional()

;Turn off the call buttons (keycard readers) on the first floor.
(DN084_InteriorGlassElevator1.myCallButton as IDCardReaderScript).StartGreen()
(DN084_InteriorGlassElevator2.myCallButton as IDCardReaderScript).StartGreen()

;Allow the Kill Power scene to finish.
SetStage(226)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0227_Item_00
Function Fragment_Stage_0227_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Called from the Descent Kill Power scene.

;The next time the circuit breaker is activated, lock it on.
DN084_GeneratorRoomCircuitBreaker.LockToOnPosition = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0228_Item_00
Function Fragment_Stage_0228_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Set as the elevator approaches the ambush zone.

;Prepare for the Midlevel Ambush.
if (GetStageDone(12))
     ;Institute: Enable Power Armor guy to rush forward and fall. Enable everyone else holding position.
     DN084_Inst303_DescentAmbushEnableMarker.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0229_Item_00
Function Fragment_Stage_0229_Item_00()
;BEGIN AUTOCAST TYPE dn084_questscript
Quest __temp = self as Quest
dn084_questscript kmyQuest = __temp as dn084_questscript
;END AUTOCAST
;BEGIN CODE
;BoS303 / Inst303: Elevator jerks to a stop. Companion says something very brief about the power.

;Turn off the Descent Music Override
kmyQuest.RemoveMusicOverride()

;Stagger the player.
Game.GetPlayer().PlaceAtMe(DN084_ElevatorStaggerExplosion)

;Update the quest.
if (GetStageDone(11) && !GetStageDone(13) && !GetStageDone(260) && !GetStageDone(270))
     BoS303.SetStage(90)
ElseIf (GetStageDone(12) && !GetStageDone(14) && !GetStageDone(260) && !GetStageDone(270))
     InstMassFusion.SetStage(90)
ElseIf (GetStageDone(13) || GetStageDone(14))
     ;Start a timer. After a brief delay, trigger the ambush.
     kMyQuest.StartTimer(0, 2)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN AUTOCAST TYPE dn084_questscript
Quest __temp = self as Quest
dn084_questscript kmyQuest = __temp as dn084_questscript
;END AUTOCAST
;BEGIN CODE
;BoS303 / Inst303: Elevator comes to a stop.

;Make the circuit breaker usable.
DN084_GeneratorRoomCircuitBreaker.GoToState("WaitingForActivate")

;Start the Ambush Battle in earnest.
if (GetStageDone(11))
     Utility.Wait(1.5)
     ;BoS: Start spawning enemies.
     kMyQuest.UpdateBoSTeleportAmbush()
     Utility.Wait(3)
     ;BoS: Emergency Lights turn on
     if (!GetStageDone(260))
          DN084_DescentEnableEmergencyLightsMarker.Enable()
          DN084_DescentEnableOffLightsMarker.Disable()
     EndIf
ElseIf (GetStageDone(12))
     ;Inst: Emergency Lights turn on immediately.
     if (!GetStageDone(260))
          DN084_DescentEnableEmergencyLightsMarker.Enable()
          DN084_DescentEnableOffLightsMarker.Disable()
     EndIf
     ;BoS rushes the player.
     int i = 0
     While (i < Alias_DN084_InstAmbushEncounters.GetCount())
          (Alias_DN084_InstAmbushEncounters.GetAt(i) as Actor).EvaluatePackage()
          i = i + 1
     EndWhile
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0242_Item_00
Function Fragment_Stage_0242_Item_00()
;BEGIN CODE
;BoS303/Inst303: Midlevel, 8F & 9F Encounters.

;Enable enemies.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     DN084_MidlevelEncounters_BoS8FEnableMarker.Enable()
     DN084_MidlevelEncounters_BoS9FEnableMarker.Enable()
     Utility.Wait(2)
     DN084_DescentEnableEmergencyLightsMarker.Enable()
ElseIf (GetStageDone(12))
     DN084_MidlevelEncounters_Inst8FEnableMarker.Enable()
     DN084_MidlevelEncounters_Inst9FEnableMarker.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player uses the generator terminal and restores power to the building.

if (GetStageDone(225))
     ;Play player voice scene if no quest companion is present.
     if (Alias_DN084_QuestCompanion.GetActorRef() != None)
          DN084_Player_01_PowerRestored.Start()
     EndIf

     ;Turn the circuit breaker on, if it isn't on already.
     if (!DN084_GeneratorRoomCircuitBreaker.OnPosition)
          DN084_GeneratorRoomCircuitBreaker.LockToOnPosition = True
          DN084_GeneratorRoomCircuitBreaker.HandleSwitch(Game.GetPlayer())
     EndIf

     ;Restore power (re-enable lights throughout the building).
     QSTMassFusionPowerUp.Play(DN084_QSTMassFusionPowerSoundSource)
     DN084_DescentDisablePowerCloseMarker.Enable()
     DN084_DescentEnableEmergencyLightsMarker.Disable()
     Utility.Wait(1)
     DN084_DescentDisablePowerMidrangeMarker.Enable()
     Utility.Wait(1)
     DN084_DescentDisablePowerFarMarker.Enable()

     ;The glass elevator becomes functional again.
     DN084_InteriorGlassElevator1.GoToState("Ready")
     DN084_InteriorGlassElevator2.GoToState("Ready")
     DN084_InteriorGlassElevator1.myIDCardReader.ResetIDCardReader()
     DN084_InteriorGlassElevator2.myIDCardReader.ResetIDCardReader()
     (DN084_InteriorGlassElevator1.myCallButton as IDCardReaderScript).ResetIDCardReader()
     (DN084_InteriorGlassElevator2.myCallButton as IDCardReaderScript).ResetIDCardReader()

     ;The midlevel elevator becomes functional again.
     (DN084_5FElevatorMaster as ElevatorMasterScript).MakeElevatorFunctional()
EndIf

;Play the reward music, if appropriate.
if (!GetStageDone(15) && !GetStageDone(290) && !GetStageDone(500))
     DN084_MassFusionPowerStopReward.Activate(DN084_MassFusionPowerStopReward)
EndIf

;Update the quest.
Utility.Wait(1)
if (GetStageDone(500))
     ;Do nothing.
ElseIf ((GetStageDone(11)))
        BoS303.SetStage(100)
Else
     InstMassFusion.SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player enters the room with the giant hole in the ground.

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf ((GetStageDone(11)))
       BoS303_Z03_Dropdown.Start()
Else
     InstMassFusion_Z03_Dropdown.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player hits a trigger in MassFusion02, by the windows overlooking the control room.
;Player gets their first view of the test reactor.

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(120)
Else
     InstMassFusion.SetStage(120)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player enters the MassFusion02 control room.

;If the player has no quest companion, start the automated radiation warning.
if (Alias_DN084_QuestCompanion.GetActorRef() == None)
     DN084_Stage315_ReactorRadiationWarning.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player approaches the airlock.

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
      BoS303_10_BeforeEnteringChamber.Start()
Else
     InstMassFusion_16_BeforeEnteringChamber.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player hits a trigger on the reactor catwalk.

;Update the quest, directing the player to the interlock release.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(130)
Else
     InstMassFusion.SetStage(130)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0345_Item_00
Function Fragment_Stage_0345_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player interacts with the Agitator Not Available trigger.

;Disable the Agitator Not Available activator.
Alias_DN084_BerylliumAgitatorNotAvailableActivator.TryToDisable()

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(135)
Else
     InstMassFusion.SetStage(135)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player presses the Agitator Interlock Release button.

;Disable the Agitator Not Available activator.
Alias_DN084_BerylliumAgitatorNotAvailableActivator.TryToDisable()

;Delay briefly so the player can see the button animation.
Utility.Wait(1.5)

;Release the Beryllium Agitator from the Reactor.
DN084_MassFusionReactorRef.PlayAnimationAndWait("play01", "done")
DN084_SoundMarkerReactorHumLPRef.Disable()
DN084_ReactorBeamTriggerRef.Disable()
Utility.Wait(1.5)
DN084_MassFusionReactorRef.PlayAnimationAndWait("play01", "done")
Utility.Wait(1.25)
Alias_DN084_BerylliumAgitatorActivator.TryToEnable()

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(140)
Else
     InstMassFusion.SetStage(140)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
;BoS303 / Inst303: The player takes the Beryllium Agitator.

;Take the Beryllium Agitator.
Alias_DN084_BerylliumAgitatorActivator.TryToDisable()
DN084_MassFusionReactorRef.PlayAnimationAndWait("play01", "done")
Utility.Wait(2.5)
Game.GetPlayer().AddItem(Alias_DN084_BerylliumAgitator.GetReference())
Utility.Wait(0.5)

if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(150)
Else
     InstMassFusion.SetStage(150)
EndIf

;Enable Fast Travel from the Mass Fusion Roof from this point forward.
DN084_DisableFastTravelTriggerRef.Disable()
(DN084_DisableFastTravelTriggerRef as DN084_DisableFastTravelTriggerScript).FastTravelFailsafe()

;Did the player think to turn off the lab's security system? Or already kill all of the robots?
if (GetStageDone(320) || GetStageDone(369))
     ;If so, the companion tells them to come on back. Nice work.
     ;Enable the 'Reward' trigger coming out of the airlock.
     DN084_PostAgitator_Reward.Enable()
Else
     ;Otherwise, start the lab fight sequence.
     SetStage(370)
     ;Also, disable the radiation warning.
     DN084_Stage315_ReactorRadiationWarning.Stop()
EndIf

;Disable the follower comment trigger in the control room, since it's inappropriate later.
AO_Comment_Unique_256_025.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0369_Item_00
Function Fragment_Stage_0369_Item_00()
;BEGIN AUTOCAST TYPE dn084_questscript
Quest __temp = self as Quest
dn084_questscript kmyQuest = __temp as dn084_questscript
;END AUTOCAST
;BEGIN CODE
;BoS303 / Inst303: All of the robots in the High Energy Lab have been destroyed.

;Update the terminals to show the security system as disabled.
SetStage(320)

if (GetStageDone(360))
     ;Release the lockdown.
     DN084_SecurityAlertKeypadFail.Stop()
     DN084_SecurityAlertEnded.Start()
     DN084_LabsUpperSecurityDoor.SetOpenNoWait(True)
     DN084_LabElevatorIDCardPanel02.GoToState("Red")
     DN084_LabSecurityDisabled.Enable()
     DN084_LabSecurityEnabled.Disable()
     DN084_LabLockdownNavcutPrimitive.Disable()

     ;Turn off the robot kill box in the elevator.
     DN084_ReactorElevatorKillBoxTriggerRef.DisableNoWait()

     ;Stop the music override.
     kMyQuest.RemoveMusicOverride()

     ;Play the reward music.
     DN084_PostSecurity_Reward.Activate(DN084_PostSecurity_Reward)

     ;Update the quest.
     if (GetStageDone(500))
          ;Do nothing.
     ElseIf (GetStageDone(11))
          BoS303.SetStage(160)
     Else
          InstMassFusion.SetStage(160)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN AUTOCAST TYPE dn084_questscript
Quest __temp = self as Quest
dn084_questscript kmyQuest = __temp as dn084_questscript
;END AUTOCAST
;BEGIN CODE
;BoS303 / Inst303: Reactor Room Security Alert

;Set the lab security faction to hostile.
DN084_MassFusionLabSecurityFaction.SetEnemy(PlayerFaction)

;Switch the lights from blue to red.
DN084_LabSecurityEnabled.Enable()
DN084_LabSecurityDisabled.Disable()

;Lock down the level.
DN084_LabsUpperSecurityDoor.SetOpenNoWait(False)
DN084_LabElevatorIDCardPanel02.GoToState("Red_Lockdown")
DN084_LabElevatorIDCardPanel02.ResetIDCardReader()
DN084_LabLockdownNavcutPrimitive.Enable()
;Debug.Trace("Should be locked down " + DN084_LabElevatorIDCardPanel02.GetState())

;Turn on the robot kill box in the elevator.
DN084_ReactorElevatorKillBoxTriggerRef.EnableNoWait()

;Start the music override.
kMyQuest.StartMusicOverride()

;Play alarm sound effect and security alert scene.
QSTMassFusionAlarmAlert.Play(DN084_ReactorAlarmSource)
Utility.Wait(0.5)
DN084_SecurityAlert.Start()
Utility.Wait(1.5)

;If the player hasn't already destroyed the security here, start the combat.
if (!GetStageDone(374))
     SetStage(372)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0372_Item_00
Function Fragment_Stage_0372_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Reactor Room Security Activates

;Activate enemies.
int i = 0
Actor a
While (i < Alias_DN084_MR_EnemyGroup01_ReactorRoom.GetCount())
     a = Alias_DN084_MR_EnemyGroup01_ReactorRoom.GetAt(i) as Actor
     ;Debug.Trace("Security processing " + a)
     a.setValue(ProtectronPodStatus, 1)
     ;a.Activate(DN084_MassFusionSecurityActivator)
     a.SetUnconscious(False)
     a.EvaluatePackage()
     Utility.Wait(1.5)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Control Room Security Alert

if (!GetStageDone(320) && !GetStageDone(369))
     ;Play alarm sound effect.
     QSTMassFusionAlarmAlert.Play(DN084_ControlRoomAlarmSource)
     Utility.Wait(1)

     ;If the player hasn't already destroyed the security here, start the combat.
     if (!GetStageDone(379))
          SetStage(377)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0377_Item_00
Function Fragment_Stage_0377_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Control Room Security Activates

;Close the control room door.
DN084_ControlRoomDoor.SetOpenNoWait(False)

;Activate enemies.
int i = 0
Actor a
While (i < Alias_DN084_MR_EnemyGroup02_ControlRoom.GetCount())
     a = Alias_DN084_MR_EnemyGroup02_ControlRoom.GetAt(i) as Actor
     ;Debug.Trace("Security processing " + a)
     a.setValue(ProtectronPodStatus, 1)
     ;a.Activate(DN084_MassFusionSecurityActivator)
     a.SetUnconscious(False)
     a.EvaluatePackage()
     i = i + 1

     if (i == 1)
          Utility.Wait(1.5)
          DN084_LabSecurityDoor01.SetOpenNoWait(True)
          Utility.Wait(0.5)
     EndIf
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0379_Item_00
Function Fragment_Stage_0379_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Control Room Security has been destroyed.

if (GetStageDone(377))
     ;Continue into the Lower Labs security alert.
     Utility.Wait(1)
     SetStage(380)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Lower Labs Security Alert

if (!GetStageDone(320) && !GetStageDone(369))
     ;Play alarm sound effect.
     QSTMassFusionAlarmAlert.Play(DN084_LabsLowerAlarmSource)

     ;If the player hasn't already destroyed the security here, start the combat.
     if (!GetStageDone(384))
          SetStage(382)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0382_Item_00
Function Fragment_Stage_0382_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Lower Labs Security Activates

;Delay a bit, depending on when this stage was triggered.
if (GetStageDone(379))
     Utility.Wait(1)
Else
     Utility.Wait(1)
EndIf

;Open the control room door.
DN084_ControlRoomDoor.SetOpenNoWait(True)

;Activate enemies.
int i = 0
Actor a
While (i < Alias_DN084_MR_EnemyGroup03_LabsLower.GetCount())
     a = Alias_DN084_MR_EnemyGroup03_LabsLower.GetAt(i) as Actor
     a.setValue(ProtectronPodStatus, 1)
     Debug.Trace("Security processing " + a)
     ;a.Activate(DN084_MassFusionSecurityActivator)
     a.SetUnconscious(False)
     a.EvaluatePackage()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0385_Item_00
Function Fragment_Stage_0385_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Upper Labs Security Alert

if (!GetStageDone(320) && !GetStageDone(369))
     ;Play alarm sound effect.
     QSTMassFusionAlarmAlert.Play(DN084_LabsUpperAlarmSource)

     ;If the player hasn't already destroyed the security here, start the combat.
     if (!GetStageDone(389))
          SetStage(387)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0387_Item_00
Function Fragment_Stage_0387_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Upper Labs Security Activates

;Activate enemies.
int i = 0
Actor a
While (i < Alias_DN084_MR_EnemyGroup04_LabsUpper.GetCount())
     a = Alias_DN084_MR_EnemyGroup04_LabsUpper.GetAt(i) as Actor
     ;Debug.Trace("Security processing " + a)
     if ((a.GetRace() == ProtectronRace) && (a.GetValue(ProtectronPodStatus) == 0))
          a.setValue(ProtectronPodStatus, 1)
          a.MoveTo(DN084_MR_EnemyGroup04_LabsUpperStartPoint)
     EndIf
     a.SetUnconscious(False)
     a.EvaluatePackage()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player returns to the elevator with the Agitator in hand.

;This stage acts as a prereq for the elevator explosion, which occurs on load into the transition cell.
;The trigger for this stage won't set it if 500 has been set, so we can ignore that case for the explosion.

;Take this opportunity to clean up the enemies in the main building, to get
;them out of the way before the final battle starts.
SetStage(391)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0391_Item_00
Function Fragment_Stage_0391_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Clean up the main building before the final battle.

;Disable the main building midlevel encounters.
ObjectReference next
int i = 0
if ((GetStageDone(11)))
     While (i < Alias_DN084_BoSAmbushEncounters.GetCount())
          next = Alias_DN084_BoSAmbushEncounters.GetAt(i)
          if (((next as Actor) != None) && !(next as Actor).IsDead())
               next.Disable()
               next.Delete()
          EndIf
          i = i + 1
     EndWhile
     DN084_MidlevelEncounters_BoS8FEnableMarker.Disable()
     DN084_MidlevelEncounters_BoS9FEnableMarker.Disable()
Else
     DN084_Inst303_DescentAmbushEnableMarker.Disable()
     DN084_MidlevelEncounters_Inst8FEnableMarker.Disable()
     DN084_MidlevelEncounters_Inst9FEnableMarker.Disable()
EndIf

;Disable the main building lower floor encounters.
if ((GetStageDone(11)))
     DN084_BoS303_LowerEncEnableMarker5F.Disable()
     DN084_BoS303_LowerEncEnableMarker3F.Disable()
     DN084_BoS303_LowerEncEnableMarker2F.Disable()
     DN084_BoS303_LowerEncEnableMarker1F.Disable()
     DN084_LowerEncounters_BoS5FEnableMarker.Disable()
     DN084_LowerEncounters_BoS3FEnableMarker.Disable()
     DN084_LowerEncounters_BoS2FEnableMarker.Disable()
     DN084_LowerEncounters_BoS1FEnableMarker.Disable()
Else
     DN084_Inst303_LowerEncEnableMarker5F.Disable()
     DN084_Inst303_LowerEncEnableMarker3F.Disable()
     DN084_Inst303_LowerEncEnableMarker2F.Disable()
     DN084_Inst303_LowerEncEnableMarker1F.Disable()
     DN084_LowerEncounters_Inst5FEnableMarker.Disable()
     DN084_LowerEncounters_Inst3FEnableMarker.Disable()
     DN084_LowerEncounters_Inst2FEnableMarker.Disable()
     DN084_LowerEncounters_Inst1FEnableMarker.Disable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0395_Item_00
Function Fragment_Stage_0395_Item_00()
;BEGIN CODE
;BoS303 / Inst303: When the elevator from the lab has loaded into its transition cell,
;trigger the explosion scene.

;Move Ingram/Filmore into the elevator.
Actor questCompanion = Alias_DN084_QuestCompanion.GetActorRef()
if (questCompanion != None)
     questCompanion.MoveTo(DN084_QuestCompanionLabElevatorMarker)
EndIf

;Set the elevator to run indefinately.
DN084_MassFusion02TransElevatorDummy.MaxFloorCount = 1000

;Wait briefly.
Utility.Wait(3)

;Play the explosion.
DN084_Elevator_DreadMusicActivator.Activate(DN084_Elevator_DreadMusicActivator)
DN084_ElevatorExplosion.Play(DN084_ElevatorExplosionSource)
DN084_MassFusion02TransElevatorDummy.CameraShakeOn = False
Game.ShakeCamera(DN084_ElevatorExplosionSource, 0.9, 2)
Game.ShakeController(0.4, 0.4, 1.75)
Utility.Wait(0.75)
DN084_MassFusion02TransElevatorDummy.CameraShakeOn = True

if (Alias_DN084_QuestCompanion.GetActorRef() != None)
     if (GetStageDone(11))
          BoS303.SetStage(170)
     Else
          InstMassFusion.SetStage(170)
     EndIf
Else
     ;Just proceed without explanation.
     SetStage(399)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0399_Item_00
Function Fragment_Stage_0399_Item_00()
;BEGIN CODE
;BoS303 / Inst303: When the explosion scene has finished, complete the transition.

;Clear QuestCompanion here. They are no longer following you.
Alias_DN084_QuestCompanion.Clear()

;The lobby battle needs time to process, so start it here.
;Enable navcut collision by the elevator door to prevent the battle from spilling in.
DN084_SecurityAreaNavcutCollision.Enable()

;Start the battle subquests and enable their enemies.
if (GetStageDone(11))
     DN084_BoS303Battle.Start()
ElseIf (GetStageDone(12))
     DN084_Inst303Battle.Start()
EndIf

;Allow the elevator ride to finish.
if (DN084_MassFusion02TransElevatorDummy.CurrentFloorCount >= 6)
     DN084_MassFusion02TransElevatorDummy.MaxFloorCount = DN084_MassFusion02TransElevatorDummy.CurrentFloorCount + 1
Else
     DN084_MassFusion02TransElevatorDummy.MaxFloorCount = 7
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player returns to the main level of the building after taking the Agitator.

;Close the door to avoid sandwich rule issues.
DN084_SecurityAreaDoor.SetOpen(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player enters the lobby.

;Disable infinite respawn and start tracking deaths.
if ((GetStageDone(11)))
     DN084_BoS303Battle.SetStage(20)
Else
     DN084_Inst303Battle.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Player exits Mass Fusion with the Agitator.

;Update the quest.
if (GetStageDone(500))
     ;Do nothing.
ElseIf (GetStageDone(11))
     BoS303.SetStage(180)
Else
     InstMassFusion.SetStage(180)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
;BoS303 / Inst303: Lobby battle has ended (all enemies killed).

;Update the quest.
if (GetStageDone(11))
     BoS303.SetStage(190)
Else
     InstMassFusion.SetStage(190)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE dn084_questscript
Quest __temp = self as Quest
dn084_questscript kmyQuest = __temp as dn084_questscript
;END AUTOCAST
;BEGIN CODE
;BoS303 / Inst303: Called when the quest has been turned in.
;Kills any surviving quest enemies and puts the dungeon into its postquest state.

;Determine final status of the building.
;If the player stayed and fought, their side holds the building. Otherwise, the other faction gets it.
if (GetStageDone(15))
     ;Don't enable any postquest enemies.
ElseIf (GetStageDone(11) && GetStageDone(450))
     ;BoS player stayed and won. BoS takes the building.
     DN084_Postquest_BoSEnableMarker.Enable()
     DN084_Postquest_GunnerBarricadeEnableMarker.Disable()
ElseIf (GetStageDone(12) && !GetStageDone(450))
     ;Inst player left without winning. BoS takes the building.
     DN084_Postquest_BoSEnableMarker.Enable()
     DN084_Postquest_GunnerBarricadeEnableMarker.Disable()
Else
     ;Inst takes the building.
     DN084_Postquest_InstEnableMarker.Enable()
EndIf

;Roof: Disable any enemies left on the roof.
int i = 0
if ((GetStageDone(11)))
     DN084_BoS303_RoofEnableMarker.Disable()
Else
     DN084_Inst303_RoofEnableMarker.Disable()
EndIf

;Descent: Clean up the Descent enemies if necessary.
kMyQuest.CleanupDescentEnemies()

;Midlevel: Stage 391 disables the midlevel encounters.
;Lower: Stage 391 disables the lower level encounters.
;Make sure Stage 391 gets set for quickstarts...
SetStage(391)

;Final Battle: Disable any surviving final battle NPCs or corpses.
if ((GetStageDone(11)))
     DN084_BoS303Battle.Stop()
Else
     DN084_Inst303Battle.Stop()
EndIf

;Put the dungeon into its postquest state.
;Enable the ground and midlevel elevators.
DN084_Postquest_Disable.Disable()
DN084_Postquest_Enable.Enable()

;Restore the power.
SetStage(260)
SetStage(280)

;Enable Fast Travel from the Mass Fusion Roof from this point forward.
DN084_DisableFastTravelTriggerRef.Disable()
(DN084_DisableFastTravelTriggerRef as DN084_DisableFastTravelTriggerScript).FastTravelFailsafe()

;Don't actually stop the quest due to the airlock scene.
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


RefCollectionAlias Property Alias_DN084_PrequestEncounterMarkers Auto Const

RefCollectionAlias Property Alias_DN084_PrequestEncounterTriggers Auto Const

ObjectReference Property DN084_BoS303QuickstartMarker Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Faction Property PlayerFaction Auto Const

ObjectReference Property DN084_BoS303_DescentEnableMarker Auto Const

ObjectReference Property DN084_Inst303_DescentEnableMarker Auto Const

ObjectReference Property DN084_DescentQuickstartMarker Auto Const

ObjectReference Property DN084_Inst303_DescentAmbushEnableMarker Auto Const

ObjectReference Property DN084_BoS303_DescentAmbushEnableMarker Auto Const

ObjectReference Property DN084_DeadGunnerEnableMarker Auto Const

ObjectReference Property DN084_BoS303_LowerEncEnableMarker5F Auto Const
ObjectReference Property DN084_BoS303_LowerEncEnableMarker3F Auto Const
ObjectReference Property DN084_BoS303_LowerEncEnableMarker1F Auto Const
ObjectReference Property DN084_Inst303_LowerEncEnableMarker5F Auto Const
ObjectReference Property DN084_Inst303_LowerEncEnableMarker3F Auto Const
ObjectReference Property DN084_Inst303_LowerEncEnableMarker1F Auto Const
RefCollectionAlias Property Alias_DN084_BoSLowerEncounters Auto Const

RefCollectionAlias Property Alias_DN084_InstLowerEncounters Auto Const

Quest Property DN084_BoS303Battle Auto Const

Quest Property DN084_Inst303Battle Auto Const

Default2StateActivator Property DN084_LabSecurityDoor01 Auto Const

ObjectReference Property DN084_LabExitDoor Auto Const

Faction Property InstituteFaction Auto Const

ObjectReference Property DN084_LabQuickstartMarker Auto Const

ObjectReference Property DN084_FinalBattleQuickstartMarker Auto Const

Faction Property SynthFaction Auto Const

Quest Property BoS303 Auto Const

Scene Property BoS303ZSceneElevatorNoCode Auto Const

Scene Property BoS303ZSceneHoleDrop Auto Const

ObjectReference Property DN084_MassFusionReactorRadiationRef Auto Const

ObjectReference Property DN084_MassFusionReactorRef Auto Const

ObjectReference Property DN084_LabSecurityDisabled Auto Const

ObjectReference Property DN084_LabSecurityEnabled Auto Const

RefCollectionAlias Property Alias_DN084_MR_EnemyGroup01_ReactorRoom Auto Const

RefCollectionAlias Property Alias_DN084_MR_EnemyGroup02_ControlRoom Auto Const

RefCollectionAlias Property Alias_DN084_MR_EnemyGroup03_LabsLower Auto Const

RefCollectionAlias Property Alias_DN084_MR_EnemyGroup04_LabsUpper Auto Const

ObjectReference Property DN084_MassFusionSecurityActivator Auto Const

Default2StateActivator Property DN084_ControlRoomDoor Auto Const

ReferenceAlias Property Alias_DN084_BerylliumAgitatorActivator Auto Const

ReferenceAlias Property Alias_DN084_BerylliumAgitator Auto Const

ObjectReference Property DN084_MassFusion02_LabWindowDisableMarker Auto Const

ObjectReference Property DN084_MassFusion02_LabWindowEnableMarker Auto Const

sound Property DN084_ElevatorExplosion Auto Const

ObjectReference Property DN084_ElevatorExplosionSource Auto Const

LoadElevatorMasterScript Property DN084_MassFusion02TransElevatorDummy Auto Const

SPELL Property DN084_DecontaminationSpell Auto Const

Faction Property DN084_MassFusionLabSecurityFaction Auto Const

ActorValue Property ProtectronPodStatus Auto Const

ObjectReference Property DN084_SecurityAreaNavcutCollision Auto Const

ObjectReference Property DN084_Postquest_BoSEnableMarker Auto Const

ObjectReference Property DN084_Postquest_Enable Auto Const

ObjectReference Property DN084_Postquest_Disable Auto Const

ObjectReference Property DN084_SecurityAreaDoor Auto Const

ReferenceAlias Property Alias_DN084_QuestCompanion Auto Const

ReferenceAlias Property Alias_DN084_CompanionCait Auto Const

ReferenceAlias Property Alias_DN084_QuestCompanion_Ingram Auto Const

ReferenceAlias Property Alias_DN084_QuestCompanion_Filmore Auto Const

ReferenceAlias Property Alias_DN084_ExecutiveIDCard Auto Const

ReferenceAlias Property Companion Auto Const
ReferenceAlias Property DogmeatCompanion Auto Const

ReferenceAlias Property Alias_DN084_BoSPaladinDanse Auto Const
ReferenceAlias Property Alias_DN084_CompanionX688 Auto Const
ReferenceAlias Property Alias_DN084_Dogmeat Auto Const

ActorValue Property FollowerState Auto Const

Cell Property MassFusion01 Auto Const

GlobalVariable Property DN084_DescentFloor Auto Const

Quest Property BoS100Fight Auto Const

GlobalVariable Property DN084_ElevatorLoadActive Auto Const

Default2StateActivator Property DN084_ReactorLabSecurityDoor Auto Const

ObjectReference Property DN084_DescentDisablePowerCloseMarker Auto Const

ObjectReference Property DN084_DescentDisablePowerMidrangeMarker Auto Const

ObjectReference Property DN084_DescentDisablePowerFarMarker Auto Const

ObjectReference Property DN084_DescentEnableEmergencyLightsMarker Auto Const

ObjectReference Property DN084_DisableFastTravelTriggerRef Auto Const

Scene Property BoS303_Z01_ElevatorNoCode Auto Const

Scene Property BoS303_Z03_Dropdown Auto Const

Scene Property BoS303_10_BeforeEnteringChamber Auto Const

DN084_GlassElevatorScript Property DN084_InteriorGlassElevator1 Auto Const

DN084_GlassElevatorScript Property DN084_InteriorGlassElevator2 Auto Const

DN084_GlassElevatorScript Property DN084_ExteriorGlassElevator1 Auto Const

DN084_GlassElevatorScript Property DN084_ExteriorGlassElevator2 Auto Const

ObjectReference Property DN084_QuestCompanionLabElevatorMarker Auto Const

Scene Property DN084_Stage220_BoSKillsPower Auto Const

Scene Property DN084_Stage220_SynthsKillPower Auto Const

Scene Property DN084_Stage320_ReactorRadiationWarning Auto Const

Scene Property DN084_Stage315_ReactorRadiationWarning Auto Const

ObjectReference Property DN084_BerylliumAgitatorNotAvailableActivatorRef Auto Const

ReferenceAlias Property Alias_DN084_BerylliumAgitatorNotAvailableActivator Auto Const

Explosion Property GeneratorExplosion Auto Const

ObjectReference Property DN084_GeneratorRoomExplosionSource Auto Const

ObjectReference Property DN084_Inst303_RoofEnableMarker Auto Const

ObjectReference Property DN084_BoS303_RoofEnableMarker Auto Const

ObjectReference Property DN084_InteriorElevatorMarkerCompanion1 Auto Const

Quest Property DialogueInstitute Auto Const

ObjectReference Property DN084_MidlevelEncounters_Inst9FEnableMarker Auto Const

ObjectReference Property DN084_MidlevelEncounters_Inst8FEnableMarker Auto Const

RefCollectionAlias Property Alias_DN084_InstAmbushEncounters Auto Const

RefCollectionAlias Property Alias_DN084_BoSAmbushEncounters Auto Const

ObjectReference Property DN084_MidlevelEncounters_BoS8FEnableMarker Auto Const

ObjectReference Property DN084_MidlevelEncounters_BoS9FEnableMarker Auto Const

ObjectReference Property BoS303TempNPC01Marker Auto Const

ObjectReference Property DN084_BoS303_LowerEncEnableMarker2F Auto Const
ObjectReference Property DN084_Inst303_LowerEncEnableMarker2F Auto Const

ObjectReference Property DN084_LowerEncounters_Inst5FEnableMarker Auto Const
ObjectReference Property DN084_LowerEncounters_Inst3FEnableMarker Auto Const
ObjectReference Property DN084_LowerEncounters_Inst2FEnableMarker Auto Const
ObjectReference Property DN084_LowerEncounters_Inst1FEnableMarker Auto Const
ObjectReference Property DN084_LowerEncounters_BoS5FEnableMarker Auto Const
ObjectReference Property DN084_LowerEncounters_BoS3FEnableMarker Auto Const
ObjectReference Property DN084_LowerEncounters_BoS2FEnableMarker Auto Const
ObjectReference Property DN084_LowerEncounters_BoS1FEnableMarker Auto Const

ObjectReference Property DN084_QuestLowerEnableMarker Auto Const

ObjectReference Property DN084_QuestLowerDisableMarker Auto Const

ObjectReference Property DN084_Postquest_InstEnableMarker Auto Const

Scene Property DN084_SecurityAlert Auto Const

Default2StateActivator Property DN084_LabsUpperSecurityDoor Auto Const

DN084_LabIDCardReaderScript Property DN084_LabElevatorIDCardPanel02 Auto Const

ObjectReference Property DN084_DescentFirstDoor Auto Const

ObjectReference Property DN084_SoundMarkerReactorHumLPRef Auto Const

Scene Property DN084_SecurityAlertEnded Auto Const

Scene Property DN084_SecurityAlertKeypadFail Auto Const

ObjectReference Property DN084_BerylliumAgitatorActivatorRef Auto Const

MusicType Property MUSzCombatMassFusion Auto Const

sound Property QSTMassFusionPowerDown Auto Const

sound Property QSTMassFusionPowerUp Auto Const

ObjectReference Property DN084_QSTMassFusionPowerSoundSource Auto Const

Explosion Property DN084_ElevatorStaggerExplosion Auto Const

Quest Property InstMassFusion Auto Const

Scene Property InstMassFusion_16_BeforeEnteringChamber Auto Const

sound Property QSTMassFusionAlarmAlert Auto Const

ObjectReference Property DN084_LabsUpperAlarmSource Auto Const

ObjectReference Property DN084_LabsLowerAlarmSource Auto Const

ObjectReference Property DN084_ControlRoomAlarmSource Auto Const

ObjectReference Property DN084_ReactorAlarmSource Auto Const

ObjectReference Property DN084_DescentEnableOffLightsMarker Auto Const

ElevatorMasterScript Property DN084_5FElevatorMaster Auto Const

ObjectReference Property DN084_PrequestTrapsDisableMarker Auto Const

ObjectReference Property DN084_FollowerCommentMarker_Unique02 Auto Const

Scene Property BoS303_09_ViewReactor Auto Const

ObjectReference Property MassFusionBuildingRoofMapMarkerHeadingRef Auto Const

ObjectReference Property MassFusionBuildingRoofMapMarkerRef Auto Const

Quest Property DN084_Overrides Auto Const

ObjectReference Property DN084_BoS303CompanionQuickstartMarker Auto Const

Scene Property InstMassFusion_Z01_ElevatorNoCode Auto Const

ObjectReference Property DN084_GeneratorRoomCircuitBreakerActivator Auto Const

CircuitBreakerMasterScript Property DN084_GeneratorRoomCircuitBreaker Auto Const

Scene Property InstMassFusion_Z03_Dropdown Auto Const

Activator Property DN084_BerylliumAgitatorNotAvailableActivator Auto Const

ObjectReference Property DN084_LabLockdownNavcutPrimitive Auto Const

Quest Property BoSKickOut Auto Const

RefCollectionAlias Property Alias_DN084_LobbyTurrets Auto Const

ObjectReference Property DN084_DescentGeneratorRoomChar Auto Const

LeveledItem Property DN084_LL_Armor_Freefall_BothLegs Auto Const

ObjectReference Property DN084_FreefallSafe Auto Const

ObjectReference Property DN084_ReactorBeamTriggerRef Auto Const

ObjectReference Property AO_Comment_Unique_256_025 Auto Const

Scene Property DN084_Player_01_PowerRestored Auto Const

Scene Property DN084_Player_00_FindKeycard Auto Const

Quest Property Tutorial Auto Const

ObjectReference Property DN084_AssaultronDoor01 Auto Const

ObjectReference Property DN084_AssaultronDoor02 Auto Const

ObjectReference Property DN084_PostAgitator_Reward Auto Const

ObjectReference Property DN084_PostAgitator_Stinger Auto Const

ReferenceAlias Property Alias_DN084_SentryBot Auto Const

ObjectReference Property DN084_PostSecurity_Reward Auto Const

ObjectReference Property DN084_Elevator_DreadMusicActivator Auto Const

ObjectReference Property DN084_MassFusionPowerStopStinger Auto Const

ObjectReference Property DN084_MassFusionPowerStopReward Auto Const

ObjectReference Property DN084_Postquest_GunnerBarricadeEnableMarker Auto Const Mandatory

Quest Property Followers Auto Const Mandatory

ObjectReference Property DN084_MR_EnemyGroup04_LabsUpperStartPoint Auto Const Mandatory

EncounterZone Property MassFusionZone Auto Const Mandatory

Location Property MassFusionLocation Auto Const Mandatory

Race Property ProtectronRace Auto Const Mandatory

ObjectReference Property DN084_ReactorElevatorKillBoxTriggerRef Auto Const Mandatory
