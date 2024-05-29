;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01010422 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set if the player reads Ness' note.
;If the player hasn't found the secret compartment, show the objective to the plane.
if (!GetStageDone(110))
     ;Display 'Investigate the Crash Site'
     SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Player agrees to work with Ness.
;Display 'Meet Ness at the Crash Site'
SetObjectiveDisplayed(30)

;Reset the plane's exterior cells.
SkylanesFlightExt.Reset()
SkylanesFlightExt02.Reset()
SkylanesFlightExt03.Reset()
SkylanesFlightExt04.Reset()

;Rearm the Skylanes RE trigger to make sure the encounter will trigger.
(SkylanesTrigger as RETriggerScript).ReArmTrigger()

;This stage allows the Skylanes Assault story manager condition to pass.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;During DN123SkylanesAssault, start the attack run.

;Complete 'Meet Ness at the Crash Site'
SetObjectiveCompleted(30)

;Display 'Secure the Plane'
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;After DN123SkylanesAssault, direct the player to collect their pay.
;Ness is waiting near the secret compartment.

;If Ness isn't dead...
if (!GetStageDone(150))
     ;Just for safety, make sure all objectives up to this point have been completed.
     SetObjectiveCompleted(20)
     SetObjectiveCompleted(30)
     SetObjectiveCompleted(40)

     ;Display 'Collect your Pay'
     SetObjectiveDisplayed(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;If the player participated in the battle, give them their pay.
if (REAssaultSC01_DN123SkylanesAssault.GetStageDone(51))
     SetStage(61)
EndIf

;Complete 'Collect your Pay'
SetObjectiveCompleted(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Player gets their pay, based on the amount they negotiated in DN123SkylanesPointer.
Quest DN123SkylanesPointer = RETravelSC01_DN123SkylanesPointer
int pay = 50
if (DN123SkylanesPointer.GetStageDone(28))
     pay = 150
ElseIf (DN123SkylanesPointer.GetStageDone(27))
     pay = 100
ElseIf (DN123SkylanesPointer.GetStageDone(26))
     pay = 75
EndIf

;Give the player their pay.
Game.GetPlayer().AddItem(Caps001, pay)

;Award the player XP for completing the quest.
Game.RewardPlayerXP(XPRadiant.GetValueInt())

;We're ready to close out the quest.
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set when the player discovers Skylanes (trigger)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Set when the Skylanes compartment is opened.

;Complete 'Investigate the Crash Site'.
SetObjectiveCompleted(20)

;Dismiss any other objectives.
SetObjectiveDisplayed(30, False)
SetObjectiveDisplayed(40, False)
if (IsObjectiveDisplayed(50))
     SetObjectiveFailed(50, False)
EndIf

;If Ness is dead, the quest is over at this point. Just wrap up.
if ((GetStageDone(20) || GetStageDone(30)) && GetStageDone(150))
     SetStage(250)
     return
EndIf

;Otherwise, let the Assault Quest know the compartment has been opened.
REAssaultSC01_DN123SkylanesAssault.SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
;If the Raiders are dead, Ness is dead, and the player hasn't found the secret compartment
;yet, point them to it.
if (GetStageDone(150) && !GetStageDone(110))
     ;Complete 'Secure the Plane'
     SetObjectiveCompleted(40)

     ;Display 'Investigate the Crash Site'
     SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Did the player learn about the crash from Ness in the first place?
if (GetStageDone(30))
     ;Player learned about the plane from Ness. Where were we in the quest?

     ;You can't Meet Ness (30) or Collect Your Pay (50)
     if (IsObjectiveDisplayed(30) && !IsObjectiveCompleted(30))
          SetObjectiveFailed(30)
     EndIf
     if (IsObjectiveDisplayed(50) && !IsObjectiveCompleted(50))
          SetObjectiveFailed(50)
     EndIf

     ;Is the secret compartment open? If so, we can shut down. Otherwise, display 'Investigate the Plane'
     if (GetStageDone(110))
          SetStage(250)
     Else
          SetStage(20)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Quest is ready to shut down the next time Ness unloads.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Update the enable state for the plane, swapping the secret compartment to an empty version.
DN123_PostSkylanesEnableMarker.Enable()
DN123_PostSkylanesDisableMarker.Disable()

;Disable Ness.
Alias_Ness.TryToDisable()

;Clean up and shut down.
CompleteAllObjectives()
CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const

ReferenceAlias Property Alias_Ness Auto Const

ObjectReference Property SkylanesTrigger Auto Const

Quest Property REAssaultSC01_DN123SkylanesAssault Auto Const

GlobalVariable Property XPRadiant Auto Const

Quest Property RETravelSC01_DN123SkylanesPointer Auto Const

Key Property DN123SkylanesKey Auto Const

Cell Property SkylanesFlightExt Auto Const

Cell Property SkylanesFlightExt02 Auto Const

Cell Property SkylanesFlightExt03 Auto Const

Cell Property SkylanesFlightExt04 Auto Const

ObjectReference Property DN123_PostSkylanesEnableMarker Auto Const

ObjectReference Property DN123_PostSkylanesDisableMarker Auto Const
