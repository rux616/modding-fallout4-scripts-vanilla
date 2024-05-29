;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQ01Caravan_0100FF87 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Startup stage. Called by DLC01MQ01 when that quest starts up.

;Ada should Ignore Friendly Hits for the duration of the combat.
Alias_Ada.GetActorRef().IgnoreFriendlyHits(True)

;Enable Ada, the Caravan remains, and the Mechanist Robots.
Alias_Ada.TryToEnable()
DLC01Caravan_ClutterEnableMarker.EnableNoWait()
DLC01Caravan_FireFXEnableMarker1.EnableNoWait()
DLC01Caravan_ActorsEnableMarker.EnableNoWait()

;Start the Caravan Site Marker's event monitoring.
DLC01_CaravanSiteMarker.SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Called by the CaravanSiteScript (on player approach, when they first see Porter),
;or by the subsequent stages.
Alias_Porter.TryToKill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Set by Porter's alias script when he dies. Enables the tire fire.
DLC01Caravan_FireFXEnableMarker2.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Called by the CaravanSiteScript (on player approach, at 4000u distance)
;or by the subsequent stages.

;Make sure we've done the prior approach stages first.
SetStage(20)

;Damage Hurtz, making it more likely that he'll die quickly.
Actor Hurtz = Alias_Hurtz.GetActorRef()
if (Hurtz != None)
     Hurtz.DamageValue(Health, Hurtz.GetValue(Health) / 3)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Called by the CaravanSiteScript (on player approach, at 1250u distance).

;Make sure we've done the prior approach stages first.
SetStage(30)

;If the fight is still ongoing, play Ada's scene.
if (!GetStageDone(100))
     DLC01MQ01.SetStage(2350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set when the player hits a MechBot.

;Make sure we've done the prior approach stages first.
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Set by the MechBot alias counter when only one MechBot remains.

;Kill Hurtz.
Alias_Hurtz.TryToKill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set by the MechBot alias counter all of the MechBots have been killed.

;Ada no longer needs to Ignore Friendly Hits.
Alias_Ada.GetActorRef().IgnoreFriendlyHits(False)

;Let DLC01MQ01 know that the fight has ended.
DLC01MQ01.SetStage(2400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Called by DLC01MQ02 when it's safe to clean up the caravan area.

;Turn off the Fire FX.
DLC01Caravan_FireFXEnableMarker1.DisableNoWait()
DLC01Caravan_FireFXEnableMarker2.DisableNoWait()

;Shut down.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Ada Auto Const Mandatory

ObjectReference Property DLC01Caravan_ClutterEnableMarker Auto Const Mandatory

ObjectReference Property DLC01Caravan_ActorsEnableMarker Auto Const Mandatory

DLC01:DLC01Caravan_CaravanSiteScript Property DLC01_CaravanSiteMarker Auto Const Mandatory

ReferenceAlias Property Alias_Porter Auto Const Mandatory

Quest Property DLC01MQ01 Auto Const Mandatory

ObjectReference Property DLC01Caravan_FireFXMarker Auto Const Mandatory


ObjectReference Property DLC01Caravan_FireFXEnableMarker2 Auto Const Mandatory

ObjectReference Property DLC01Caravan_FireFXEnableMarker1 Auto Const Mandatory

Perk Property DLC01MQ01Caravan_MutualInvulnerabilityPerk Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

ReferenceAlias Property Alias_Hurtz Auto Const Mandatory

RefCollectionAlias Property Alias_MechBots Auto Const Mandatory
