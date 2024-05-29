;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity12_0014BF48 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Riley.GetActorRef().Enable()
Alias_Kyle.GetActorRef().Enable()

Alias_MarketBatGuard.GetActorRef().Disable()
Alias_MarketPatrollerGuard.GetActorRef().Disable()
Alias_Eyebot.GetActorRef().Disable()

;Piper and Nat scene gets skipped
DialogueDiamondCityEntrance.SetStage(97)

;make everyone scared
int icount = Alias_GenericNPCs.GetCount()
int iindex = 0
while (iindex < icount)
  Actor myActor = (Alias_GenericNPCs.GetAt(iindex) as Actor)
  myActor.ChangeAnimArchetype(AnimArchetypeScared)
  myActor.moveto(myactor.GetLinkedRef(LinkFFDiamondCity12))
  iindex = iindex + 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
FFDiamondCity12BeginOnStartScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
FFDiamondCity12BeginOnStartScene.Stop()
FFDiamondCity12Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_Kyle.GetActorRef().Kill()
SetStage(50)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Actor KyleREF = Alias_Kyle.GetActorRef()

KyleREF.Dismember( "Head1", true, false)

;kill him just in case
Utility.Wait(0.1)
KyleREF.Kill()

;tell all the generic NPCs to cower
int icount = Alias_GenericNPCs.GetCount()
int iindex = 0
while (iindex < icount)
  Actor myActor = (Alias_GenericNPCs.GetAt(iindex) as Actor)
  myActor.PlayIdle(CowerSinglePlay)
  iindex = iindex + 1
endwhile

;tell named NPCs to cower
Alias_Arturo.GetActorRef().PlayIdle(CowerSinglePlay)
Alias_MoeCronin.GetActorRef().PlayIdle(CowerSinglePlay)
Alias_Myrna.GetActorRef().PlayIdle(CowerSinglePlay)
Alias_Solomon.GetActorRef().PlayIdle(CowerSinglePlay)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Actor KyleREF = Alias_Kyle.GetActorRef()

KyleREF.AddtoFaction(DiamondCityEnemyFaction)
KyleREF.AddtoFaction(PlayerEnemyFaction)
KyleREF.SetValue(Aggression, 2)
KyleREF.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
FFDiamondCity12KyleDyingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Guard02.GetActorRef().EvaluatePackage()
Alias_Riley.GetActorRef().EvaluatePackage()

FFDiamondCity12Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity12Script
Quest __temp = self as Quest
FFDiamondCity12Script kmyQuest = __temp as FFDiamondCity12Script
;END AUTOCAST
;BEGIN CODE
kmyquest.StartTimerGameTime(0.25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
Alias_Riley.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
FFDiamondCity12EndScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;tell all the generic NPCs to disperse and make sure everyone flips back to neutral
int icount = Alias_GenericNPCs.GetCount()
int iindex = 0
while (iindex < icount)
  Actor myNPC = (Alias_GenericNPCs.GetAt(iindex) as Actor)
  myNPC.ChangeAnimArchetype()
  myNPC.EvaluatePackage()
  iindex = iindex + 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;kill Kyle
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor RileyREF = Alias_Riley.GetActorRef()
Actor KyleREF = Alias_Kyle.GetActorRef()
Actor Guard01REF = Alias_Guard01.GetActorRef()
Actor Guard02REF =Alias_Guard02.GetActorRef()

RileyREF.Disable()
KyleREF.Disable()
Guard01REF.Disable()
Guard02REF.Disable()

RileyREF.Delete()
KyleREF.Delete()
Guard01REF.Delete()
Guard02REF.Delete()

Alias_MarketBatGuard.GetActorRef().Enable()
Alias_MarketPatrollerGuard.GetActorRef().Enable()
Alias_Eyebot.GetActorRef().Enable()

;tell all the generic NPCs to be normal
int icount = Alias_GenericNPCs.GetCount()
int iindex = 0
while (iindex < icount)
  Actor myActor = (Alias_GenericNPCs.GetAt(iindex) as Actor)
  myActor.ChangeAnimArchetype()
  myActor.ChangeAnimFlavor()
  myActor.EvaluatePackage()
  iindex = iindex + 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Riley Auto Const

ReferenceAlias Property Alias_Kyle Auto Const

ReferenceAlias Property Alias_MarketBatGuard Auto Const

LocationAlias Property Alias_DiamondCitySecurityOfficeLocation Auto Const

ReferenceAlias Property Alias_MarketPatrollerGuard Auto Const

Keyword Property AnimFlavorHandsUp Auto Const

Scene Property FFDiamondCity12Scene Auto Const

ReferenceAlias Property Alias_Guard02 Auto Const

Scene Property FFDiamondCity12Scene02 Auto Const

RefCollectionAlias Property Alias_GenericNPCs Auto Const

ReferenceAlias Property Alias_EyeBot Auto Const

WorldSpace Property DiamondCity Auto Const

ReferenceAlias Property Alias_Guard01 Auto Const

Scene Property FFDiamondCity12KyleDyingScene Auto Const

Scene Property FFDiamondCity12BeginOnStartScene Auto Const

Quest Property DialogueDiamondCityEntrance Auto Const

ReferenceAlias Property Alias_RileyInspectMarker Auto Const

Faction Property DiamondCityEnemyFaction Auto Const

Faction Property PlayerEnemyFaction Auto Const

ActorValue Property Aggression Auto Const

Scene Property FFDiamondCity12EndScene Auto Const

Keyword Property AnimArchetypeScared Auto Const

Keyword Property AnimFlavorBombReaction Auto Const

Keyword Property LinkFFDiamondCity12 Auto Const

Idle Property cowerSinglePlay Auto Const

ReferenceAlias Property Alias_MoeCronin Auto Const

ReferenceAlias Property Alias_Arturo Auto Const

ReferenceAlias Property Alias_Myrna Auto Const

ReferenceAlias Property Alias_Solomon Auto Const
