;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS16_00022A07 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(PlayerStartSpot)
Alias_Bobbi.GetRef().MoveTo(BobbiStartSpot)

MS16MiscObj.SetStage(10)
SetStage(10)
Alias_Bobbi.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
pMS16BobbiOpensDoor.start()
Alias_Bobbi.GetActorRef().EvaluatePackage()
SetObjectiveDisplayed(20, 1)
pMS16BobbisDoor.setopen()

if (pMS16 as MS16QuestScript).negotiationvariable == 0
    game.getPlayer().AddItem(Caps001, 50)
endif
if (pMS16 as MS16QuestScript).negotiationvariable == 1
    game.getPlayer().AddItem(Caps001, 100)
endif
if (pMS16 as MS16QuestScript).negotiationvariable == 2
    game.getPlayer().AddItem(Caps001, 150)
endif
if (pMS16 as MS16QuestScript).negotiationvariable == 3
    game.getPlayer().AddItem(Caps001, 200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Bobbi.GetActorRef().EvaluatePackage()
if (MS16MiscObj.GetStageDone(10))
    MS16MiscObj.SetStage(11)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE MS16QuestScript
Quest __temp = self as Quest
MS16QuestScript kmyQuest = __temp as MS16QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
alias_Phase1MirelurksEnabler.getRef().enable()
pMS16WorkersAmbushedScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
setObjectiveDisplayed(31)
Alias_Bobbi.GetActorRef().EvaluatePackage()
;Alias_Bobbi.GetRef().Moveto(pMS16BobbiMeetsPlayerDCMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
Alias_Worker01.getReference().placeatme(RockWallExplosion)
;Alias_FirstDirtWall.getReference().placeatme(RockWallExplosion)
;Alias_FirstDirtWall.getReference().damageobject(10)
;utility.wait(1)
;Alias_FirstDirtWall.getReference().damageobject(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(35)

Alias_Bobbi.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(35)
SetObjectiveDisplayed(40)

Alias_Bobbi.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
setObjectiveCompleted(40)
setObjectiveDisplayed(50)

Alias_Bobbi.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Bobbi.GetActorRef().EvaluatePackage()
Alias_Bobbi.GetRef().Moveto(pMS16BobbiMeetsPlayerDCMarker)
Alias_Bobbi.getActorRef().SetOutfit(pMS16BobbiOutfitDCDisguise)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(55)



Alias_Mel.GetRef().Enable()

Alias_DmndCitySecurityJailDoor.getReference().setOpen(false)
Alias_DmndCitySecurityJailDoor.getReference().Lock()
Alias_DmndCitySecurityJailDoor.getReference().SetLockLevel(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0058_Item_00
Function Fragment_Stage_0058_Item_00()
;BEGIN CODE
Alias_Mel.GetActorReference().EvaluatePackage()
pMS16MelRunsOutofJail.start()
SetObjectiveCompleted(55)
SetObjectiveDisplayed(58)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0059_Item_00
Function Fragment_Stage_0059_Item_00()
;BEGIN CODE
Alias_Bobbi.GetActorRef().EvaluatePackage()
pMS16.setstage(60)
utility.wait(1)
pMS16.setstage(65)
utility.wait(1)
Alias_Mel.getReference().enable()
Alias_Sonya.GetActorRef().Enable()
game.getplayer().moveto(Alias_Mel.getReference())
utility.wait(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(58)
SetObjectiveDisplayed(60)

Alias_Mel.GetActorRef().EvaluatePackage()

Alias_Bobbi.GetActorRef().EvaluatePackage()

Alias_Sonya.GetActorRef().Enable()


;alias_Phase1MirelurksEnabler.getRef().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
if pMS16.isObjectivecompleted(53) == false
    pMS16.setObjectivefailed(53) 
endif

Alias_Mel.GetActorRef().moveto(pMS16MelDigPhase1Marker)
Alias_Mel.GetActorRef().EvaluatePackage()
;Alias_Sonya.getReference().moveto(Alias_Mel.getReference())
Alias_Sonya.GetReference().MakeRadioReceiver( 98, 0.5, None, true)


Alias_Bobbi.GetActorRef().moveto(pMS16BobbiinTunnelStage1)
Alias_Bobbi.GetActorRef().EvaluatePackage()
Alias_Bobbi.getActorRef().SetOutfit(pMS16BobbiOutfit)

Alias_Sonya.getActorReference().addtoFaction(pplayerallyfaction)
Alias_Bobbi.getActorReference().addtoFaction(pplayerallyfaction)
Alias_Mel.getActorReference().addtoFaction(pplayerallyfaction)

Alias_Bobbi.getActorReference().setCrimeFaction(none)
Alias_Bobbi.getActorReference().RemoveFromFaction(pCrimeGoodneighbor)

pMS16BobbiMelPreDigScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0067_Item_00
Function Fragment_Stage_0067_Item_00()
;BEGIN CODE
Alias_Mel.GetActorRef().EvaluatePackage()
Alias_Bobbi.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)

alias_Sonya.getReference().placeatme(pStoneBreakingPulse01explosion)

firstRockWall.getReference().damageobject(10)

utility.wait(1)

Alias_Sonya.GetReference().MakeRadioReceiver( 98, 1, None, false)

pMS16BobbiGiveDirectionsForDig.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0089_Item_00
Function Fragment_Stage_0089_Item_00()
;BEGIN CODE
Alias_Mel.getReference().enable()
Alias_Mel.GetActorRef().moveto(pMS16MelPhase2Marker)
Alias_Mel.GetActorRef().EvaluatePackage()

Alias_Sonya.getReference().enable()
Alias_Sonya.getReference().moveto(Alias_Mel.getReference())

Alias_Bobbi.GetActorRef().moveto(pMS16BobbiPhase2Marker)
Alias_Bobbi.GetActorRef().EvaluatePackage()

pMS16.setstage(90)
utility.wait(1)
pMS16.setstage(95)
utility.wait(1)
pMS16.setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
pMS16AmbientReachedSubway.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
pMS16AmbientReachedIndustrial.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0149_Item_00
Function Fragment_Stage_0149_Item_00()
;BEGIN CODE
Alias_Mel.getReference().enable()
Alias_Mel.GetActorRef().moveto(OutsideNHMBasementMarker)
Alias_Mel.GetActorRef().EvaluatePackage()

Alias_Sonya.getReference().enable()
Alias_Sonya.getReference().moveto(Alias_Mel.getReference())

Alias_Bobbi.GetActorRef().moveto(OutsideNHMBasementMarker)
Alias_Bobbi.GetActorRef().EvaluatePackage()

game.getplayer().moveto(Alias_Bobbi.GetRef())
Alias_Sonya.GetReference().MakeRadioReceiver( 98, 1, None, true)
 utility.wait(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(150)

pMS16TheGangGetsToTheNHMBasement.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
setObjectiveCompleted(150)
SetObjectiveDisplayed(155)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
setObjectiveCompleted(155)

;alias_Sonya.getReference().placeatme(pStoneBreakingPulse01explosion)
pMS16FinalExplosionMarker.placeatme(pBreakableRockWallGate01explosion)
pFXExplosionEyebotStonebreakingPulseFinal.Play(pMS16FinalExplosionMarker)
Alias_Sonya.GetReference().MakeRadioReceiver( 98, 1, None, false)
alias_Sonya.getActorRef().getActorBase().setEssential(false)
alias_Sonya.getActorReference().kill()
NHMBasementToggle.disable()

MS16SonyaDeadTrigger.Enable()

SetObjectiveDisplayed(158)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0199_Item_00
Function Fragment_Stage_0199_Item_00()
;BEGIN CODE
Alias_Mel.getReference().enable()
pMS16.setstage(200)
pMS16.setstage(205)
utility.wait(1)
game.getPlayer().moveto(Alias_bobbi.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;setObjectiveCompleted(158)
;SetObjectiveDisplayed(160)

alias_NHandMDoor.getRef().unlock()

;pMS16FahrenheitScene.Start()

;Shut down Goodneighbor Entrance Dialogue scene so Fahrenheit is free for this scene
pDialogueGoodneighborEntrance.setstage(98)

if alias_Fahrenheit.getActorRef().isDead() == false
     alias_fahrenheit.getref().moveto(alias_FahrenheitFightMarker.getRef())
     alias_fahrenheit.getActorref().removefromAllFactions()
     alias_fahrenheit.getActorref().evaluatepackage()
     ;alias_fahrenheit.getActorref().changeAnimFlavor(pAnimFlavorFahrenheit)
endif

;Enable Triggermen
alias_FahrenheitTriggerman01.getref().enable()
alias_FahrenheitTriggerman02.getref().enable()

;Put Fahrenheit and the Triggermen into Crime Factions
alias_FahrenheitTriggerman01.GetActorRef().setCrimeFaction(pMS16TriggermanFaction)
alias_FahrenheitTriggerman02.GetActorRef().setCrimeFaction(pMS16TriggermanFaction)
alias_Fahrenheit.GetActorRef().setCrimeFaction(pMS16TriggermanFaction)

;Open NHM exit door
pMS16NHMSecurityGate.setOpen(true)
pMS16NHMSecurityDoor.unlock()

;Set up Fahrenheit's gun
alias_Fahrenheit_Gun.getRef().enable()
alias_Fahrenheit_Gun.getRef().AttachMod(pmod_Legendary_Weapon_IncendiaryBullets)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
Alias_Mel.GetActorRef().moveto(pMS16FahrenheitSceneMelMarker)
Alias_Mel.GetActorRef().EvaluatePackage()

Alias_Bobbi.GetActorRef().moveto(pMS16FahrenheitSceneBobbiMarker)
Alias_Bobbi.GetActorRef().EvaluatePackage()

;Alias_Casey.GetActorRef().moveto(pMS16FahrenheitSceneCaseyMarker)
;Alias_Casey.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveCompleted(158)
SetObjectiveDisplayed(160)
;alias_fahrenheit.getActorref().changeAnimFlavor()
alias_fahrenheit.getActorRef().getActorBase().setEssential(false)
alias_Fahrenheit.getActorRef().AddToFaction(pplayerenemyfaction)
alias_FahrenheitTriggerman01.getActorRef().AddToFaction(pplayerenemyfaction)
alias_FahrenheitTriggerman02.getActorRef().AddToFaction(pplayerenemyfaction)
alias_Bobbi.getActorRef().RemoveFromFaction(pCrimeGoodneighbor)
alias_Fahrenheit.getActorRef().startCombat(game.getplayer())
alias_FahrenheitTriggerman01.getActorRef().startCombat(game.getplayer())
alias_FahrenheitTriggerman02.getActorRef().startCombat(game.getplayer())
alias_fahrenheit.getActorref().evaluatepackage()
alias_Bobbi.getActorRef().startCombat(alias_Fahrenheit.getActorRef())
alias_Mel.getActorRef().startCombat(alias_Fahrenheit.getActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
;alias_fahrenheit.getActorref().changeAnimFlavor()
alias_fahrenheit.getActorref().additem(pMS16StrongroomKey)
pMS16BobbiAsksPlayerToOpenTrain.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(158)
SetObjectiveDisplayed(165)
pMS16MelBobbiFightStartScene.start()

Alias_Bobbi.getActorReference().RemoveFromFaction(pplayerallyfaction)
Alias_Bobbi.getActorReference().AddtoFaction(pplayerenemyfaction)
alias_Bobbi.getActorRef().getActorBase().setEssential(false)
alias_Bobbi.getActorRef().startCombat(game.getplayer())
alias_Bobbi.getActorref().evaluatepackage()
alias_Mel.getActorRef().setValue(pConfidence, 0)
alias_Mel.getActorref().evaluatepackage()
alias_Fahrenheit.getActorref().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
SetObjectiveCompleted(165)
SetObjectiveDisplayed(180)
alias_Fahrenheit.getActorref().evaluatepackage()
alias_Mel.getActorRef().setValue(pConfidence, 2)

;pMS16.setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
alias_fahrenheit.getActorref().evaluatepackage()
alias_Bobbi.getActorref().evaluatepackage()
alias_Mel.getActorref().evaluatepackage()

SetObjectiveCompleted(158)
SetObjectiveDisplayed(180)

pMS16.setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
setObjectiveDisplayed(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0238_Item_00
Function Fragment_Stage_0238_Item_00()
;BEGIN CODE
pMS16BobbiAndMelToTrainCar.start()

setObjectiveCompleted(170)
setObjectiveDisplayed(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
alias_fahrenheit.getActorref().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetObjectiveCompleted(175)

;XP Rewards
;Game.RewardPlayerXP(pXPMiscQuestFinal.GetValue() as int)

;Setup FFGoodneighbor 07, Sided with Bobbi
FFGoodneighbor07.Start()
FFGoodneighbor07.SetStage(3)
FFGoodneighbor07.SetStage(10)

;Give Bobbi some money for later in the quest
Alias_Bobbi.GetActorRef().AddItem(Caps001, 375)

;Turn off Bobbi being essential
Alias_Bobbi.GetActorRef().GetActorBase().SetEssential(FALSE)

;Give Bobbi her new home factions
Alias_Bobbi.GetActorRef().AddToFaction(FFGoodneighbor07BobbiFaction)
Alias_Bobbi.GetActorRef().AddToFaction(CrimeBobbisPlace)
Alias_Bobbi.GetActorRef().RemoveFromFaction(pPlayerAllyFaction)
Alias_Bobbi.GetActorRef().SetCrimeFaction(CrimeBobbisPlace)

;Enable Bobbi's New Place Map Marker
;Currently, the map marker starts enabled
;BobbisNewPlaceMapMarker.Enable()

;If MS04 is complete, make Hancock unessential
;if MS04.GetStageDone(9100)
;  Alias_Hancock.GetActorRef().GetActorBase().SetEssential(FALSE)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180)

;Setup FFGoodneighbor 07, Sided with Hancock
FFGoodneighbor07.Start()
FFGoodneighbor07.SetStage(3)
FFGoodneighbor07.SetStage(9)

;If player convince Bobbi's to leave, set stage in FFG07. Otherwise, set death stage
if GetStageDone(230)
  FFGoodneighbor07.SetStage(4)
else
  FFGoodneighbor07.SetStage(55)
endif

;If MS04 is complete, set Hancock unessential
;if MS04.GetStageDone(9100)
;  Alias_Hancock.GetActorRef().GetActorBase().SetEssential(FALSE)
;endif

;Shutdown MS16
pMS16.setstage(500)

;XP Rewards
;Game.RewardPlayerXP(pXPMiscQuestFinal.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Update Global for Radio News
RadioDCMS16Ready.SetValue((GameDaysPassed.GetValue() + 1))


pMS16.stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property PlayerStool Auto Const

ReferenceAlias Property Alias_Casey Auto Const

ObjectReference Property TunnelStartCenterMarker Auto Const

ReferenceAlias Property Alias_Mel Auto Const

ObjectReference Property TunnelDoor Auto Const

ObjectReference Property FahrenheitSpot Auto Const

ReferenceAlias Property Alias_Fahrenheit Auto Const

ObjectReference Property BobbiStartSpot Auto Const

ObjectReference Property PlayerStartSpot Auto Const

ReferenceAlias Property Alias_Bobbi Auto Const

ObjectReference Property BobbiTunnelStartTarget Auto Const

Quest Property MS16MiscObj Auto Const

Scene Property pMS16WorkersAmbushedScene Auto Const

ReferenceAlias Property Alias_FirstDirtWall Auto Const

ObjectReference Property pMS16BobbiMeetsPlayerDCMarker Auto Const

ObjectReference Property pMS16BobbiInTunnelStage1 Auto Const

RefCollectionAlias Property Alias_Phase1DirtWalls Auto Const

ReferenceAlias Property Alias_Worker01Start Auto Const

ReferenceAlias Property Alias_Worker02 Auto Const

ReferenceAlias Property Alias_Worker01 Auto Const

ReferenceAlias Property Alias_Phase1MirelurksEnabler Auto Const

ObjectReference Property pMS16MelDigPhase1Marker Auto Const

RefCollectionAlias Property Alias_Phase1DirtWalls01 Auto Const

RefCollectionAlias Property Alias_Phase3DirtWalls Auto Const

ObjectReference Property pMS16BobbiPhase2Marker Auto Const

ObjectReference Property pMS16MelPhase2Marker Auto Const

ObjectReference Property pMS16SonyaPhase2Marker Auto Const

ObjectReference Property pMS16SonyaPhase3Marker Auto Const

ObjectReference Property pMS16BobbiPhase3Marker Auto Const

ObjectReference Property pMS16MelPhase3Marker Auto Const

ObjectReference Property pMS16CaseyPhase3Marker Auto Const

ObjectReference Property pMS16BobbiFinalPositionMarker Auto Const

ObjectReference Property pMS16MelFinalPositionMarker Auto Const

ReferenceAlias Property Alias_FahrenheitFightMarker Auto Const

Scene Property pMS16FahrenheitScene Auto Const

ReferenceAlias Property Alias_NHandMDoor Auto Const

ObjectReference Property pDoorHatch Auto Const

Quest Property pMS16 Auto Const

Scene Property pMS16BobbiOpensDoor Auto Const

ObjectReference Property pMS16BobbisDoor Auto Const

Scene Property pMS16MelRunsOutofJail Auto Const

ObjectReference Property RockWall01Trigger Auto Const

ObjectReference Property RockWall02Trigger Auto Const

Scene Property pMS16TheGangSurveysTheSubway Auto Const

Scene Property pMS16TheGangSurveysTheBasements Auto Const

Scene Property pMS16NahantCaseyandRobotScene Auto Const

Explosion Property RockWallExplosion Auto Const

Explosion Property pStoneBreakingPulse01explosion Auto Const

RefCollectionAlias Property Alias_SewerWallGates02 Auto Const

Scene Property pMS16SonyaBlastsTheSewers02 Auto Const

Faction Property pPlayerAllyFaction Auto Const

Scene Property pMS16SonyaBlastsTheSewers03 Auto Const

Scene Property pMS16CaseyDestroysFirstRockScene Auto Const

RefCollectionAlias Property Alias_SubwayWallGates01 Auto Const

Outfit Property pMS16BobbiOutfitDCDisguise Auto Const

Outfit Property pMS16BobbiOutfit Auto Const

RefCollectionAlias Property Alias_BasementWallGates01 Auto Const

RefCollectionAlias Property Alias_BasementWallGates02 Auto Const

Scene Property pMS16SonyaBlastsTheBasements02 Auto Const

Scene Property pMS16TheGangGetsToTheNHMBasement Auto Const

ObjectReference Property OutsideNHMBasementMarker Auto Const

Scene Property pMS16CaseyDestroysThirdRockScene Auto Const

ReferenceAlias Property Alias_RockWall03 Auto Const

ObjectReference Property NHMBasementToggle Auto Const

Cell Property pNHandMFreightDepot01 Auto Const

Scene Property pMS16CaseyReacquaintsHerself Auto Const

Faction Property pPlayerEnemyFaction Auto Const

Scene Property pMS16BobbisDeathAftermath Auto Const

Faction Property pCrimeGoodneighbor Auto Const

Scene Property pMS16BobbiAsksPlayerToOpenTrain Auto Const

ObjectReference Property pMS16FinalExplosionMarker Auto Const

Explosion Property pBreakableRockWallGate01explosion Auto Const

ReferenceAlias Property Alias_NHMTrainCarDoor Auto Const

Scene Property pMS16BobbiGiveDirectionsForDig Auto Const

Keyword Property pAnimFlavorFahrenheit Auto Const

ObjectReference Property pMS16FahrenheitSceneBobbiMarker Auto Const

ObjectReference Property pMS16FahrenheitSceneMelMarker Auto Const

ObjectReference Property pMS16FahrenheitSceneCaseyMarker Auto Const

Quest Property FFGoodneighbor07 Auto Const

ReferenceAlias Property Alias_DmndCitySecurityJailDoor Auto Const

ReferenceAlias Property FirstRockWall Auto Const

ReferenceAlias Property Alias_Sonya Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMS16Ready Auto Const

Quest Property pFFDiamondCity10 Auto Const



ReferenceAlias Property Alias_Hancock Auto Const

Quest Property MS04 Auto Const

Faction Property CrimeBobbisPlace Auto Const

Faction Property FFGoodneighbor07BobbiFaction Auto Const

GlobalVariable Property pXPMiscQuestFinal Auto Const

Scene Property pMS16MelBobbiFightStartScene Auto Const

ObjectReference Property BobbisNewPlaceMapMarker Auto Const

MiscObject Property Caps001 Auto Const

Scene Property pMS16BobbiMelPreDigScene Auto Const

ObjectReference Property pMS16NHMSecurityGate Auto Const



Scene Property pMS16AmbientReachedSubway Auto Const

Scene Property pMS16AmbientReachedIndustrial Auto Const

ActorValue Property pConfidence Auto Const

ObjectReference Property MS16SonyaDeadTrigger Auto Const

LeveledItem Property pLL_MS16FahrenheitFlamer Auto Const

ObjectReference Property pMS16NHMSecurityDoor Auto Const

Key Property pMS16StrongroomKey Auto Const

Scene Property pMS16BobbiAndMelToTrainCar Auto Const

ReferenceAlias Property Alias_FahrenheitTriggerman01 Auto Const

ReferenceAlias Property Alias_FahrenheitTriggerman02 Auto Const

Faction Property pMS16TriggermanFaction Auto Const

Sound Property pFXExplosionEyebotStonebreakingPulseFinal Auto Const

ReferenceAlias Property Alias_Fahrenheit_Gun Auto Const

ObjectMod Property pmod_Legendary_Weapon_IncendiaryBullets Auto Const

Quest Property pDialogueGoodneighborEntrance Auto Const Mandatory

