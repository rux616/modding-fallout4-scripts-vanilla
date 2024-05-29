;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS01_000229F6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().Additem(BobbyPin,10)
Game.GetPlayer().Additem(Caps001,200)

Game.GetPlayer().MoveTo(MS01StartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Billy has mentioned the town where he lives
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; PC exits Billy-inside-fridge conversation early. "I'll think about it"

MS01RefrigeratorDoor.BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
; PC told Billy he wouldn't let him out.

MS01RefrigeratorDoor.BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
; PC exits out of fridge  conversation with Billy, "Let me think about it"

MS01MiscObj.SetObjectiveCompleted(10, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; PC told Billy he wouldn't take him home.

MS01MiscObj.SetObjectiveCompleted(10, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
; PC has activated the fridge. Doesn't matter how the conversation went.

MS01RefrigeratorDoor.BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
if MS01.GetStageDone(100) == false
    MS01RefrigeratorDoor.BlockActivation(true)  
    MS01PCnearFridge.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MS01MiscObj.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
alias_Billy.GetActorRef().SetGhost(false)

MS01MiscObj.SetObjectiveCompleted(10, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
MS01BillyOutOfFridge.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
MUSDreadShort.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
MUSDreadShort.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
MUSStingerShort.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_StrangeVoice.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveFailed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
MS01BulletFaction.SetEnemy(PlayerFaction)
MS01BulletFaction.SetEnemy(PeabodyFaction)
Alias_Bullet.GetActorRef().StartCombat(Game.GetPlayer())

 SetObjectiveCompleted(1050, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Alias_MattPeabody.GetActorRef().AddToFaction(CaptiveFaction)
Alias_CarolPeabody.GetActorRef().AddToFaction(CaptiveFaction)
Alias_Billy.GetActorRef().AddToFaction(CaptiveFaction)
Alias_Bullet.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(1050, true)
SetObjectiveDisplayed(45, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1050, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400, false)

Alias_MattPeabody.GetActorRef().RemoveFromFaction(CaptiveFaction)
Alias_CarolPeabody.GetActorRef().RemoveFromFaction(CaptiveFaction)
Alias_Billy.GetActorRef().RemoveFromFaction(CaptiveFaction)
MS01BillyWithBullet.SetValue(0.0)

If MS01.GetStageDone(1000) == true
    SetObjectiveDisplayed(1000, true)
endif

If MS01.GetStageDone(1100) == true
    SetStage(1300)
EndIf

If MS01.GetStageDone(45) == true
    SetObjectiveCompleted(45, true)
EndIf

If MS01.GetStageDone(500) == True
    SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
MS01MiscObjSold.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
MS01RefrigeratorDoor.BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Billy has been let out.

MS01MiscObj.SetObjectiveCompleted(10, true)
MS01MiscObj.Stop()
SetObjectiveDisplayed(100, true)

MS01BillyStart.Stop()
MS01BillyGetOut.Start()

Alias_Billy.GetActorRef().RemoveFromFaction(CaptiveFaction)
Alias_Billy.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; player agrees to take Billy home

Alias_QuincyRuinsMapMarker.GetRef().AddToMap()
Alias_Bullet.GetRef().Enable(true)
 alias_Billy.GetActorRef().SetGhost(false)

MS01MiscObj.SetObjectiveCompleted(10, true)
SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(200, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Player convinces Billy to live with him.

SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(500, true)

Alias_Bullet.GetRef().Enable(true)
 alias_Billy.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; slaver has made offer

SetObjectiveDisplayed(400, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Player sells Billy to Bullet thegunner

SetStage(400)
SetObjectiveCompleted(300, true)
SetObjectiveCompleted(400, true)
MS01BillyWithBullet.SetValue(1.0)    ; Global flag to track Billy's state

If GetStageDone(35) == true || GetStageDone(31) == false
    game.GetPlayer().Additem(Caps001, 200)
ElseIf GetStageDone(33) == true
    game.GetPlayer().Additem(Caps001, 350)
ElseIf GetStageDone(32) == true
    game.GetPlayer().Additem(Caps001, 300)
ElseIf GetStageDone(31) == true
    game.GetPlayer().Additem(Caps001, 250)
EndIf

;Update Global for Radio News
RadioDCMS01Ready.SetValue((GameDaysPassed.GetValue() + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
PeabodyFaction.SetAlly(PlayerFaction)
MS01PeabodyReunite.Start()

MS01MiscObjSold.SetStage(20)
Alias_MattPeabody.GetActorRef().GetActorBase().SetEssential(false)
Alias_CarolPeabody.GetActorRef().GetActorBase().SetEssential(false)
Alias_MattPeabody.GetActorRef().GetActorBase().SetProtected(true)
Alias_CarolPeabody.GetActorRef().GetActorBase().SetProtected(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Billy find his parents

SetObjectiveCompleted(200, true)
SetObjectiveCompleted(500, true)

MS01MiscObj.SetObjectiveCompleted(20, true)
MS01MiscObj.Stop()

MUSReward.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; start scene with bullet outside, if he is alive

If alias_Bullet.GetActorRef().GetActorBase().GetDeadCount() == 0
    alias_Bullet.GetRef().MoveTo(MS01BulletThreatenMarker)
    MS01BulletMinion01Marker.PlaceActorAtMe( MS01BulletMinion, 2)
    MS01BulletMinion02Marker.PlaceActorAtMe( MS01BulletMinion, 2)
    MS01BulletMinion03Marker.PlaceActorAtMe( MS01BulletMinion, 2)
    Utility.Wait(5)
    SetObjectiveDisplayed(1050, true)
    MS01BulletSurround.Start()
else
    SetObjectiveDisplayed(1000, true)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; player gets reward

if MS01.GetStageDone(500) == false
    game.GetPlayer().AddItem(Caps001, Reward)
else
    game.GetPlayer().AddItem(Caps001, BigReward)
endif

SetObjectiveCompleted(1000, true)

;If MS01.GetStageDone(45) == true
    SetStage(1300)
;EndIf

;Update Global for Radio News
RadioDCMS01Ready.SetValue((GameDaysPassed.GetValue() + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1050, true)
Alias_Billy.GetActorRef().SetPlayerTeammate(false)

;Update Global for Radio News
RadioDCMS01Ready.SetValue((GameDaysPassed.GetValue() + 1))

MS01PostQuest.Start()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS01MiscObj Auto Const

ObjectReference Property MS01RefrigeratorDoor Auto Const

ReferenceAlias Property Alias_QuincyRuinsMapMarker Auto Const

ReferenceAlias Property Alias_Billy Auto Const

ReferenceAlias Property Alias_MattPeabody Auto Const

MiscObject Property BobbyPin Auto Const

ObjectReference Property MS01StartMarker Auto Const

Scene Property MS01PCnearFridge Auto Const

MiscObject Property Caps001 Auto Const

Int Property Reward Auto Const

ReferenceAlias Property Alias_Bullet Auto Const

ObjectReference Property MS01BulletThreatenMarker Auto Const

ObjectReference Property MS01BulletMinion01Marker Auto Const

ObjectReference Property MS01BulletMinion02Marker Auto Const

ObjectReference Property MS01BulletMinion03Marker Auto Const

ActorBase Property MS01BulletMinion Auto Const

Faction Property MS01BulletFaction Auto Const

Faction Property PlayerFaction Auto Const

Scene Property MS01BulletSurround Auto Const

Quest Property MS01 Auto Const

GlobalVariable Property RadioDCMS01Ready Auto Const

GlobalVariable Property GameDaysPassed Auto Const

ObjectReference Property MS01FridgeDoorRef Auto Const

Scene Property MS01PeabodyReunite Auto Const

Faction Property PeabodyFaction Auto Const

ReferenceAlias Property Alias_CarolPeabody Auto Const

Faction Property CaptiveFaction Auto Const

Quest Property MS01PostQuest Auto Const

GlobalVariable Property MS01BillyWithBullet Auto Const

Scene Property MS01BillyOutOfFridge Auto Const

Scene Property MS01BillyGetOut Auto Const

Quest Property MS01MiscObjSold Auto Const

ObjectReference Property MS01ReunionTrigger Auto Const

ObjectReference Property BillyRef Auto Const

ReferenceAlias Property Alias_StrangeVoice Auto Const

MusicType Property MUSDreadShort Auto Const

MusicType Property MUSReward Auto Const

MusicType Property MUSStingerShort Auto Const

Scene Property MS01BillyStart Auto Const Mandatory

Int Property BigReward Auto Const
